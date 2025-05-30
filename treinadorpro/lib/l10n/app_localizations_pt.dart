// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get welcome => 'Bem-vindo ao ';

  @override
  String get login => 'ENTRAR';

  @override
  String get languages => 'Idiomas';

  @override
  String get ptLanguage => 'Português';

  @override
  String get enLanguage => 'Inglês';

  @override
  String get esLanguage => 'Espanhol';

  @override
  String get signup => 'Registrar-se';

  @override
  String get sucessTitle => 'Sucesso';

  @override
  String get formRegisterTitle => 'Registrar Novo Usuário';

  @override
  String get formRegisterName => 'Nome';

  @override
  String get formRegisterNameBlank => 'Nome é obrigatório';

  @override
  String get formRegisterEmail => 'Email';

  @override
  String get formRegisterEmailBlank => 'Email é obrigatório';

  @override
  String get formRegisterPassword => 'Senha';

  @override
  String get formRegisterPasswordBlank =>
      'A senha deve ter pelo menos 6 caracteres';

  @override
  String get formRegisterPasswordChecker => 'Contra-senha';

  @override
  String get formRegisterPasswordCheckerBlank =>
      'A senha deve ter pelo menos 6 caracteres';

  @override
  String get formRegisterBirthday => 'Data de Nascimento (YYYY-MM-DD)';

  @override
  String get formRegisterBirthdayBlank => 'Data inválida';

  @override
  String get formRegisterButton => 'REGISTRAR';

  @override
  String get formRegisterSuccessMessage => 'Registrado com sucesso';
}
