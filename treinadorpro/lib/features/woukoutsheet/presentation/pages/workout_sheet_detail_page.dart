import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_training_storage_service.dart';
import 'package:treinadorpro/core/widgets/pro_widget_pin.dart';

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
import '../../../../core/widgets/pro_widget_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../blocs/build_workout_sheet_cubit.dart';
import '../widgets/workout_group_card.dart';

class WorkoutSheetDetailPage extends ConsumerStatefulWidget {
  const WorkoutSheetDetailPage({super.key});

  @override
  ConsumerState<WorkoutSheetDetailPage> createState() =>
      _WorkoutSheetDetailPageState();
}

class _WorkoutSheetDetailPageState
    extends ConsumerState<WorkoutSheetDetailPage> {
  late final IContractRespository _contractRespository;
  late final AppConfig config;
  late Map<String, List<UserWorkoutPlanModel>> userWorkoutPlanData;
  late String _contractToken;
  late ContractResponseModel _contract;
  late ModalityModel? _modality; // = Modality.modalities.first;
  late GoalModel? _goal; // = Goal.goals.first;
  late UserDataSheetPlanModel _userDataSheetSaved;

  ProgramModel? _program; // = Program.programs.first;
  List<UserWorkoutPlanModel>? exerciseList;
  bool _isEnableStartTrainingButton = false;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final UserDataSheetPlanStorageService _userPlanDraft = UserDataSheetPlanStorageService();
  final KeyStorageService<List<UserWorkoutPlanModel>> _userTrainingStorage = UserTrainingStorageService();
  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage = UserTrainingSessionStorageService();

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    userWorkoutPlanData = {};

    // vai ser usado futuramente
    _contractRespository = ref.read(contractRepositoryProvider);

    Future.microtask(() async {
      _contractToken = (await _contractTokenStorage.get())!;
      ref
          .read(findContractViewModelProvider.notifier)
          .findContract(_contractToken);

      ref
          .read(findUserWorkoutDataSheetPlanViewModelProvider.notifier)
          .findUserWorkoutDataSheetPlan(_contractToken);
    });
  }

  Widget _buildForm(
    BuildContext context,
    HandlerState state,
    AppConfig config,
  ) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
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
            Text(
              '${contract.description} • ${contract.trainingPack.description}',
            ),
            Text('📍 ${contract.workoutSite}'),
          ],
        ),
      ),
    );
  }

  Widget _buildFormArea(
    HandlerState state,
    BuildContext context,
    AppConfig config,
  ) {
    final userDataSheetState = ref.watch(
      findUserWorkoutDataSheetPlanViewModelProvider,
    );
    final contractState = ref.watch(findContractViewModelProvider);

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
            loading: () => Center(child: CircularProgressIndicator()),
          ),

          // pin message
          SizedBox(height: 16),
          ProWidgetPin(
            pinMessage:
                'Selecione abaixo os exercícios que você quer treinar com seu aluno',
          ),

          // exercise list
          SizedBox(height: 16),
          userDataSheetState.when(
            data: (data) =>
                _buildExercisesListView(context, data.objectResponse),
            error: (e, _) => Center(child: Text('error: $e')),
            loading: () => Center(child: CircularProgressIndicator()),
          ),

          // start workout button
          SizedBox(height: 16),
          if (_isEnableStartTrainingButton)
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

  Widget _buildExercisesListView(
    BuildContext context,
    UserDataSheetPlanModel data,
  ) {
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
          exercises: entry.value,
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
    List<UserWorkoutPlanModel>? userWorkoutPlanList = await _userTrainingStorage.get(_contract.externalId);
    UserTrainingSessionModel instance = UserTrainingSessionModel(contract: _contract, userWorkoutPlanList: userWorkoutPlanList);
    return instance;
  }

  void _showAlertDialogStartTraining(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProWidgetAlertDialog(
        title: 'Vamos treinar?',
        proceedButton: 'Sim, vamos começar',
        onProceed: () {
          Navigator.of(context).pop();
          getInstanceUserTrainingSessionModel().then((userTrainingSessionModel) {

            print('userTrainingSessionModel => ${jsonEncode(userTrainingSessionModel)}');
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
      final ExceptionApiModel exceptionApiModel =
          state.objectResponse as ExceptionApiModel;

      print("statusCode = ${exceptionApiModel.statusCode}");
      print("msgcode = ${exceptionApiModel.msgcode}");
      print("message = ${exceptionApiModel.message}");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      await showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(title: Text('Sucesso'), content: Text("Plano Salvo")),
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
            ProWidgetInfoAlertDialog(
              title: 'page',
              text: 'workout_sheet_detail_page.dart',
            ),
          ],
        ),
        body: BlocConsumer<BuildWorkoutSheetCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) =>
              _processFormListenerFromCubitStateChanged(context, state),
        ),
      ),
    );
  }
}
