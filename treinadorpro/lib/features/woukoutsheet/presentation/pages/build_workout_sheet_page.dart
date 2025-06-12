import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/workgroup_provider.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/data/models/work_group_model.dart';
import 'package:treinadorpro/core/domain/entities/trainer_user.dart';
import 'package:treinadorpro/core/enums/execution_method_enum.dart';
import 'package:treinadorpro/core/enums/weight_unit_enum.dart';
import 'package:treinadorpro/core/domain/entities/exercise.dart';
import 'package:treinadorpro/core/domain/entities/goal.dart';
import 'package:treinadorpro/core/domain/entities/modality.dart';
import 'package:treinadorpro/core/domain/entities/program.dart';
import 'package:treinadorpro/core/domain/entities/work_group.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/exercise_provider.dart';
import 'package:treinadorpro/core/provider/goal_provider.dart';
import 'package:treinadorpro/core/provider/program_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_alert_dialog.dart';
import 'package:treinadorpro/core/widgets/pro_widget_searchable_dropdown.dart';

import '../../../../core/data/models/goal_model.dart';
import '../../../../core/data/models/modality_model.dart';
import '../../../../core/provider/modality_provider.dart';

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

  List<Exercise> _filteredExercises = Exercise.exercises;

  late Modality _modality; // = Modality.modalities.first;
  late Goal _goal; // = Goal.goals.first;
  late Exercise _exercise; // = Exercise.exercises.first;
  late Program _program; // = Program.programs.first;
  late Workgroup _workGroup; // = Workgroup.workGroups.first;
  TrainerUser _trainerUser = TrainerUser.trainerUsers.first;

  ExecutionMethod _executionMethod = ExecutionMethod.serie;
  final WeightUnit _weightUnit = WeightUnit.kg;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    Future.microtask(() {
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
    return ProWidgetSearchableDropdown<ModalityModel>(
      items: sortedList,
      hintTextSearch: "Pesquisar Modalidade...",
      hintTextItem: 'Selecione uma modalidade',
      onChanged: (value) => setState(() => _modality = value!),
    );
  }

  Widget _buildGoalSearchable(List<GoalModel> goalList) {
    final sortedGoalList = [...goalList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));
    return ProWidgetSearchableDropdown<GoalModel>(
      items: sortedGoalList,
      hintTextSearch: 'Pesquisar Objetivo...',
      hintTextItem: 'Selecione um Objetivo',
      onChanged: (value) => setState(() => _goal = value!),
    );
  }

  Widget _buildProgramSearchable(List<ProgramModel> programList) {
    final sortedList = [...programList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));
    return ProWidgetSearchableDropdown<ProgramModel>(
      items: sortedList,
      customTextInputAllowed: true,
      hintTextSearch: "Pesquisar Programa...",
      hintTextItem: 'Selecione programar',
      hintCustomTextInput: 'Informe um programa personalizado',
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

  @override
  Widget build(BuildContext context) {
    final modalityState = ref.watch(modalityViewModelProvider);
    final goalState = ref.watch(goalViewModelProvider);
    final exerciseState = ref.watch(exerciseViewModelProvider);
    final programState = ref.watch(programViewModelProvider);
    final workgroupState = ref.watch(workgroupViewListModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Montar Treino'),
        actions: [
          ProWidgetInfoAlertDialog(
            title: 'page',
            text: 'build_workout_sheet_page.dart',
          ),
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
              DropdownButtonFormField<TrainerUser>(
                items: TrainerUser.trainerUsers
                    .where(
                      (e) => e.studentUser!.userProfile.contains('STUDENT'),
                    )
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.studentUser!.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _trainerUser = value!),
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
                      keyboardType: TextInputType.number,
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'O comentário não pode estar vazio';
                  }
                  return null;
                },
              ),

              // actions button
              SizedBox(height: 12),

              // Action buttons and links
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // lógica de salvar aluno
                  }
                },
                icon: Icon(Icons.check_circle),
                label: Text('Salvar Exercício no Rascunho da Ficha'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
              ),
              SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.calendar_today),
                label: Text('Ver Ficha de Treino'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
