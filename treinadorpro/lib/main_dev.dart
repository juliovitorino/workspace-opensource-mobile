import 'package:flutter/material.dart';
import 'package:treinadorpro/treinador_pro_app.dart';
import 'config/dev_config.dart';

void main() {
  final config = DevConfig();
  runApp(TreinadorProApp(config: config));
}
