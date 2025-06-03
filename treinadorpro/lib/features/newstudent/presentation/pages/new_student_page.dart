import 'package:flutter/material.dart';

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

  String _gender = 'Masculino';
  String _planType = 'Plano Mensal Intermediário';

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
              _buildTextField(_dobController, 'Data de nascimento (AAAA-MM-DD)', keyboardType: TextInputType.datetime),
              _buildTextField(_phoneController, 'Telefone', keyboardType: TextInputType.phone, required: true),
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
                items: [
                  'Plano Mensal Intermediário',
                  'Emagrecimento Master',
                  'Plano Trimestral Avançado',
                  'Plano Light',
                  'HIIT',
                  'Jump'
                ]
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: (val) => setState(() => _planType = val!),
              ),
              _buildTextField(_planStartController, 'Data de início (AAAA-MM-DD)', keyboardType: TextInputType.datetime),
              _buildTextField(_frequencyController, 'Frequência combinada (ex: 3x/semana)'),

              SizedBox(height: 16),
              _buildSectionTitle('Objetivo'),
              _buildTextField(_objectiveController, 'Hipertrofia, emagrecimento, saúde, etc.'),

              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // lógica de salvar aluno
                  }
                },
                icon: Icon(Icons.check_circle),
                label: Text('Salvar Cadastro'),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              ),
              SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.calendar_today),
                label: Text('Agendar Treino'),
                style: OutlinedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text, bool required = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label),
        validator: required
            ? (value) => (value == null || value.isEmpty) ? 'Campo obrigatório' : null
            : null,
      ),
    );
  }
}
