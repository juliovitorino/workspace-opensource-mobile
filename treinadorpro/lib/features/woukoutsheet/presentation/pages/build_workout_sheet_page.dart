import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
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
  final TextEditingController _exerciseController = TextEditingController();
  final TextEditingController _seriesController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  final TextEditingController _executionTimeController =
      TextEditingController();
  final TextEditingController _restController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _customProgramController =
      TextEditingController();
  final TextEditingController _customExerciseController =
      TextEditingController();

  late final AppConfig config;

  List<Exercise> _filteredExercises = Exercise.exercises;
  bool _showExerciseListView = true;
  bool _isPersonalizedProgram = false;
  bool _isCustomExercise = false;

  late Modality _modality; // = Modality.modalities.first;
  late Goal _goal; // = Goal.goals.first;
  late Exercise _exercise; // = Exercise.exercises.first;
  late Program _program; // = Program.programs.first;
  WorkGroup _workGroup = WorkGroup.workGroups.first;
  TrainerUser _trainerUser = TrainerUser.trainerUsers.first;

  ExecutionMethod _executionMethod = ExecutionMethod.serie;
  WeightUnit _weightUnit = WeightUnit.kg;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    Future.microtask(() {
      ref.read(modalityViewModelProvider.notifier).findAllActiveModalities();
      ref.read(goalViewModelProvider.notifier).findAllActiveGoals();
      ref.read(exerciseViewModelProvider.notifier).findAllActiveExercises();
      ref.read(programViewModelProvider.notifier).findAllActivePrograms();
    });
  }

  void _filterExercises(String query) {
    setState(() {
      _filteredExercises = Exercise.exercises
          .where((e) => e.namePt.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildExerciseListView() {
    return Container(
      height: 200, // altura definida para caber na Column
      child: ListView.builder(
        itemCount: _filteredExercises.length,
        itemBuilder: (context, index) {
          final exercise = _filteredExercises[index];
          return ListTile(
            title: Text(exercise.namePt),
            onTap: () => setState(() {
              _exerciseController.text = _filteredExercises[index].namePt;
              _showExerciseListView = false;
              _isCustomExercise =
                  (_filteredExercises[index].namePt.toLowerCase() ==
                      'personalizado')
                  ? true
                  : false;
            }),
          );
        },
      ),
    );
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

  Widget _buildSearchExercise() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _exerciseController,
            onChanged: _filterExercises,
            decoration: InputDecoration(labelText: 'Buscar exercício'),
          ),
        ),

        const SizedBox(width: 8),

        // Primeiro ícone
        IconButton(
          icon: Icon(Icons.filter_alt),
          onPressed: () => setState(() {
            _showExerciseListView = true;
          }),
        ),

        // Segundo ícone
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _exerciseController.clear();
              _showExerciseListView = true;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPersonalizedProgram() {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(
            _customProgramController,
            'Programa Personalizado',
            keyboardType: TextInputType.text,
            required: true,
          ),
        ),

        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => setState(() => _isPersonalizedProgram = false),
        ),

        IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () => setState(() {
            _customProgramController.clear();
          }),
        ),
      ],
    );
  }

  Widget _buildCustomExercise() {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(
            _customExerciseController,
            'Exercício Personalizado',
            keyboardType: TextInputType.text,
            required: true,
          ),
        ),

        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => setState(() => _isCustomExercise = false),
        ),

        IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () => setState(() {
            _customExerciseController.clear();
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final modalityState = ref.watch(modalityViewModelProvider);
    final goalState = ref.watch(goalViewModelProvider);
    final exerciseState = ref.watch(exerciseViewModelProvider);
    final programState = ref.watch(programViewModelProvider);

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
                data: (modalityList) {
                  final sortedList = [...modalityList]..sort((a, b) => a.getName().compareTo(b.getName()));
                  return ProWidgetSearchableDropdown<ModalityModel>(
                    items: sortedList,
                    hintTextSearch: "Pesquisar Modalidade...",
                    hintTextItem: 'Selecione uma modalidade',
                    onChanged: (value) => setState(() => _modality = value!),
                  );
                },
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Goal
              SizedBox(height: 10),
              Text('Objetivo'),

              goalState.when(
                data: (goalList) {
                  final sortedGoalList = [...goalList]..sort((a, b) => a.getName().compareTo(b.getName()));
                  return ProWidgetSearchableDropdown<GoalModel>(
                    items: sortedGoalList,
                    hintTextSearch: 'Pesquisar Objetivo...',
                    hintTextItem: 'Selecione um Objetivo',
                    onChanged: (value) => setState(() => _goal = value!),
                  );
                },
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

              // Program
              SizedBox(height: 10),
              Text('Programa'),

              programState.when(
                data: (programList) {
                  final sortedList = [...programList]..sort((a, b) => a.getName().compareTo(b.getName()));
                  return ProWidgetSearchableDropdown<ProgramModel>(
                    items: sortedList,
                    customTextInputAllowed: true,
                    hintTextSearch: "Pesquisar Programa...",
                    hintTextItem: 'Selecione programar',
                    hintCustomTextInput: 'Informe um programa personalizado',
                    onChanged: (value) => setState(() => _program = value!),
                  );
                },
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
              //
              // _isPersonalizedProgram
              //     ? Container()
              //     : DropdownButtonFormField<Program>(
              //         items: Program.programs
              //             .map(
              //               (item) => DropdownMenuItem(
              //                 value: item,
              //                 child: Text(item.namePt),
              //               ),
              //             )
              //             .toList(),
              //         onChanged: (value) => setState(() {
              //           _program = value!;
              //           _isPersonalizedProgram =
              //               value.namePt.toLowerCase() == 'personalizado'
              //               ? true
              //               : false;
              //         }),
              //       ),
              //
              // // show Custom Program
              // _isPersonalizedProgram
              //     ? _buildPersonalizedProgram()
              //     : Container(),

              // Workgroup
              SizedBox(height: 10),
              Text('Grupo Muscular'),
              DropdownButtonFormField<WorkGroup>(
                items: WorkGroup.workGroups
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.namePt),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _workGroup = value!),
              ),


              // Exercise
              SizedBox(height: 10),
              Text('Exercício'),

              exerciseState.when(
                data: (list) {
                  final sortedExerciseList = [...list]..sort((a, b) => a.getName().compareTo(b.getName()));
                  return ProWidgetSearchableDropdown<ExerciseModel>(
                    hintTextSearch: 'Pesquisar exercício...',
                    hintTextItem: 'Selecione um exercício',
                    hintCustomTextInput: 'Informe um exercício personalizado',
                    items: sortedExerciseList,
                    customTextInputAllowed: true,
                    onChanged: (value) => setState(() => _exercise = value!),
                  );
                },
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

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
