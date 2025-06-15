import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/entities/training_pack.dart';
import 'package:treinadorpro/core/domain/entities/user.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/training_pack_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';
import 'package:treinadorpro/core/widgets/pro_widget_text_form_field.dart';
import 'package:treinadorpro/features/newstudent/presentation/blocs/new_student_cubit.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/build_workout_sheet_page.dart';

import '../../../../core/data/models/students_from_trainer_response_model.dart';
import '../../../../core/domain/entities/modality.dart';
import '../../../../core/domain/entities/trainer_user.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../../core/widgets/pro_widget_searchable_dropdown.dart';

class NewStudentPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<NewStudentPage> createState() => _NewStudentPageState();
}

class _NewStudentPageState extends ConsumerState<NewStudentPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _planStartController = TextEditingController();
  final TextEditingController _objectiveController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();

  String _gender = 'Masculino';

  bool _isActionButtonStudentSelector = true;
  bool _isShowPersonalDataSection = false;
  bool _isShowExistingStudentSection = false;
  bool _isShowCardOldStudentSelected = false;
  bool _isShowCardTrainingPack = false;

  final List<String> _days = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
  final List<String> _selectedDays = [];

  int _paymentCount = 1;
  String _paymentCountController = '1';
  String _endTimeController = '1 hora';

  List<DateTime?> _paymentDates = [];
  List<TextEditingController> _dateControllers = [];
  List<TextEditingController> _amountControllers = [];

  late final AppConfig config;
  late StudentsFromTrainerResponseModel _studentSelected;
  late TrainingPackModel _trainingPackSelected;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    _planStartController.text = DateTime.now().toString().split(' ')[0];
    Future.microtask(() {
      ref
          .read(trainingPackStudentsFromTrainerViewListModelProvider.notifier)
          .findAllStudentsFromTrainer("39c0fd19-dbd2-4c74-8104-7105ca159c7b");

      ref
          .read((trainingPackFromTrainerViewListModelProvider.notifier))
          .findAllActiveTrainingPackFromTrainer(
            "39c0fd19-dbd2-4c74-8104-7105ca159c7b",
          );
    });
  }

  Widget _buildStudentSearchable(
    List<StudentsFromTrainerResponseModel> studentList,
  ) {
    final sortedStudentList = [...studentList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));
    return ProWidgetSearchableDropdown<StudentsFromTrainerResponseModel>(
      hintTextSearch: 'Pesquisar Aluno...',
      hintTextItem: 'Selecione um aluno',
      items: sortedStudentList,
      onChanged: (value) => setState(() {
        _studentSelected = value!;
        _isShowCardOldStudentSelected = true;
      }),
      onClear: () => setState(() {
        _isShowCardOldStudentSelected = false;
      }),
    );
  }

  Widget _buildTrainingPackSearchable(
    List<TrainingPackModel> trainingPackList,
  ) {
    final sortedTrainingPackList = [...trainingPackList]
      ..sort((a, b) => a.getName().compareTo(b.getName()));
    return ProWidgetSearchableDropdown<TrainingPackModel>(
      hintTextSearch: 'Pesquisar Pacote de treino...',
      hintTextItem: 'Selecione um Pacote de Treino',
      items: sortedTrainingPackList,
      onChanged: (value) => setState(() {
        print('valor da combo alterado');
        _trainingPackSelected = value!;
        _isShowCardTrainingPack = true;
      }),
      onClear: () => setState(() {
        _isShowCardTrainingPack = false;
      }),
    );
  }

  Future<void> _processFormListenerFromCubitStateChanged(
    BuildContext context,
    HandlerState state,
  ) async {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Sucesso'),
          content: Text('Uma mensagem qq...'),
        ),
      );

      // Navigator.popAndPushNamed(context, AppRoutes.validateCode);
    }
  }

  Widget _buildFormArea(
    HandlerState state,
    BuildContext context,
    AppConfig config,
  ) {
    final trainingPackStudentsFromTrainerState = ref.watch(
      trainingPackStudentsFromTrainerViewListModelProvider,
    );

    final trainingPackFromTrainerState = ref.watch(
      trainingPackFromTrainerViewListModelProvider,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //----------------------------
            // pack training section
            //----------------------------
            SizedBox(height: 16),
            ProWidgetSectionTitle(title: 'Pacote Contratado'),
            trainingPackFromTrainerState.when(
              data: (trainingPackList) =>
                  _buildTrainingPackSearchable(trainingPackList),
              error: (e, _) => Center(child: Text('Error: $e')),
              loading: () => Center(child: CircularProgressIndicator()),
            ),

            //----------------------------
            // Training Pack card info
            //----------------------------
            if (_isShowCardTrainingPack)
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    _trainingPackSelected.description,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_trainingPackSelected.modality!.namePt),
                      Text(
                        '${_trainingPackSelected.durationDays} dias • ${_trainingPackSelected.weeklyFrequency}x/semana',
                      ),
                      Text(_trainingPackSelected.notes),
                      Text(
                        'Valor: R\$ ${_trainingPackSelected.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.green[700]),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 16),

            //-------------------------------
            // Action button student selector
            //--------------------------------
            if (_isActionButtonStudentSelector)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => setState(() {
                      _isActionButtonStudentSelector = false;
                      _isShowExistingStudentSection = false;
                      _isShowPersonalDataSection = true;
                    }),
                    icon: Icon(Icons.person_add),
                    label: Text('Novo Aluno'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => setState(() {
                      _isActionButtonStudentSelector = false;
                      _isShowExistingStudentSection = true;
                      _isShowPersonalDataSection = false;
                    }),
                    icon: Icon(Icons.fitness_center),
                    label: Text('Meu Aluno Antigo'),
                  ),
                ],
              ),

            SizedBox(height: 16),

            ProWidgetSectionTitle(title: 'Dados Pessoais'),

            //---------------------------
            // Old Student Section
            //---------------------------
            if (_isShowExistingStudentSection)
              trainingPackStudentsFromTrainerState.when(
                data: (studentList) => _buildStudentSearchable(studentList),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),

            //--------------------------------------------
            // Old student card info
            //--------------------------------------------
            if (_isShowCardOldStudentSelected)
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    _studentSelected.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_studentSelected.email),
                      Text(_studentSelected.phone),
                    ],
                  ),
                ),
              ),

            //-----------------------------
            // personal data section
            //-----------------------------
            if (_isShowPersonalDataSection)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProWidgetTextFormField(
                    controller: _nameController,
                    label: 'Nome Completo',
                  ),
                  ProWidgetTextFormField(
                    controller: _dobController,
                    label: 'Data de nascimento (AAAA-MM-DD)',
                    keyboardType: TextInputType.datetime,
                  ),
                  ProWidgetTextFormField(
                    controller: _phoneController,
                    label: 'Telefone',
                    keyboardType: TextInputType.phone,
                  ),
                  ProWidgetTextFormField(
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8),

                  Text('Sexo'),
                  DropdownButtonFormField<String>(
                    value: _gender,
                    items: ['Masculino', 'Feminino', 'Outro']
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                    onChanged: (val) => setState(() => _gender = val!),
                  ),
                ],
              ),

            SizedBox(height: 32),

            //--------------------------------
            // training info section
            //--------------------------------
            ProWidgetSectionTitle(title: 'Informações Sobre o Treino'),
            ProWidgetTextFormField(
              controller: _planStartController,
              label: 'Data de início (AAAA-MM-DD)',
              keyboardType: TextInputType.datetime,
            ),
            ProWidgetTextFormField(
              controller: _startTimeController,
              label: 'Hora de Início do Treino (HH:MI)',
              keyboardType: TextInputType.number,
            ),

            DropdownButtonFormField<String>(
              value: _endTimeController,
              items: [
                '30 minutos',
                '45 minutos',
                '1 hora',
                '2 horas',
              ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (value) {
                setState(() => _endTimeController = value!);
              },
            ),

            Text('Dias da semana para treinar'),
            Wrap(
              spacing: 8.0,
              children: _days.map((day) {
                final isSelected = _selectedDays.contains(day);
                return SizedBox(
                  height: 45,
                  child: FilterChip(
                    label: Text(day),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedDays.add(day);
                        } else {
                          _selectedDays.remove(day);
                        }
                      });
                    },
                    selectedColor: Colors.blue.shade300,
                    checkmarkColor: Colors.white,
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 16),
            ProWidgetTextFormField(
              controller: _objectiveController,
              label:
                  'Digite seu objetivo: Hipertrofia, emagrecimento, saúde, etc.',
            ),

            //------------------
            // payment section
            //------------------
            ProWidgetSectionTitle(title: 'Forma de Pagamento'),

            SizedBox(height: 8),
            Text('Número de pagamentos'),
            DropdownButtonFormField<String>(
              value: _paymentCountController,
              items: [
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '11',
                '12',
              ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (value) {
                setState(() {
                  _paymentCountController = value!;
                  _paymentCount = int.tryParse(value) ?? 0;
                  _paymentDates = List<DateTime?>.filled(_paymentCount, null);
                  _dateControllers = List.generate(
                    _paymentCount,
                    (_) => TextEditingController(),
                  );
                  _amountControllers = List.generate(
                    _paymentCount,
                    (_) => TextEditingController(),
                  );
                });
              },
            ),

            //-------------------------------
            // Instalment list section
            //-------------------------------
            if (_dateControllers.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _paymentCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _dateControllers[index],
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Data Prevista ${index + 1}',
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
                                  _paymentDates[index] = pickedDate;
                                  _dateControllers[index].text =
                                      '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ProWidgetTextFormField(
                            controller: _amountControllers[index],
                            label: 'Valor',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

            //------------------------------
            // Action button section
            //------------------------------
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // lógica de salvar aluno
                }
              },
              icon: Icon(Icons.check_circle),
              label: Text('Salvar Contrato'),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BuildWorkoutSheetPage()),
                );
              },
              icon: Icon(Icons.calendar_today),
              label: Text('Montar Treino'),
              style: OutlinedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewStudentCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Novo Contrato'),
          actions: [
            ProWidgetInfoAlertDialog(
              title: 'page',
              text: 'new_student_page.dart',
            ),
          ],
        ),
        body: BlocConsumer<NewStudentCubit, HandlerState>(
          listener: (context, state) =>
              _processFormListenerFromCubitStateChanged(context, state),
          builder: (context, state) => _buildForm(context, state, config),
        ),
      ),
    );
  }
}
