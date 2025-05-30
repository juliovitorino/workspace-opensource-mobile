import 'package:injectable/injectable.dart';

@Singleton()
abstract class AppConfig {
  String get apiBackendUrl;
  String get apiKey;
  String get appName;
  String get appVersion;
  String get appMinorVersion;
  String get enviroment;
}
