import 'package:flutter/material.dart';
import 'package:treinadorpro/treinador_pro_app.dart';
import 'config/dev_config.dart';
import 'config/service_locator.dart';

void main() {
  configureDependencies();

  // final config = DevConfig();
  runApp(TreinadorProApp());
}
