import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/states/handler_state.dart';
import 'package:treinadorpro/features/validatesixdigit/blocs/validate_six_digit_cubit.dart';

import '../../../config/app_config.dart';
import '../../../config/service_locator.dart';
import '../../../core/widgets/pro_widget_rounded_button.dart';
import '../../../l10n/app_localizations.dart';

class ValidateSixDigitPage extends ConsumerWidget {

  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  ValidateSixDigitPage({super.key});

  void _processFormListener(BuildContext context, HandlerState state) async {
    if (state.errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.errorMessage!), backgroundColor: Colors.red,));
    } else if (!state.isLoading && state.errorMessage == null) {
      await showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(title: Text(AppLocalizations.of(context)!.sucessTitle),
              content: Text('Código foi validado com sucesso'),),
      );

      Navigator.popAndPushNamed(context, AppRoutes.login);

    }
  }

  Widget _buildValidateButton(BuildContext context, AppConfig config) {
    return ProWidgetRoundedButton(
      text: 'VALIDAR',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<ValidateSixDigitCubit>().validate(
              _codeController.text,
              config.apiKey
          );
        }
      },
    );
  }

  Widget _buildInputFormFieldCode(BuildContext context) {
    return TextFormField(
      controller: _codeController,
      decoration: InputDecoration(labelText: 'código 6 dígitos'),
      validator: (v) => v!.isEmpty ? 'Código é obrigatório' : null,
    );
  }

  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('Foi enviado para seu email um código de 6 dígitos'),
            _buildInputFormFieldCode(context),

            const SizedBox(height: 20),
            state.isLoading
                ? const CircularProgressIndicator()
                : _buildValidateButton(context, config)
          ],
        ),
      ),
    );
  }
  Widget _buildForm(BuildContext context, state, AppConfig config) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: _buildFormArea(state, context, config),
        ),
      ),
    );  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppConfig config = ref.watch(appConfigProvider);

    return BlocProvider(create: (_) => ValidateSixDigitCubit(),
    child: Scaffold(
      appBar: AppBar(
        title: Text('Validar Código'),
      ),
      body: BlocConsumer<ValidateSixDigitCubit, HandlerState>(
        listener: (context, state) => _processFormListener(context, state),
        builder: (context, state) => _buildForm(context, state, config)
      ),
    ),);
  }
}
