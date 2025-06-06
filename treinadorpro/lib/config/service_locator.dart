import 'package:treinadorpro/config/dev_config.dart';
import 'package:treinadorpro/config/prod_config.dart';

import 'app_config.dart';

AppConfig configureDependencies() {
  const env = String.fromEnvironment('ENV');

  switch (env) {
    case 'prod':
      return ProdConfig();
    case 'dev':
    default:
      return DevConfig();
  }
}
