import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/domain/entities/user.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_entity_local_storage_service.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/features/login/presentation/blocs/login_state.dart';

import '../../../../config/app_config.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/infrastructure/localstorage/user_entity_local_storage_service_isar.dart';
import '../../../../core/states/handler_state.dart';
import '../../../../core/widgets/pro_widget_brand_image.dart';
import '../../../../core/widgets/pro_widget_rounded_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/pro_widget_rounded_input_field.dart';
import '../widgets/pro_widget_rounded_password_field.dart';
import '../widgets/pro_widget_social_button_row.dart';

class LoginPage extends ConsumerWidget {
  final IUserEntityLocalStorageService _userEntityLocalStorage = UserEntityLocalStorageServiceIsar();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key});

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
              content: Text('Login realizado com sucesso')
            ),
      );

      await _userEntityLocalStorage.save(User.currentUser);
      Navigator.popAndPushNamed(context, AppRoutes.dashboard);

    }
  }

  Widget _buildLoginButton(BuildContext context, AppConfig config) {
    return ProWidgetRoundedButton(
      text: 'ENTRAR',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<LoginStateCubit>().processLogin(
              _emailController.text,
              _passwordController.text,
              config.apiKey
          );
        }
      },
    );
  }
  Widget _buildFormArea(HandlerState state, BuildContext context, AppConfig config) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.login),
            SizedBox(height: size.height * 0.03),
            ProWidgetBrandImage(imagePath: 'assets/logos/logo.jpg'),
            SizedBox(height: size.height * 0.03),
            ProWidgetRoundedInputField(hintText: "Your Email", onChanged: (value) {}, controller: _emailController,),
            ProWidgetRoundedPasswordField(onChanged: (value) {}, controller: _passwordController,),
            const SizedBox(height: 20),
            state.isLoading
                ? const CircularProgressIndicator()
                : _buildLoginButton(context, config),
            ProWidgetSocialButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, HandlerState state, AppConfig config) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(child: _buildFormArea(state, context, config)),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppConfig config = ref.watch(appConfigProvider);

    return BlocProvider(
      create: (_) => LoginStateCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginStateCubit, HandlerState>(
          listener: (context, state) => _processFormListener(context, state),
          builder: (context, state) => _buildForm(context, state, config),
        ),
      ),
    );
  }
}
