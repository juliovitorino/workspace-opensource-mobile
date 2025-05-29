import 'app_config.dart';

class DevConfig implements AppConfig {
  @override
  String get apiBackendUrl => 'https://prod.api.exemplo.com';

  @override
  String get appName => 'Treinador Pro+';

  @override
  String get apiKey => '2409aeab-9179-4ad7-b400-891ce338b57a';

  @override
  String get appVersion => '1.0.0.20250529.1701';

  @override
  String get appMinorVersion => '1.0.0';
}
