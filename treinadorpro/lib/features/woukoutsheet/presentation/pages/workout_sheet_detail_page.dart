import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/last_training_session_storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_training_storage_service.dart';
import 'package:treinadorpro/core/provider/training_session_provider.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/widgets/pro_widget_custom_loading_indicator.dart';
import 'package:treinadorpro/core/widgets/pro_widget_pin.dart';
import 'package:treinadorpro/core/widgets/pro_widget_warning_message.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/last_training_summary_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/booking_training_session_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/training_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/training_summary_page.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/contract_response_model.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/goal_model.dart';
import '../../../../core/data/models/modality_model.dart';
import '../../../../core/data/models/program_model.dart';
import '../../../../core/data/models/user_data_sheet_plan_model.dart';
import '../../../../core/data/models/user_workout_plan_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/key_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_data_sheet_plan_storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_session_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/utils/global.dart';
import '../../../../core/widgets/pro_widget_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../activestudents/presentation/pages/contract_schedule_edit_page.dart';
import '../blocs/build_workout_sheet_cubit.dart';
import '../widgets/workout_group_card.dart';
import 'booking_view_page.dart';

class WorkoutSheetDetailPage extends ConsumerStatefulWidget {
  const WorkoutSheetDetailPage({super.key});

  @override
  ConsumerState<WorkoutSheetDetailPage> createState() => _WorkoutSheetDetailPageState();
}

class _WorkoutSheetDetailPageState extends ConsumerState<WorkoutSheetDetailPage> {
  late final IContractRespository _contractRespository;
  late final AppConfig config;
  late Map<String, List<UserWorkoutPlanModel>> userWorkoutPlanData;
  late String _contractToken;
  late ContractResponseModel _contract;
  late ModalityModel? _modality; // = Modality.modalities.first;
  late GoalModel? _goal; // = Goal.goals.first;
  late UserDataSheetPlanModel _userDataSheetSaved;
  late Future<UserTrainingSessionModel?> _lastTrainingSessionFuture;
  late UserTrainingSessionModel? _lastTrainingSessionInstance;

  ProgramModel? _program; // = Program.programs.first;
  List<UserWorkoutPlanModel>? exerciseList;
  bool _isEnableStartTrainingButton = false;
  bool _isOrderMapStarted = false;
  bool _isPendingSync = false;

  int orderCounter = 0;
  Map<String, int> orderMap = {};

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final UserDataSheetPlanStorageService _userPlanDraft = UserDataSheetPlanStorageService();
  final KeyStorageService<List<UserWorkoutPlanModel>> _userTrainingStorage =
      UserTrainingStorageService();
  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage =
      UserTrainingSessionStorageService();

  final KeyStorageService<UserTrainingSessionModel> _lastTrainingSessionStorage =
      LastTrainingSessionStorageService();

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    userWorkoutPlanData = {};

    // vai ser usado futuramente
    _contractRespository = ref.read(contractRepositoryProvider);

    Future.microtask(() async {
      _contractToken = (await _contractTokenStorage.get())!;
      print('_contractToken => $_contractToken');
      _lastTrainingSessionFuture = _userTrainingSessionStorage.get(_contractToken);

      ref.read(findContractViewModelProvider.notifier).findContract(_contractToken);

      ref
          .read(findUserWorkoutDataSheetPlanViewModelProvider.notifier)
          .findUserWorkoutDataSheetPlan(_contractToken);

      ref
          .read(findMostRecentTrainingSessionViewModelProvider.notifier)
          .findMostRecentTrainingSession(_contractToken);

      ref
          .read(findMostRecentBookingTrainingSessionViewModelProvider.notifier)
          .findMostRecentBookingTrainingSession(_contractToken);
    }); //END Future.microtask
  }

  Widget _buildForm(BuildContext context, HandlerState state, AppConfig config) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: _buildFormArea(state, context, config),
      ),
    );
  }

  Widget _buildContractCard(ContractResponseModel contract) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  contract.studentUser.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text('${contract.description} • ${contract.trainingPack.description}'),
            Text('📍 ${contract.workoutSite}'),
          ],
        ),
      ),
    );
  }

  void _initOrderMap(Map<String, List<UserWorkoutPlanModel>> workgroupMap) {
    workgroupMap.forEach((key, value) => orderMap[key] = 0);
  }

  Widget _buildLastTrainingSessionPanel(UserTrainingSessionModel? trainingSession) {
    if (trainingSession == null) return SizedBox.shrink();
    if (trainingSession.progressStatus == 'FINISHED' && trainingSession.syncStatus == 'SUCCESS') {
      return SizedBox.shrink();
    }

    // workout has been stopped abnormally
    if(trainingSession.progressStatus == 'STARTED' && trainingSession.syncStatus == 'PENDING') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          ProWidgetWarningMessage(
            pinMessage:
            'Existe um treino em andamento em ${getDateTimeToDate(trainingSession.startedAt!)} que não foi concluído',
            actionButtonLabel: 'CONTINUAR TREINO',
            onWarningPressed: () {
              _userTrainingSessionStorage.save(trainingSession, _contractToken);
              Navigator.popAndPushNamed(context, AppRoutes.trainingPage);
            },
            actionButtonIcon: Icon(Icons.fitness_center),
          ),
        ],
      );
    }

    // training is pending to sync
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        ProWidgetWarningMessage(
          pinMessage:
              'Existe um treino realizado em ${getDateTimeToDate(trainingSession.finishedAt!)} e não foi enviado para a ficha do aluno ${trainingSession.progressStatus} Sync=${trainingSession.syncStatus}',
          actionButtonLabel: 'SINCRONIZAR ÚLTIMO TREINO',
          onWarningPressed: () {
            _userTrainingSessionStorage.save(trainingSession, _contractToken);
            Navigator.popAndPushNamed(context, AppRoutes.trainingSummaryPage);
          },
          actionButtonIcon: Icon(Icons.refresh),
        ),
      ],
    );
  }

  Widget _lastTrainingSessionBuilder(
    BuildContext context,
    AsyncSnapshot<UserTrainingSessionModel?> snapshot,
  ) {
    {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: ProWidgetCustomLoadingIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data == null) {
        return SizedBox.shrink(); // No data found!
      } else {
        // Now... we have data and we can call method
        _lastTrainingSessionInstance = snapshot.data!;
        _isPendingSync = true;
        return _lastTrainingSessionInstance?.progressStatus == 'BOOKING'
            ? SizedBox.shrink()
            : _buildLastTrainingSessionPanel(_lastTrainingSessionInstance);
      }
    }
  }

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config) {
    final userDataSheetState = ref.watch(findUserWorkoutDataSheetPlanViewModelProvider);
    final contractState = ref.watch(findContractViewModelProvider);
    final trainingSessionState = ref.watch(findMostRecentTrainingSessionViewModelProvider);
    final trainingSessionBookingState = ref.watch(
      findMostRecentBookingTrainingSessionViewModelProvider,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // student
          contractState.when(
            data: (contract) {
              _contract = contract.objectResponse;
              return _buildContractCard(contract.objectResponse);
            },
            error: (e, _) => Center(child: Text('error: $e')),
            loading: () => Center(child: ProWidgetCustomLoadingIndicator()),
          ),

          // latest workout session
          SizedBox(width: 8, height: 16),
          Wrap(
            children: [
              trainingSessionState.when(
                data: (data) {
                  if (data != null) {
                    UserTrainingSessionModel trainingSessionModel = data.objectResponse;
                    trainingSessionModel.userWorkoutPlanList?.forEach(
                      (e) => e.trainingStatus = 'DONE',
                    );
                    // _userTrainingSessionStorage.save(trainingSessionModel, _contractToken);
                    _lastTrainingSessionStorage.save(trainingSessionModel, _contractToken);

                    return ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LastTrainingSummaryPage()),
                      ),
                      icon: Icon(Icons.history),
                      label: Text('Ver Treino Anterior'),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
                error: (e, _) => Text('Error: $e'),
                loading: () => Row(
                  children: [
                    Text('buscando último treino'),
                    SizedBox(width: 8),
                    ProWidgetCustomLoadingIndicator(),
                  ],
                ),
              ),
              SizedBox(width: 8, height: 40),
              ElevatedButton.icon(
                onPressed: () => Navigator.popAndPushNamed(context, AppRoutes.bookingViewPage),
                icon: Icon(Icons.calendar_month),
                label: Text('Agenda de Treinos'),
              ),

              // edit training schedule
              SizedBox(width: 8, height: 40),
              ElevatedButton.icon(
                onPressed: () async {
                  await _contractTokenStorage.save(_contractToken);
                  print('active_contracts_page => token $_contractToken saved');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ContractScheduleEditPage()),
                  );
                },
                icon: Icon(Icons.edit_calendar),
                label: Text('Modificar Horário de Treino'),
              ),
            ],
          ),

          // booked session
          trainingSessionBookingState.when(
            data: (data) => _buildBookingDateAlert(data.objectResponse),
            error: (e, _) => SizedBox.shrink(),
            loading: () => ProWidgetCustomLoadingIndicator(),
          ),

          // pin message
          SizedBox(height: 16),
          ProWidgetPin(
            pinMessage:
                'Selecione abaixo os exercícios na ordem que você deseja treinar com seu aluno agora ou agendar para um data posterior.',
          ),

          // sync pending
          FutureBuilder(
            future: _lastTrainingSessionFuture,
            builder: (context, snapshot) => _lastTrainingSessionBuilder(context, snapshot),
          ),

          // exercise list
          SizedBox(height: 16),
          userDataSheetState.when(
            data: (data) {
              if (!_isOrderMapStarted) {
                _initOrderMap(data.objectResponse.plan);
                _isOrderMapStarted = true;
              }
              return _buildExercisesListView(context, data.objectResponse);
            },
            error: (e, _) => Center(child: Text('error: $e')),
            loading: () => Center(child: CircularProgressIndicator()),
          ),

          // start workout button
          SizedBox(height: 16),
          if (_isEnableStartTrainingButton)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showAlertDialogStartTraining(context),
                  icon: Icon(Icons.play_circle),
                  label: Text('Iniciar Sessão de Treino'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                  ),
                ),
                Text('OU'),
                ElevatedButton.icon(
                  onPressed: () {
                    getInstanceUserTrainingSessionModel().then((userTrainingSessionModel) {
                      userTrainingSessionModel.startedAt = DateTime.now();

                      _userTrainingSessionStorage.save(userTrainingSessionModel, _contractToken);
                      _contractTokenStorage.save(_contractToken);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BookingTrainingSessionPage()),
                      );
                      setState(() {
                        orderMap.forEach((key, value) => orderMap[key] = 0);
                        orderCounter = 0;
                      });
                    });
                  }, //julio
                  icon: Icon(Icons.calendar_month),
                  label: Text('Programar Agenda de Treino'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                  ),
                ),
              ],
            ),

          // change workout plan button
          SizedBox(height: 16),
          if (!_isEnableStartTrainingButton)
            ElevatedButton.icon(
              onPressed: () {
                _contractTokenStorage.save(_contract.externalId);
                _userPlanDraft.save(_userDataSheetSaved, _contract.externalId);
                Navigator.popAndPushNamed(context, AppRoutes.buildWorkout);
              },
              icon: Icon(Icons.check),
              label: Text('Modificar Ficha de Treino'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: Size.fromHeight(50),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExercisesListView(BuildContext context, UserDataSheetPlanModel data) {
    final workoutEntries = data.plan.entries.toList();
    _modality = data.modality;
    _goal = data.goal;
    _program = data.program;
    _userDataSheetSaved = data;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: workoutEntries.length,
      itemBuilder: (context, index) {
        final entry = workoutEntries[index];
        return WorkoutGroupCard(
          showExercises: false,
          deleteButtonVisible: false,
          trainingButtonVisible: true,
          groupName: entry.key,
          order: orderMap[entry.key],
          exercises: entry.value,
          onAddOrderMap: (workgroup) {
            setState(() {
              orderMap[workgroup] = ++orderCounter;
            });
          },
          onDeleteOrderMap: (workgroup) {
            --orderCounter;
            int? order = orderMap[workgroup];
            orderMap[workgroup] = 0;
            orderMap.forEach((key, value) {
              if (value > order!) {
                setState(() {
                  orderMap[key] = --value;
                });
              }
            });
          },
          onAddExerciseList: (list) async {
            setState(() {
              exerciseList ??= [];
              exerciseList!.removeWhere((item) => list.contains(item));
              exerciseList!.addAll(list);
              list.forEach((item) => print('${item.exercise?.namePt}'));
              print('Lista em andamento ${exerciseList?.length}');
              if (exerciseList!.isNotEmpty) {
                _isEnableStartTrainingButton = true;
                _userTrainingStorage.save(exerciseList!, _contract.externalId);
              }
            });
          },
          onDeleteExerciseList: (list) async {
            setState(() {
              exerciseList ??= [];
              exerciseList!.removeWhere((item) => list.contains(item));
              _userTrainingStorage.save(exerciseList!, _contract.externalId);
              if (exerciseList!.isEmpty) {
                _isEnableStartTrainingButton = false;
                _userTrainingStorage.clear(_contract.externalId);
              }
            });
          },
        );
      },
    );
  }

  Future<UserTrainingSessionModel> getInstanceUserTrainingSessionModel() async {
    List<UserWorkoutPlanModel>? userWorkoutPlanList = await _userTrainingStorage.get(
      _contract.externalId,
    );
    UserTrainingSessionModel instance = UserTrainingSessionModel(
      contract: _contract,
      userWorkoutPlanList: userWorkoutPlanList,
    );
    return instance;
  }

  void _showAlertDialogStartTraining(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProWidgetAlertDialog(
        title: 'Vamos treinar com ${_contract.studentUser.name}?',
        proceedButton: 'Sim, vamos começar',
        onProceed: () {
          Navigator.of(context).pop();
          getInstanceUserTrainingSessionModel().then((userTrainingSessionModel) {
            userTrainingSessionModel.startedAt = DateTime.now();
            userTrainingSessionModel.progressStatus = 'STARTED';

            _userTrainingSessionStorage.save(userTrainingSessionModel, _contractToken);
            _contractTokenStorage.save(_contractToken);
            Navigator.popAndPushNamed(context, AppRoutes.trainingPage);
          });
        },
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  Future<void> _processFormListenerFromCubitStateChanged(
    BuildContext context,
    HandlerState state,
  ) async {
    if (state.errorMessage != null) {
      final ExceptionApiModel exceptionApiModel = state.objectResponse as ExceptionApiModel;

      print("statusCode = ${exceptionApiModel.statusCode}");
      print("msgcode = ${exceptionApiModel.msgcode}");
      print("message = ${exceptionApiModel.message}");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(title: Text('Sucesso'), content: Text("Plano Salvo")),
      );

      // Navigator.popAndPushNamed(context, AppRoutes.workoutSheetPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BuildWorkoutSheetCubit(_contractRespository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ficha de Treino'),
          actions: [
            ProWidgetInfoAlertDialog(title: 'page', text: 'workout_sheet_detail_page.dart'),
          ],
        ),
        body: BlocConsumer<BuildWorkoutSheetCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }

  Widget _buildBookingDateAlert(UserTrainingSessionModel trainingSession) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.shade800, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Temos treino de ${getWorkgroups(trainingSession)} agendado para hoje",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  trainingSession.progressStatus = 'STARTED';
                  trainingSession.startedAt = DateTime.now();
                  trainingSession.bookingExternalId = trainingSession.externalId;
                  await _userTrainingSessionStorage.save(trainingSession, _contractToken);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => TrainingPage()));
                },
                child: Text("Vamos Treinar?"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
