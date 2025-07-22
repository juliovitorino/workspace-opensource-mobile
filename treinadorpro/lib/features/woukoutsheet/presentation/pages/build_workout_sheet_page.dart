import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/workgroup_provider.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/data/models/user_data_sheet_plan_model.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/data/models/work_group_model.dart';
import 'package:treinadorpro/core/domain/entities/trainer_user.dart';
import 'package:treinadorpro/core/enums/execution_method_enum.dart';
import 'package:treinadorpro/core/enums/weight_unit_enum.dart';
import 'package:treinadorpro/core/domain/entities/exercise.dart';
import 'package:treinadorpro/core/domain/entities/goal.dart';
import 'package:treinadorpro/core/domain/entities/modality.dart';
import 'package:treinadorpro/core/domain/entities/program.dart';
import 'package:treinadorpro/core/domain/entities/work_group.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/contract_token_storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_data_sheet_plan_storage_service.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/contract_provider.dart';
import 'package:treinadorpro/core/provider/exercise_provider.dart';
import 'package:treinadorpro/core/provider/goal_provider.dart';
import 'package:treinadorpro/core/provider/program_provider.dart';
import 'package:treinadorpro/core/provider/training_pack_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_alert_dialog.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_searchable_dropdown.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/widgets/workout_group_card.dart';

import '../../../../core/data/models/goal_model.dart';
import '../../../../core/data/models/modality_model.dart';
import '../../../../core/infrastructure/localstorage/trainer_user_storage_service.dart';
import '../../../../core/provider/modality_provider.dart';
import '../../../../core/utils/date_utils.dart';

class BuildWorkoutSheetPage extends ConsumerStatefulWidget {
  const BuildWorkoutSheetPage({super.key});

  @override
  ConsumerState<BuildWorkoutSheetPage> createState() =>
      _BuildWorkoutSheetPageState();
}

class _BuildWorkoutSheetPageState extends ConsumerState<BuildWorkoutSheetPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _seriesController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  final TextEditingController _executionTimeController =
      TextEditingController();
  final TextEditingController _restController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  late final AppConfig config;

  late Map<String, List<UserWorkoutPlanModel>> userWorkoutPlanData;

  List<Exercise> _filteredExercises = Exercise.exercises;

  late ModalityModel? _modality; // = Modality.modalities.first;
  late GoalModel? _goal; // = Goal.goals.first;
  late ExerciseModel _exercise; // = Exercise.exercises.first;
  late ProgramModel? _program; // = Program.programs.first;
  late WorkgroupModel _workGroup; // = Workgroup.workGroups.first;
  late StudentsFromTrainerResponseModel _student;
  late ContractResponseModel _contract;

  late StorageService<UserModel> _trainerStorageService;
  final StorageService<String> _contractTokenStorage =
      ContractTokenStorageService();
  final UserDataSheetPlanStorageService _userPlanDraft =
      UserDataSheetPlanStorageService();

  late UserModel _userModel;
  late String _contractToken;
  late UserDataSheetPlanModel? _draft;

  TrainerUser _trainerUser = TrainerUser.trainerUsers.first;

  ExecutionMethod _executionMethod = ExecutionMethod.serie;
  final WeightUnit _weightUnit = WeightUnit.kg;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    _trainerStorageService = TrainerUserStorageService();
    userWorkoutPlanData = {};

    Future.microtask(() async {
      _contractToken = (await _contractTokenStorage.get())!;
      _userModel = (await _trainerStorageService.get())!;
      _draft = await _userPlanDraft.get(_contractToken);
      if(_draft?.plan != null) {
        userWorkoutPlanData = _draft!.plan;
      }

      ref
          .read(findContractViewModelProvider.notifier)
          .findContract(_contractToken);
      ref.read(modalityViewModelProvider.notifier).findAllActiveModalities();
      ref.read(goalViewModelProvider.notifier).findAllActiveGoals();
      ref.read(exerciseViewModelProvider.notifier).findAllActiveExercises();
      ref.read(programViewModelProvider.notifier).findAllActivePrograms();
      ref
          .read(workgroupViewListModelProvider.notifier)
          .findAllActiveWorkgroups();
    });
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    bool required = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label),
        validator: required
            ? (value) =>
                  (value == null || value.isEmpty) ? 'Campo obrigatório' : null
            : null,
      ),
    );
  }

  Widget _buildModalitySearchable(List<ModalityModel> modalityList) {
    final sortedList = [...modalityList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));

    final initial = _draft?.modality == null
        ? null
        : sortedList.firstWhere(
          (m) => m.id == _draft!.modality?.id,
      orElse: () => sortedList.first,
    );

    if(initial != null){
      _modality = initial;
    }

    return ProWidgetSearchableDropdown<ModalityModel>(
      items: sortedList,
      hintTextSearch: "Pesquisar Modalidade...",
      hintTextItem: 'Selecione uma modalidade',
      initialValue: initial,
      onChanged: (value) => setState(() => _modality = value!),
    );
  }

  Widget _buildGoalSearchable(List<GoalModel> goalList) {
    final sortedGoalList = [...goalList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));

    final initial = _draft?.goal == null
        ? null
        : sortedGoalList.firstWhere(
          (m) => m.id == _draft!.goal?.id,
      orElse: () => sortedGoalList.first,
    );

    if(initial != null){
      _goal = initial;
    }

    return ProWidgetSearchableDropdown<GoalModel>(
      items: sortedGoalList,
      hintTextSearch: 'Pesquisar Objetivo...',
      hintTextItem: 'Selecione um Objetivo',
      initialValue: initial,
      onChanged: (value) => setState(() => _goal = value!),
    );
  }

  Widget _buildProgramSearchable(List<ProgramModel> programList) {
    final sortedList = [...programList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));

    final initial = _draft?.program == null
        ? null
        : sortedList.firstWhere(
          (m) => m.id == _draft!.program?.id,
      orElse: () => sortedList.first,
    );

    if(initial != null){
      _program = initial;
    }
    return ProWidgetSearchableDropdown<ProgramModel>(
      items: sortedList,
      customTextInputAllowed: true,
      hintTextSearch: "Pesquisar Programa...",
      hintTextItem: 'Selecione programa',
      hintCustomTextInput: 'Informe um programa personalizado',
      initialValue: initial,
      onChanged: (value) => setState(() => _program = value!),
    );
  }

  Widget _buildWorkgroupSearchable(List<WorkgroupModel> workgroupList) {
    final sortedList = [...workgroupList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));

    return ProWidgetSearchableDropdown<WorkgroupModel>(
      items: sortedList,
      hintTextSearch: "Pesquisar Grupo Muscular...",
      hintTextItem: 'Selecione grupo muscular',
      onChanged: (value) => setState(() => _workGroup = value!),
    );
  }

  Widget _buildExerciseSearchable(List<ExerciseModel> exerciseList) {
    final sortedExerciseList = [...exerciseList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));
    return ProWidgetSearchableDropdown<ExerciseModel>(
      hintTextSearch: 'Pesquisar exercício...',
      hintTextItem: 'Selecione um exercício',
      hintCustomTextInput: 'Informe um exercício personalizado',
      items: sortedExerciseList,
      customTextInputAllowed: true,
      onChanged: (value) => setState(() => _exercise = value!),
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

  @override
  Widget build(BuildContext context) {
    final modalityState = ref.watch(modalityViewModelProvider);
    final goalState = ref.watch(goalViewModelProvider);
    final exerciseState = ref.watch(exerciseViewModelProvider);
    final programState = ref.watch(programViewModelProvider);
    final workgroupState = ref.watch(workgroupViewListModelProvider);
    // final trainingPackState = ref.watch(trainingPackStudentsFromTrainerViewListModelProvider);
    final contractState = ref.watch(findContractViewModelProvider);

    final workoutEntries = userWorkoutPlanData.entries.toList();
    print("workoutEntries ${workoutEntries.length}");

    int totalRestTime = 0;
    int totalExecutionTime = 0;

    userWorkoutPlanData.forEach((key, exerciseList) {
      for (var exercise in exerciseList) {
        totalRestTime += int.tryParse(exercise.restTime ?? '0') ?? 0;
        totalExecutionTime += int.tryParse(exercise.executionTime ?? '0') ?? 0;
      }
    });



    return Scaffold(
      appBar: AppBar(
        title: Text('Montar Treino'),
        actions: [
          ProWidgetInfoAlertDialog(
            title: 'page',
            text: 'build_workout_sheet_page.dart',
          ),
          IconButton(onPressed: () => _userPlanDraft.clear(_contractToken), icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // student
              Text('Aluno'),
              contractState.when(
                data: (contract) {
                  _contract = contract.objectResponse;
                  return _buildContractCard(contract.objectResponse);
                },
                error: (e, _) => Center(child: Text('error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Modality
              Text('Modalidade'),
              modalityState.when(
                data: (modalityList) => _buildModalitySearchable(modalityList),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Goal
              SizedBox(height: 10),
              Text('Objetivo'),
              goalState.when(
                data: (goalList) => _buildGoalSearchable(goalList),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Program
              SizedBox(height: 10),
              Text('Programa'),
              programState.when(
                data: (programList) => _buildProgramSearchable(programList),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Workgroup
              SizedBox(height: 10),
              Text('Grupo Muscular'),
              workgroupState.when(
                data: (workgroupList) =>
                    _buildWorkgroupSearchable(workgroupList),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Exercise
              SizedBox(height: 10),
              Text('Exercício'),
              exerciseState.when(
                data: (list) => _buildExerciseSearchable(list),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Execution Method
              Text('Método de Execução'),
              DropdownButtonFormField<ExecutionMethod>(
                items: ExecutionMethod.values
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item.name)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _executionMethod = value!),
              ),

              // Series and Reps
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      _seriesController,
                      'Series',
                      keyboardType: TextInputType.number,
                      required: true,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      _repsController,
                      'Repetições',
                      keyboardType: TextInputType.text,
                      required: true,
                    ),
                  ),
                ],
              ),

              // Execution Time and rest pause
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      _executionTimeController,
                      'Tempo de Execução (min)',
                      keyboardType: TextInputType.number,
                      required: true,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildTextField(
                      _restController,
                      'Descanso (min)',
                      keyboardType: TextInputType.number,
                      required: true,
                    ),
                  ),
                ],
              ),

              // Comment
              TextFormField(
                controller: _commentController,
                maxLines: 5, // ou null para ilimitado
                decoration: InputDecoration(
                  labelText: 'Comentário',
                  hintText: 'Escreva seu comentário aqui...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),

              // actions button
              SizedBox(height: 12),

              // Action buttons and links

              // save draft button
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      userWorkoutPlanData.putIfAbsent(
                        _workGroup.namePt,
                        () => [],
                      );

                      userWorkoutPlanData[_workGroup.namePt]!.add(
                        UserWorkoutPlanModel(
                          contract: _contract,
                          modality: _modality,
                          goal: _goal,
                          program: _program,
                          // customProgram: _, //colocar
                          workGroup: _workGroup,
                          exercise: _exercise,
                          // customExercise: _exe, // colocar
                          executionTime: _executionTimeController.text,
                          executionMethod: _executionMethod,
                          restTime: _restController.text,
                          qtyReps: _repsController.text,
                          qtySeries: int.parse(_seriesController.text),
                          control: '${DateTime.now().microsecondsSinceEpoch}',
                        ),
                      );

                      final draft = UserDataSheetPlanModel(
                        contract: _contract,
                        modality: _modality,
                        goal: _goal,
                        program: _program,
                        plan: userWorkoutPlanData,
                      );

                      _userPlanDraft.save(draft, _contract.externalId);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Exercício inserido no rascunho com sucesso!👍'),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.green,
                        ),
                      );


                    });
                  }
                },
                icon: Icon(Icons.check_circle),
                label: Text('Colocar no Rascunho da Ficha'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
              ),
              SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.calendar_today),
                label: Text('Aplicar Ficha de Treino'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),

              // preview
              const SizedBox(height: 10,),
              ProWidgetSectionTitle(title: 'Rascunho da Ficha de Treino'),
              ProWidgetInfoRow(label: 'Aluno', value: _contract.studentUser.name),
              ProWidgetInfoRow(label: 'Tempo total estimado de treino', value: '${totalRestTime + totalExecutionTime} min'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(12),
                itemCount: workoutEntries.length,
                itemBuilder: (context, index) {
                  final entry = workoutEntries[index];
                  print("lvb = ${entry.key}");
                  return WorkoutGroupCard(
                    groupName: entry.key,
                    exercises: entry.value,
                    onDelete: (e) {
                      setState(() {
                        userWorkoutPlanData[e.workGroup.namePt]?.removeWhere(
                          (item) => item.control == e.control,
                        );
                        final _exercisesGroup =
                            userWorkoutPlanData[e.workGroup.namePt];
                        if (_exercisesGroup!.isEmpty) {
                          if (userWorkoutPlanData.containsKey(
                            e.workGroup.namePt,
                          )) {
                            userWorkoutPlanData.remove(e.workGroup.namePt);
                          }
                        }
                      });


                      final draft = UserDataSheetPlanModel(
                        contract: _contract,
                        modality: _modality,
                        goal: _goal,
                        program: _program,
                        plan: userWorkoutPlanData,
                      );

                      _userPlanDraft.save(draft, _contract.externalId);
                    },
                  );
                },
              ),
              // ListView(children: userWorkoutPlanData.entries.map((entry) {
              //   return WorkoutGroupCard(groupName: entry.key, exercises: entry.value);
              // }).toList())
            ],
          ),
        ),
      ),
    );
  }
}
