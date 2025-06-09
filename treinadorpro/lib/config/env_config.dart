import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_config.dart';

class EnvConfig implements AppConfig {
  @override
  String get apiBackendUrl => dotenv.env['API_BASE_URL'] ?? '';

  @override
  String get appName => dotenv.env['APP_NAME'] ?? '';

  @override
  String get apiKey => dotenv.env['API_KEY'] ?? '';

  @override
  String get appVersion => dotenv.env['APP_VERSION'] ?? '';

  @override
  String get appMinorVersion => dotenv.env['APP_MINOR_VERSION'] ?? '';

  @override
  String get enviroment => dotenv.env['APP_ENVIRONMENT_DESCRIPTION'] ?? '';

  @override
  bool get isDebugMode => dotenv.env['DEBUG'] == 'true';

  @override
  int get defaultPageSize => int.tryParse(dotenv.env['DEFAULT_PAGE_SIZE'] ?? '') ?? 10;

}
