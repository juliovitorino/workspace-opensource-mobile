import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/user_execution_set_model.dart';
import 'package:treinadorpro/core/widgets/pro_widget_alert_close_dialog.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/widgets/rest_timer.dart';

import '../../../../config/app_config.dart';
import '../../../../core/data/models/user_training_session_model.dart';
import '../../../../core/data/models/user_workout_plan_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/infrastructure/localstorage/contract_token_storage_service.dart';
import '../../../../core/infrastructure/localstorage/key_storage_service.dart';
import '../../../../core/infrastructure/localstorage/storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_training_session_storage_service.dart';
import '../../../../core/infrastructure/localstorage/user_workout_plan_storage_service.dart';
import '../../../../core/provider/app_config_provider.dart';
import '../../../../core/provider/contract_provider.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';

class ExerciseExecutionPage extends ConsumerStatefulWidget {
  const ExerciseExecutionPage({super.key});

  @override
  ConsumerState<ExerciseExecutionPage> createState() => _ExerciseExecutionPageState();
}

class _ExerciseExecutionPageState extends ConsumerState<ExerciseExecutionPage> {
  late final AppConfig config;
  late String _contractToken;
  late final IContractRespository _contractRepository;
  late UserTrainingSessionModel? _userTrainingSessionModel;
  late Future<UserWorkoutPlanModel?> _userWorkoutPlanModelFuture;
  late UserWorkoutPlanModel? _userWorkoutPlanModelInstance;
  late List<SetData> sets;
  late DateTime _startedAt;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();

  final KeyStorageService<UserTrainingSessionModel> _userTrainingSessionStorage =
      UserTrainingSessionStorageService();

  final KeyStorageService<UserWorkoutPlanModel> _userWorkoutPlanStorageService =
      UserWorkoutPlanStorageService();

  String exerciseName = '...';
  List<TextEditingController> _weightControllers = [];
  List<TextEditingController> _repsControllers = [];
  String weightReserved = '0';
  String repsReserved = '12';

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    // vai ser usado futuramente
    _contractRepository = ref.read(contractRepositoryProvider);

    _initData();
  }

  void _initData() async {
    print('ExerciseExecutionPage => _initData');
    _contractToken = (await _contractTokenStorage.get())!;
    _userTrainingSessionModel = await _userTrainingSessionStorage.get(_contractToken);

    _userWorkoutPlanModelInstance = await _userWorkoutPlanStorageService.get(_contractToken);

    sets = List.generate(_userWorkoutPlanModelInstance!.qtySeries!, (_) => SetData());
    exerciseName =
        _userWorkoutPlanModelInstance!.customExercise ??
        _userWorkoutPlanModelInstance!.exercise!.namePt;

    setState(() {
      _userWorkoutPlanModelFuture = _userWorkoutPlanStorageService.get(_contractToken);
    });
  }

  void _showAlertCloseDialog(BuildContext context, String title, Function()? onClose) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProWidgetAlertCloseDialog(title: title, onClose: onClose),
    );
  }

  void _addExecutionSetToUserWorkoutPlanModelInstance(
    double? weight,
    DateTime finishedAt,
    int setNumber,
    String? reps,
    double weights,
  ) {
    if (_userWorkoutPlanModelInstance!.userExecutionSetList == null) {
      _userWorkoutPlanModelInstance!.userExecutionSetList = [];
    }
    _userWorkoutPlanModelInstance!.userExecutionSetList!.add(
      UserExecutionSetModel(
        startedAt: _startedAt,
        finishedAt: finishedAt,
        setNumber: setNumber,
        weight: weights,
        reps: int.tryParse(reps!) ?? 0,
      ),
    );
    print('_userWorkoutPlanModelInstance => ${jsonEncode(_userWorkoutPlanModelInstance)}');
  }

  Widget _buildExercisesListView(UserWorkoutPlanModel userWorkoutPlanModel) {
    return Column(
      children: [
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RestTimer(),
              ProWidgetInfoRow(label: 'Ultima carga no último exercício', value: '10 Kg'),
              ProWidgetInfoRow(label: 'Qtde Reps no último exercício', value: '12'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: userWorkoutPlanModel.qtySeries,
            itemBuilder: (context, index) {
              final set = sets[index];
              if (_repsControllers[index].text.isEmpty) {
                _repsControllers[index].text = userWorkoutPlanModel.qtyReps!;
              }

              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Série ${index + 1} - ${userWorkoutPlanModel.qtyReps} reps",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _weightControllers[index].text = weightReserved;
                                _repsControllers[index].text = repsReserved;
                              });
                            },
                            icon: Icon(Icons.arrow_circle_down),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _weightControllers[index],
                              decoration: const InputDecoration(labelText: "Peso (kg)"),
                              onChanged: (value) => set.weight = double.tryParse(value) ?? 0,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _repsControllers[index],
                              decoration: const InputDecoration(labelText: "Reps"),
                              onChanged: (value) => set.reps = value,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Tempo: ${formatTime(set.elapsedSeconds)}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.play_arrow),
                            label: const Text("Iniciar Série"),
                            onPressed: set.completed || set.isRunning
                                ? null
                                : () {
                                    startTimer(set);
                                    _startedAt = DateTime.now();
                                  },
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.check),
                            label: const Text("Finalizar Série"),
                            onPressed: set.isRunning
                                ? () {
                                    _addExecutionSetToUserWorkoutPlanModelInstance(
                                      set.weight,
                                      DateTime.now(),
                                      index + 1,
                                      set.reps ?? _userWorkoutPlanModelInstance!.qtyReps!,
                                      set.weight,
                                    );
                                    stopTimer(set);
                                    weightReserved = _weightControllers[index].text;
                                    repsReserved = _repsControllers[index].text;
                                  }
                                : null,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (set.completed)
                        ProWidgetTag(
                          text: 'SÉRIE CONCLUÍDA',
                          borderColor: Colors.green,
                          backgroundColor: Colors.green,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _builderExercutionSets(
    BuildContext context,
    AsyncSnapshot<UserWorkoutPlanModel?> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erro: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('Nenhum dado encontrado.'));
    } else {
      // Now... we have data and we can call method
      _userWorkoutPlanModelInstance = snapshot.data!;
      exerciseName =
          _userWorkoutPlanModelInstance!.customExercise ??
          _userWorkoutPlanModelInstance!.exercise!.namePt;

      _buildControllers();

      return _buildExercisesListView(snapshot.data!);
    }
  }

  void _buildControllers() {
    if (_weightControllers.isEmpty) {
      _weightControllers = List.generate(
        _userWorkoutPlanModelInstance!.qtySeries!,
        (_) => TextEditingController(),
      );
    }

    if (_repsControllers.isEmpty) {
      _repsControllers = List.generate(
        _userWorkoutPlanModelInstance!.qtySeries!,
        (_) => TextEditingController(),
      );
    }
  }

  void _updateUserExecutionSetListIntoUserTrainingSession() {
    final userWorkoutPlanFound = _userTrainingSessionModel?.userWorkoutPlanList
        ?.where(
          (userWorkoutPlanItem) =>
              userWorkoutPlanItem.externalId == _userWorkoutPlanModelInstance!.externalId,
        )
        .firstOrNull;
    userWorkoutPlanFound?.trainingStatus = 'DONE';
    userWorkoutPlanFound?.userExecutionSetList ??= [];
    userWorkoutPlanFound?.userExecutionSetList = _userWorkoutPlanModelInstance!
        .userExecutionSetList!
        .map((e) => UserExecutionSetModel.fromJson(e.toJson()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseName),
        actions: [
          if (config.isDebugMode)
            ProWidgetInfoAlertDialog(title: 'page', text: 'exercise_execution_page.dart'),
        ],
      ),

      body: FutureBuilder<UserWorkoutPlanModel?>(
        future: _userWorkoutPlanModelFuture,
        builder: (context, snapshot) => _builderExercutionSets(context, snapshot),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.check_circle),
          label: const Text("Finalizar Exercício"),
          onPressed: () {
            final allDone = sets.every((s) => s.completed);
            if (!allDone) {
              _showAlertCloseDialog(
                context,
                'Todas as séries devem ser concluídas',
                () => Navigator.of(context).pop(),
              );
              return;
            }

            _updateUserExecutionSetListIntoUserTrainingSession();
            _userWorkoutPlanStorageService.clear(_contractToken);
            _userTrainingSessionStorage.save(_userTrainingSessionModel!, _contractToken);

            _showAlertCloseDialog(context, 'Exercício finalizado!', () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(true);
            });
          },
        ),
      ),
    );
  }

  void startTimer(SetData set) {
    set.elapsedSeconds = 0;
    set.isRunning = true;
    set.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        set.elapsedSeconds++;
      });
    });
  }

  void stopTimer(SetData set) {
    set.timer?.cancel();
    set.isRunning = false;
    set.completed = true;
    setState(() {});
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}

class SetData {
  double weight = 0;
  String? reps;
  int elapsedSeconds = 0;
  bool completed = false;
  bool isRunning = false;
  Timer? timer;
}
