import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:treinadorpro/config/dev_config.dart';
import 'package:treinadorpro/config/prod_config.dart';

import 'app_config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {

  const env = String.fromEnvironment('ENV');

  switch (env){
    case 'prod':
      getIt.registerSingleton<AppConfig>(ProdConfig());
      break;
    case 'dev':
    default:
      getIt.registerSingleton<AppConfig>(DevConfig());
  }
}
