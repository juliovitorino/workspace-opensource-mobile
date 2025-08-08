import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/utils/alert.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';

import '../../../../config/app_config.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/data/models/user_training_session_model.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/key_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_session_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/widgets/pro_widget_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';

class TrainingSummaryPage extends ConsumerStatefulWidget {
  const TrainingSummaryPage({super.key});

  @override
  ConsumerState<TrainingSummaryPage> createState() => _TrainingSummaryPageState();
}

class _TrainingSummaryPageState extends ConsumerState<TrainingSummaryPage> {
  late final AppConfig config;
  late String _contractToken;
  late Future<UserTrainingSessionModel?> _userTrainingSessionModelFuture;
  late UserTrainingSessionModel _userTrainingSessionInstance;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage =
      UserTrainingSessionStorageService();

  final TextEditingController _commentsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    _initData();
  }

  void _initData() async {
    _contractToken = (await _contractTokenStorage.get())!;
    setState(() {
      _userTrainingSessionModelFuture = _userTrainingSessionStorage.get(_contractToken);
    });
  }

  void _showAlertDialogSyncPage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProWidgetAlertDialog(
        title: 'O treino foi encerrado. Quer enviar agora para ficha do aluno?',
        proceedButton: 'Sim, salve a ficha',
        onProceed: () {
          Navigator.of(context).pop();
          _userTrainingSessionInstance.comments = _commentsController.text;
          _userTrainingSessionStorage.save(_userTrainingSessionInstance, _contractToken);
          Navigator.popAndPushNamed(context, AppRoutes.syncPage);
        },
        onCancel: () {
          Navigator.of(context).pop();
          showAlertCloseDialog(context, 'A ficha será enviada antes do próximo treino', () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        }
            ,
      ),
    );
  }

  int _sumExecutedExercises(List<UserWorkoutPlanModel>? exercises) {
    if (exercises == null) return 0;
    final List<UserWorkoutPlanModel> executedExercises = exercises
        .where(
          (e) =>
              e.trainingStatus == 'DONE' &&
              e.userExecutionSetList != null &&
              e.userExecutionSetList!.isNotEmpty,
        )
        .toList();
    return executedExercises.length;
  }

  int _sumExecutedSeriesExercises(List<UserWorkoutPlanModel>? exercises) {
    if (exercises == null) return 0;
    int counter = 0;
    final List<UserWorkoutPlanModel> executedExercises = exercises
        .where(
          (e) =>
              e.trainingStatus == 'DONE' &&
              e.userExecutionSetList != null &&
              e.userExecutionSetList!.isNotEmpty,
        )
        .toList();

    executedExercises.forEach(
      (e) => e.userExecutionSetList != null && e.userExecutionSetList!.isNotEmpty
          ? counter += e.userExecutionSetList!.length
          : counter += 0,
    );
    return counter;
  }

  Set<String> _workgroupExecutedExercises(List<UserWorkoutPlanModel>? exercises) {
    if (exercises == null) return {};
    int counter = 0;
    final List<UserWorkoutPlanModel> executedExercises = exercises
        .where(
          (e) =>
              e.trainingStatus == 'DONE' &&
              e.userExecutionSetList != null &&
              e.userExecutionSetList!.isNotEmpty,
        )
        .toList();

    final workgroups = executedExercises.map((e) => e.workGroup.namePt).toList();
    return workgroups.toSet();
  }

  Widget _buildSummaryView(UserTrainingSessionModel trainingSession) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ProWidgetSectionTitle(title: trainingSession.contract.studentUser.name),
          ProWidgetInfoRow(
            label: 'Início do Treino',
            value: getDateTimeToDT(trainingSession.startedAt!),
          ),
          ProWidgetInfoRow(
            label: 'Término do Treino',
            value: getDateTimeToDT(trainingSession.finishedAt!),
          ),
          ProWidgetInfoRow(
            label: 'Tempo de Treino',
            value: dateDifference(trainingSession.finishedAt!, trainingSession.startedAt!),
          ),
          ProWidgetInfoRow(
            label: 'Status',
            value: 'FINISHED',
            widget: ProWidgetTag(
              text: 'CONCLUÍDO',
              borderColor: Colors.green,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.fitness_center),
              SizedBox(width: 8),
              Text(
                "Exercícios realizados: ${_sumExecutedExercises(trainingSession.userWorkoutPlanList)}",
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time),
              SizedBox(width: 8),
              Text(
                "Séries totais: ${_sumExecutedSeriesExercises(trainingSession.userWorkoutPlanList)}",
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.fitness_center_outlined),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Grupos musculares: ${_workgroupExecutedExercises(trainingSession.userWorkoutPlanList).join(', ')}",
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text("Observações:"),
          const SizedBox(height: 8),
          TextField(
            maxLines: 4,
            controller: _commentsController,
            decoration: InputDecoration(
              hintText: "Digite suas observações...",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => _showAlertDialogSyncPage(context),
              icon: Icon(Icons.sync),
              label: Text('SALVAR E SINCRONIZAR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryBuilder(BuildContext context, AsyncSnapshot<UserTrainingSessionModel?> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erro: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('Nenhum dado encontrado.'));
    } else {
      // Now... we have data and we can call method
      _userTrainingSessionInstance = snapshot.data!;
      return _buildSummaryView(snapshot.data!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (config.isDebugMode)
            ProWidgetInfoAlertDialog(title: 'page', text: 'training_summary_page.dart'),
        ],
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text("RESUMO DO TREINO"),
          ],
        ),
      ),
      body: FutureBuilder<UserTrainingSessionModel?>(
        future: _userTrainingSessionModelFuture,
        builder: (context, snapshot) => _summaryBuilder(context, snapshot),
      ),
    );
  }
}
