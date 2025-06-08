import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/config/service_locator.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_rounded_button.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

import '../../../../core/states/handler_state.dart';
import '../blocs/register_state.dart';

class RegisterPage extends ConsumerWidget {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();
  final _birthdayController = TextEditingController();

  RegisterPage({super.key});

  String? passwordChecker(BuildContext context, String pwd1, String pwd2) {
    if( pwd1 != pwd2) {
      return "As senhas são diferentes";
    }
    if(pwd2.length < 6 || pwd1.length < 6) {
      return AppLocalizations.of(context)?.formRegisterPasswordBlank;
    }
    return null;

  }

  Widget _buildInputFormFieldName(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)?.formRegisterName),
      validator: (v) => v!.isEmpty ? AppLocalizations.of(context)?.formRegisterNameBlank : null,
    );
  }

  Widget _buildInputFormFieldEmail(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)?.formRegisterEmail),
      validator: (v) => v!.isEmpty ? AppLocalizations.of(context)?.formRegisterEmailBlank : null,
    );
  }

  Widget _buildInputFormFieldPassword(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)?.formRegisterPassword, suffixIcon: Icon(Icons.visibility)),
      validator: (v) =>
          v!.length < 6 ? AppLocalizations.of(context)?.formRegisterPasswordBlank : null,
    );
  }

  Widget _buildInputFormFieldPasswordCheck(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: _passwordCheckController,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)?.formRegisterPasswordChecker, suffixIcon: Icon(Icons.visibility)),
      validator: (v) => passwordChecker(context, v!, _passwordController.text)
    );
  }

  Widget _buildInputFormFieldBirthday(BuildContext context) {
    return TextFormField(
      controller: _birthdayController,
      decoration: InputDecoration(labelText: AppLocalizations.of(context)?.formRegisterBirthday),
    );
  }

  Widget _buildRegisterButton(BuildContext context, AppConfig config) {
    return ProWidgetRoundedButton(
      text: AppLocalizations.of(context)!.formRegisterButton,
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

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildInputFormFieldName(context),
            _buildInputFormFieldEmail(context),
            _buildInputFormFieldPassword(context),
            _buildInputFormFieldPasswordCheck(context),
            _buildInputFormFieldBirthday(context),

            const SizedBox(height: 20),
            state.isLoading
                ? const CircularProgressIndicator()
                : _buildRegisterButton(context, config)
          ],
        ),
      ),
    );
  }

  Future<void> _processFormListener(BuildContext context, HandlerState state) async {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
    } else if (!state.isLoading && state.errorMessage == null) {
      await showDialog(
        context: context,
        builder: (_) =>
        AlertDialog(title: Text(AppLocalizations.of(context)!.sucessTitle),
        content: Text(AppLocalizations.of(context)!.formRegisterSuccessMessage),),
      );

      Navigator.popAndPushNamed(context, AppRoutes.validateCode);

    }
  }

  Widget _buildForm(BuildContext context, HandlerState state, AppConfig config){
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: _buildFormArea(state, context, config),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppConfig config = ref.watch(appConfigProvider);

    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.formRegisterTitle)),
        body: BlocConsumer<RegisterCubit, HandlerState>(
          listener: (context, state) => _processFormListener(context, state),
          builder: (context, state) => _buildForm(context, state, config)
        ),
      ),
    );
  }
}
