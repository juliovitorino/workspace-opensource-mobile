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
}
