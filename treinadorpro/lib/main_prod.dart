import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:treinadorpro/treinador_pro_app.dart';

import 'config/service_locator.dart';
import 'core/domain/entities/user_entity.dart';
late Isar isar;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [UserEntitySchema], 
    directory: dir.path,
  );
  runApp(TreinadorProApp(config: configureDependencies()));
}
