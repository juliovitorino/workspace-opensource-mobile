import 'package:flutter/material.dart';
import 'package:treinadorpro/core/domain/entities/trainer_user.dart';
import 'package:treinadorpro/core/enums/execution_method_enum.dart';
import 'package:treinadorpro/core/enums/weight_unit_enum.dart';
import 'package:treinadorpro/core/domain/entities/exercise.dart';
import 'package:treinadorpro/core/domain/entities/goal.dart';
import 'package:treinadorpro/core/domain/entities/modality.dart';
import 'package:treinadorpro/core/domain/entities/program.dart';
import 'package:treinadorpro/core/domain/entities/work_group.dart';

class BuildWorkoutSheetPage extends StatefulWidget {
  const BuildWorkoutSheetPage({super.key});

  @override
  State<BuildWorkoutSheetPage> createState() => _BuildWorkoutSheetPageState();
}

class _BuildWorkoutSheetPageState extends State<BuildWorkoutSheetPage> {
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

  List<Exercise> _filteredExercises = Exercise.exercises;
  bool _showExerciseListView = true;
  bool _isPersonalizedProgram = false;
  bool _isCustomExercise = false;

  Modality _modality = Modality.modalities.first;
  Goal _goal = Goal.goals.first;
  Program _program = Program.programs.first;
  WorkGroup _workGroup = WorkGroup.workGroups.first;
  Exercise _exercise = Exercise.exercises.first;
  TrainerUser _trainerUser = TrainerUser.trainerUsers.first;

  ExecutionMethod _executionMethod = ExecutionMethod.serie;
  WeightUnit _weightUnit = WeightUnit.kg;

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
              _isCustomExercise = (_filteredExercises[index].namePt.toLowerCase() == 'personalizado' ) ? true : false;
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
    return Scaffold(
      appBar: AppBar(title: Text('Montar Treino')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Text('Aluno'),
              DropdownButtonFormField<TrainerUser>(
                items: TrainerUser.trainerUsers
                .where((e) => e.studentUser!.userProfile.contains('STUDENT'))
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.studentUser!.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _trainerUser = value!),
              ),


              Text('Modalidade'),
              DropdownButtonFormField<Modality>(
                items: Modality.modalities
                    .map(
                      (modalityItem) => DropdownMenuItem(
                        value: modalityItem,
                        child: Text(modalityItem.namePt),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _modality = value!),
              ),

              SizedBox(height: 10),
              Text('Objetivo'),
              DropdownButtonFormField<Goal>(
                items: Goal.goals
                    .map(
                      (goalItem) => DropdownMenuItem(
                        value: goalItem,
                        child: Text(goalItem.namePt),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _goal = value!),
              ),

              SizedBox(height: 10),
              Text('Programa'),

              _isPersonalizedProgram
                  ? Container()
                  : DropdownButtonFormField<Program>(
                      items: Program.programs
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item.namePt),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setState(() {
                        _program = value!;
                        _isPersonalizedProgram =
                            value.namePt.toLowerCase() == 'personalizado'
                            ? true
                            : false;
                      }),
                    ),

              // show Custom Program
              _isPersonalizedProgram
                  ? _buildPersonalizedProgram()
                  : Container(),

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

              _isCustomExercise ? _buildCustomExercise() : _buildSearchExercise(),

              _showExerciseListView ? _buildExerciseListView() : Container(),

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
