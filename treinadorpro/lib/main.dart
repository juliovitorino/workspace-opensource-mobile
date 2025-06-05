import 'package:flutter/material.dart';
import 'package:treinadorpro/config/service_locator.dart';
import 'package:treinadorpro/treinador_pro_app.dart';

void main() {
  runApp(TreinadorProApp(config: configureDependencies()));
}
