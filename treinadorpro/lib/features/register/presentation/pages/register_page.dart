import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/config/service_locator.dart';
import 'package:treinadorpro/core/widgets/rounded_button.dart';

import '../blocs/register_state.dart';

class RegisterPage extends StatelessWidget {

  final config = getIt<AppConfig>();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  final _birthdayController = TextEditingController();

  RegisterPage({super.key});

  String? passwordChecker(String pwd1, String pwd2) {
    if( pwd1 != pwd2) {
      return "As senhas são diferentes";
    }
    if(pwd2.length < 6 || pwd1.length < 6) {
      return "Senhas precisam pelo menos ter 6 caracteres";
    }
    return null;

  }

  Widget _buildInputFormFieldName() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(labelText: 'Nome'),
      validator: (v) => v!.isEmpty ? 'Informe seu nome' : null,
    );
  }

  Widget _buildInputFormFieldEmail() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (v) => v!.isEmpty ? 'Email um email válido' : null,
    );
  }

  Widget _buildInputFormFieldPassword() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(labelText: 'Senha', suffixIcon: Icon(Icons.visibility)),
      validator: (v) =>
          v!.length < 6 ? 'A senha deve ter pelo menos 6 caracteres' : null,
    );
  }

  Widget _buildInputFormFieldPasswordCheck() {
    return TextFormField(
      obscureText: true,
      controller: _passwordCheckController,
      decoration: InputDecoration(labelText: 'Contra-Senha', suffixIcon: Icon(Icons.visibility)),
      validator: (v) => passwordChecker(v!, _passwordController.text)
    );
  }

  Widget _buildInputFormFieldBirthday() {
    return TextFormField(
      controller: _birthdayController,
      decoration: InputDecoration(labelText: 'Data de nascimento (YYYY-MM-DD)'),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return RoundedButton(
      text: 'REGISTRAR',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<RegisterCubit>().register(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
            config.apiKey
          );
        }
      },
    );
  }

  Widget _buildFormArea(RegisterState state, BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildInputFormFieldName(),
            _buildInputFormFieldEmail(),
            _buildInputFormFieldPassword(),
            _buildInputFormFieldPasswordCheck(),
            _buildInputFormFieldBirthday(),

            const SizedBox(height: 20),
            state.isLoading
                ? const CircularProgressIndicator()
                : _buildRegisterButton(context)
          ],
        ),
      ),
    );
  }

  void _processFormListener(BuildContext context, RegisterState state) {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      showDialog(
        context: context,
        builder: (_) =>
        const AlertDialog(title: Text("Registrado com sucesso")),
      );
    }
  }

  Widget _buildForm(BuildContext context, RegisterState state){
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: _buildFormArea(state, context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Registrar Novo Usuário')),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) => _processFormListener(context, state),
          builder: (context, state) => _buildForm(context, state)
        ),
      ),
    );
  }
}
