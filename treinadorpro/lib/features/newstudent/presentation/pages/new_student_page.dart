import 'package:flutter/material.dart';
import 'package:treinadorpro/features/trainingpackage/domain/entities/training_package.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/build_workout_sheet_page.dart';

class NewStudentPage extends StatefulWidget {
  @override
  State<NewStudentPage> createState() => _NewStudentPageState();
}

class _NewStudentPageState extends State<NewStudentPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _planStartController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _objectiveController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _qtyInstalmentController =
      TextEditingController();

  String _gender = 'Masculino';
  String _planType = 'Plano Mensal Intermediário';

  TrainingPackage? _selectedPackage;

  final List<String> _days = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];
  final List<String> _selectedDays = [];

  int _paymentCount = 1;
  String _paymentCountController = '1';
  List<DateTime?> _paymentDates = [];
  List<TextEditingController> _dateControllers = [];

  @override
  void initState() {
    super.initState();
    _planStartController.text = DateTime.now().toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Aluno')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Dados Pessoais'),
              _buildTextField(_nameController, 'Nome completo', required: true),
              _buildTextField(
                _dobController,
                'Data de nascimento (AAAA-MM-DD)',
                keyboardType: TextInputType.datetime,
              ),
              _buildTextField(
                _phoneController,
                'Telefone',
                keyboardType: TextInputType.phone,
                required: true,
              ),
              _buildTextField(_emailController, 'Email'),
              SizedBox(height: 8),
              Text('Sexo'),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['Masculino', 'Feminino', 'Outro']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => setState(() => _gender = val!),
              ),

              SizedBox(height: 16),
              _buildSectionTitle('Pacote Contratado'),
              DropdownButtonFormField<String>(
                value: _planType,
                items: TrainingPackage.packages
                    .map(
                      (p) => DropdownMenuItem(
                        value: p.description,
                        child: Text(p.description),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    _planType = value!;
                    _selectedPackage = TrainingPackage.packages.firstWhere(
                      (pkg) => pkg.description == value,
                      orElse: () => TrainingPackage(
                        description: '',
                        durationDays: 0,
                        weeklyFrequency: 0,
                        price: 0,
                        notes: '',
                      ),
                    );
                  });
                },
              ),

              if (_selectedPackage != null)
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      _selectedPackage!.description,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_selectedPackage!.durationDays} dias • ${_selectedPackage!.weeklyFrequency}x/semana',
                        ),
                        Text(_selectedPackage!.notes),
                        Text(
                          'Valor: R\$ ${_selectedPackage!.price.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 16),
              _buildTextField(
                _planStartController,
                'Data de início (AAAA-MM-DD)',
                keyboardType: TextInputType.datetime,
              ),

              _buildTextField(
                _startTimeController,
                'Hora de Início do Treino (HH:MI)',
                keyboardType: TextInputType.datetime,
              ),
              _buildTextField(
                _endTimeController,
                'Hora final do Treino (HH:MI)',
                keyboardType: TextInputType.datetime,
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
              _buildSectionTitle('Objetivo'),
              _buildTextField(
                _objectiveController,
                'Hipertrofia, emagrecimento, saúde, etc.',
              ),

              _buildSectionTitle('Forma de Pagamento'),

              SizedBox(height: 8),
              Text('Número de pagamentos'),
              DropdownButtonFormField<String>(
                value: _paymentCountController,
                items:
                    [
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
                        ]
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _paymentCountController = value!;
                    _paymentCount = int.tryParse(value) ?? 0;
                    _paymentDates = List<DateTime?>.filled(_paymentCount, null);
                    _dateControllers = List.generate(
                      _paymentCount,
                      (_) => TextEditingController(),
                    );
                  });
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _paymentCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
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
                  );
                },
              ),

              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // lógica de salvar aluno
                  }
                },
                icon: Icon(Icons.check_circle),
                label: Text('Salvar Cadastro'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
}
