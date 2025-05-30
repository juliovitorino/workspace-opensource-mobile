// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome to ';

  @override
  String get login => 'LOGIN';

  @override
  String get languages => 'Languages';

  @override
  String get ptLanguage => 'Portuguese';

  @override
  String get enLanguage => 'English';

  @override
  String get esLanguage => 'Spanish';

  @override
  String get signup => 'SIGN UP';

  @override
  String get sucessTitle => 'Sucesso';

  @override
  String get formRegisterTitle => 'Register New User';

  @override
  String get formRegisterName => 'Name';

  @override
  String get formRegisterNameBlank => 'Name is required';

  @override
  String get formRegisterEmail => 'Email';

  @override
  String get formRegisterEmailBlank => 'Email is required';

  @override
  String get formRegisterPassword => 'Password';

  @override
  String get formRegisterPasswordBlank =>
      'The password should be 6 character at least';

  @override
  String get formRegisterPasswordChecker => 'Password Re-type';

  @override
  String get formRegisterPasswordCheckerBlank =>
      'The password should be 6 character at least';

  @override
  String get formRegisterBirthday => 'Birthday (YYYY-MM-DD)';

  @override
  String get formRegisterBirthdayBlank => 'Invalid date';

  @override
  String get formRegisterButton => 'REGISTER';

  @override
  String get formRegisterSuccessMessage => 'Register successfully';
}
