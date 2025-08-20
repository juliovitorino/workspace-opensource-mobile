import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/key_storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_workout_plan_storage_service.dart';
import 'package:treinadorpro/core/provider/training_session_provider.dart';
import 'package:treinadorpro/core/states/handler_state.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_pin.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/models/user_training_session_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_session_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/utils/alert.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../blocs/training_page_cubit.dart';

class BookingDetailViewPage extends ConsumerStatefulWidget {
  const BookingDetailViewPage({super.key});

  @override
  ConsumerState<BookingDetailViewPage> createState() => _BookingDetailViewPageState();
}

class _BookingDetailViewPageState extends ConsumerState<BookingDetailViewPage> {
  late final IContractRespository _contractRepository;
  late final AppConfig config;
  late String _contractToken;
  late Future<UserTrainingSessionModel?> _userTrainingSessionModelFuture;
  late UserTrainingSessionModel userTrainingSessionModelInstance;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final KeyStorageService<UserWorkoutPlanModel> _userWorkoutPlanStorageService =
      UserWorkoutPlanStorageService();
  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage =
      UserTrainingSessionStorageService();

  late int totalCompletedExercise;
  late int totalExercise;
  late int trainingTime;

  late bool trainingHasStarted;

  bool _hideButtonFinishTrainingSession = false;
  TextEditingController _newBookingDate = TextEditingController();

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    // vai ser usado futuramente
    _contractRepository = ref.read(contractRepositoryProvider);

    _initData();
  }

  void _initData() async {
    _contractToken = (await _contractTokenStorage.get())!;
    setState(() {
      _userTrainingSessionModelFuture = _userTrainingSessionStorage.get(_contractToken);
      totalCompletedExercise = 0;
      totalExercise = 0;
      trainingTime = 0;
      trainingHasStarted = true;
    });
  }

  Widget _buildExercisesListView(List<UserWorkoutPlanModel>? trainingList, DateTime trainingDate) {
    _updateProgressIndicator(trainingList!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProWidgetInfoRow(label: 'Data do Treino', value: getDateTimeToDate(trainingDate)),
        ProWidgetInfoRow(
          label: 'Pacote',
          value: userTrainingSessionModelInstance.contract.trainingPack.description,
        ),
        ProWidgetInfoRow(
          label: 'Modalidade',
          value: userTrainingSessionModelInstance.contract.trainingPack.modality!.namePt,
        ),
        ProWidgetInfoRow(
          label: 'Programa',
          value: userTrainingSessionModelInstance.userWorkoutPlanList?[0].customProgram ?? userTrainingSessionModelInstance.userWorkoutPlanList![0].program!.namePt,
        ),
        ProWidgetInfoRow(
          label: 'Status Treino',
          value: '...',
          widget: ProWidgetTag(
            text: userTrainingSessionModelInstance.progressStatus,
            backgroundColor: Colors.white,
            borderColor: Colors.green,
          ),
        ),
        ProWidgetInfoRow(
          label: 'Sincronização',
          value: '...',
          widget: ProWidgetTag(
            text: userTrainingSessionModelInstance.syncStatus,
            backgroundColor: Colors.red,
            borderColor: Colors.red,
          ),
        ),

        // booking delete button
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            showAlertDialog(
              context,
              'TEM CERTEZA DE EXCLUIR ESTA AGENDA DE TREINO RESERVADA?',
              () {
                setState(() {
                 ref
                      .read(deleteTrainingSessionViewModelProvider.notifier)
                      .deleteTerainingSession(
                        _contractToken,
                        userTrainingSessionModelInstance.externalId!,
                      );
                });
                Navigator.of(context).pop();
                Navigator.of(context).pop(1);
              },
              () => Navigator.of(context).pop(),
            );
          },
          icon: Icon(Icons.delete_forever),
          label: Text('EXCLUIR AGENDA DE TREINO'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            minimumSize: Size.fromHeight(50),
          ),
        ),

        // move booking action button
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.move_up),
          label: Text('MOVER TREINO PARA OUTRA DATA'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            minimumSize: Size.fromHeight(50),
          ),
        ),

        SizedBox(height: 20,),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child:
          Column(
            children: [

              SizedBox(height: 20,),
              Row(
                children: [
                  Text(getDateTimeToDate(trainingDate)),
                  SizedBox(width: 20,),
                  Icon(Icons.arrow_forward, size: 32,),
                  SizedBox(width: 20,),
                  Expanded(
                    child: TextFormField(
                      controller: _newBookingDate,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'YYYY-MM-DD',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _newBookingDate.text =
                            '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.save),
                  label: Text('APLICAR'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                  ),
                ),
              ),
            ],
          ),

        ),

        // exercise list
        SizedBox(height: 40),
        ProWidgetSectionTitle(title: 'Lista de Exercícios'),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(12),
          itemCount: trainingList.length,
          itemBuilder: (context, index) => _buildExerciseCard(context, index, trainingList),
        ),
      ],
    );
  }

  Widget? _buildExerciseCard(
    BuildContext context,
    int index,
    List<UserWorkoutPlanModel>? trainingList,
  ) {
    final training = trainingList?[index];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    training!.workGroup.namePt.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                training.customExercise ?? training.exercise?.namePt ?? 'Exercício',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${training.qtySeries}x${training.qtyReps} • Tempo: ${training.executionTime}m • descanso: ${training.restTime}m',
                  ),
                  SizedBox(height: 8),
                  Chip(label: Text(training.executionMethod.toString())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _futureBuilderBuild(
    BuildContext context,
    AsyncSnapshot<UserTrainingSessionModel?> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erro: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('Nenhum dado encontrado.'));
    } else {
      // Now... we have data and we can call method
      userTrainingSessionModelInstance = snapshot.data!;

      final userWorkoutPlanList = snapshot.data!.userWorkoutPlanList;
      return _buildExercisesListView(userWorkoutPlanList, snapshot.data!.startedAt!);
    }
  }

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // exercise list from UserTrainingSessionModel
          FutureBuilder<UserTrainingSessionModel?>(
            future: _userTrainingSessionModelFuture,
            builder: (context, snapshot) => _futureBuilderBuild(context, snapshot),
          ),
        ],
      ),
    );
  }

  void _updateProgressIndicator(List<UserWorkoutPlanModel> userWorkoutPlanList) {
    totalExercise = userWorkoutPlanList.length;
    totalCompletedExercise = userWorkoutPlanList
        .where((e) => e.trainingStatus == 'DONE')
        .toList()
        .length;
  }

  Widget _buildForm(BuildContext context, HandlerState state, AppConfig config) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: _buildFormArea(state, context, config),
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

  void _checkExitPage(BuildContext context) {
    if (userTrainingSessionModelInstance.progressStatus == 'STARTED') {
      showAlertDialog(
        context,
        'Existe um treino em andamento. Fazendo isso o treino será perdido. Você tem certeza de sair?',
        () {
          Navigator.of(context).pop();
          _userTrainingSessionStorage.clear(_contractToken);
          Navigator.of(context).pop();
        },
        null,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingPageCubit(_contractRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('TREINO AGENDADO'),
          leading: IconButton(
            onPressed: () => _checkExitPage(context),
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            if (config.isDebugMode)
              ProWidgetInfoAlertDialog(title: 'page', text: 'booking_detail_view_page.dart'),
          ],
        ),
        body: BlocConsumer<TrainingPageCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close),
            label: Text('Fechar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              minimumSize: Size.fromHeight(50),
            ),
          ),
        ),
      ),
    );
  }
}
