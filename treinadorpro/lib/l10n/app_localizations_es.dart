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
}
