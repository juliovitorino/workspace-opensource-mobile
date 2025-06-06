import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:treinadorpro/config/service_locator.dart';
import 'package:treinadorpro/treinador_pro_app.dart';
import 'package:path_provider/path_provider.dart';

import 'core/domain/entities/user.dart';

late Isar isar;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [UserSchema],
    directory: dir.path,
  );

  runApp(TreinadorProApp(config: configureDependencies()));
}
