import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/key_storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_workout_plan_storage_service.dart';
import 'package:treinadorpro/core/provider/training_session_provider.dart';
import 'package:treinadorpro/core/states/handler_state.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/utils/global.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/exercise_execution_page.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/vertical_video_player.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/widgets/exercise_progress_card.dart';

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

class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({super.key});

  @override
  ConsumerState<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends ConsumerState<TrainingPage> {
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
    final deleteTrainingSessionState = ref.watch(deleteTrainingSessionViewModelProvider);
    _updateProgressIndicator(trainingList!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProWidgetInfoRow(label: 'Data do Treino', value: getDateTimeToDT(trainingDate)),
        ProWidgetInfoRow(
          label: 'Pacote',
          value: userTrainingSessionModelInstance.contract.trainingPack.description,
        ),
        ProWidgetInfoRow(
          label: 'Modalidade',
          value: userTrainingSessionModelInstance.contract.trainingPack.modality!.namePt,
        ),
        ProWidgetInfoRow(
          label: 'Grupos',
          value: getWorkgroups(userTrainingSessionModelInstance)!,
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
        if (userTrainingSessionModelInstance.progressStatus == 'BOOKING')
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

        // Delete message area
        if (userTrainingSessionModelInstance.progressStatus == "BOOKING")
          deleteTrainingSessionState.when(
            data: (data) {
              return SizedBox.shrink();
            },
            error: (e, _) => Text('Error: $e'),
            loading: () => SizedBox.shrink(),
          ),

        // Performance exercise card
        if (userTrainingSessionModelInstance.progressStatus != 'FINISHED' &&
            userTrainingSessionModelInstance.progressStatus != 'BOOKING')
          ExerciseProgressCard(
            completed: totalCompletedExercise,
            total: totalExercise,
            trainingTime: trainingTime,
          ),
        SizedBox(height: 8),
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

  void _deleteExerciseButtonPressed(UserWorkoutPlanModel exerciseToDelete) {
    final String exerciseName =
        exerciseToDelete.customExercise ?? exerciseToDelete.exercise!.namePt;
    showAlertDialog(
      context,
      'Tem certeza de excluir o exercício $exerciseName do treino de hoje?',
      () {
        setState(() {
          userTrainingSessionModelInstance.userWorkoutPlanList?.removeWhere(
            (e) => e.control == exerciseToDelete.control,
          );
        });
        _userTrainingSessionStorage.save(userTrainingSessionModelInstance, _contractToken);
        Navigator.of(context).pop();
      },
      null,
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
                training.trainingStatus != 'DONE'
                    ? IconButton(
                        onPressed: () => _deleteExerciseButtonPressed(training),
                        icon: Icon(Icons.delete),
                      )
                    : SizedBox.shrink(),
                if(training.exercise != null && training.exercise!.videoUrlPt!.isNotEmpty)
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => VerticalVideoPlayer(url: training.exercise!.videoUrlPt!)));
                  }, icon: Icon(Icons.video_call))
              ],
            ),
            ListTile(
              trailing: training.trainingStatus == 'DONE'
                  ? Text('\u{1F3C5}', style: TextStyle(fontSize: 32))
                  : null,
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
                  training.trainingStatus == 'DONE' ||
                          userTrainingSessionModelInstance.progressStatus == 'FINISHED'
                      ? SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            ElevatedButton.icon(
                              onPressed: () {
                                _userWorkoutPlanStorageService.save(training, _contractToken);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => ExerciseExecutionPage()),
                                ).then((result) {
                                  if (result) {
                                    setState(() {
                                      _userTrainingSessionModelFuture = _userTrainingSessionStorage
                                          .get(_contractToken);
                                    });
                                  }
                                });
                              },
                              icon: Icon(Icons.play_arrow),
                              label: Text('INICIAR O EXERCÍCIO'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                minimumSize: Size.fromHeight(50),
                              ),
                            ),
                          ],
                        ),
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

      if (userTrainingSessionModelInstance.progressStatus != 'FINISHED') {
        userTrainingSessionModelInstance.syncStatus = 'PENDING';
        _userTrainingSessionStorage.save(userTrainingSessionModelInstance, _contractToken);
        trainingHasStarted = true;
      }

      final userWorkoutPlanList = snapshot.data!.userWorkoutPlanList;
      trainingTime = 0;
      userWorkoutPlanList?.forEach(
        (e) => trainingTime += int.parse(e.executionTime!) + int.parse(e.restTime!),
      );
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
          title: Text('Sessão de Treino'),
          leading: IconButton(
            onPressed: () => _checkExitPage(context),
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            if (config.isDebugMode)
              ProWidgetInfoAlertDialog(title: 'page', text: 'training_page.dart'),
          ],
        ),
        body: BlocConsumer<TrainingPageCubit, HandlerState>(
          builder: (context, state) => _buildForm(context, state, config),
          listener: (context, state) => _processFormListenerFromCubitStateChanged(context, state),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: _hideButtonFinishTrainingSession
              ? ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close),
                  label: Text('Fechar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size.fromHeight(50),
                  ),
                )
              : ElevatedButton.icon(
                  onPressed: () {
                    if (userTrainingSessionModelInstance.progressStatus != 'FINISHED' &&
                        userTrainingSessionModelInstance.progressStatus != 'BOOKING') {
                      userTrainingSessionModelInstance.finishedAt = DateTime.now();
                      userTrainingSessionModelInstance.progressStatus = 'FINISHED';
                      userTrainingSessionModelInstance.syncStatus = 'PENDING';
                      _userTrainingSessionStorage.save(
                        userTrainingSessionModelInstance,
                        _contractToken,
                      );

                      showAlertDialog(
                        context,
                        'Deseja realmente ENCERRAR a sessão de treino? ',
                        () {
                          Navigator.of(context).pop();
                          Navigator.popAndPushNamed(context, AppRoutes.trainingSummaryPage);
                        },
                        () {
                          Navigator.of(context).pop();
                          userTrainingSessionModelInstance.progressStatus = 'STARTED';
                        },
                      );
                    } else {
                      showAlertCloseDialog(
                        context,
                        userTrainingSessionModelInstance.progressStatus == 'FINISHED'
                            ? 'Treino já está encerrado'
                            : 'Apenas para visualização',
                        () => Navigator.of(context).pop(),
                      );
                      setState(() {
                        _hideButtonFinishTrainingSession = true;
                      });
                    }
                  },
                  icon: Icon(Icons.stop_circle),
                  label: Text('Encerrar Sessão de Treino'),
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
