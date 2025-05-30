// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcome => 'Bienvenido a ';

  @override
  String get login => 'INICIAR SESÍON';

  @override
  String get languages => 'Idiomas';

  @override
  String get ptLanguage => 'Portugués';

  @override
  String get enLanguage => 'Inglés';

  @override
  String get esLanguage => 'Español';

  @override
  String get signup => 'Registrarse';

  @override
  String get sucessTitle => 'Sucesso';

  @override
  String get formRegisterTitle => 'Registrar Nuevo Usuario';

  @override
  String get formRegisterName => 'Nombre';

  @override
  String get formRegisterNameBlank => 'El nombre es obligatorio';

  @override
  String get formRegisterEmail => 'Correo electrónico';

  @override
  String get formRegisterEmailBlank => 'El correo electrónico es obligatorio';

  @override
  String get formRegisterPassword => 'Contraseña';

  @override
  String get formRegisterPasswordBlank =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get formRegisterPasswordChecker => 'Confirmar contraseña';

  @override
  String get formRegisterPasswordCheckerBlank =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get formRegisterBirthday => 'Fecha de Nacimiento (YYYY-MM-DD)';

  @override
  String get formRegisterBirthdayBlank => 'Fecha inválida';

  @override
  String get formRegisterButton => 'REGISTRAR';

  @override
  String get formRegisterSuccessMessage => 'Registrado exitosamente';
}
