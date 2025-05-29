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
}
