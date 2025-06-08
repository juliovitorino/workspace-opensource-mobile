import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnvironment() async {
  // configureDependencies();

  // read build ENV variable from command-line, if empty assumes 'dev'
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  print('Environment selected => $env');

  final environmentFilename = 'application.properties-$env.env';
  print('Searching for enviroment filename => $environmentFilename');

  File envFile = File(environmentFilename);
  if (!envFile.existsSync()) {
    print('Enviroment File $environmentFilename not found!');
    exit(1);
  } else {
    print('Environment file found!');
  }

  print('Loading environment file from => ${envFile.absolute.path}');
  await dotenv.load(fileName: envFile.absolute.path);
}