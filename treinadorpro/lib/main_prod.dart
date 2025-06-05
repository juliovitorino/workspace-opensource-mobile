import 'package:flutter/material.dart';
import 'package:treinadorpro/treinador_pro_app.dart';

import 'config/service_locator.dart';

void main() {
  runApp(TreinadorProApp(config: configureDependencies()));
}
