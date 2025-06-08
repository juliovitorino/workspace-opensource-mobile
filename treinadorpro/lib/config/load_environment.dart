import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnvironment() async {
  // configureDependencies();

  // read build ENV variable from command-line, if empty assumes 'dev'
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  print('Environment selected => $env');

  final environmentFilename = 'assets/env/application.properties-$env.env';
  print('Searching for enviroment filename => $environmentFilename');

  try {

    print('Searching bundle for => $environmentFilename');
    final content = await rootBundle.loadString(environmentFilename);

    print('Bundle response is ok for enviroment file');
    await dotenv.load(fileName: environmentFilename);
  } catch (e) {
    print('Error loading enviroment file: $e');
  }
}