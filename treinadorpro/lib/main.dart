import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:treinadorpro/treinador_pro_app.dart';

import 'config/load_environment.dart';
import 'core/domain/entities/user.dart';
import 'firebase_options.dart';

late Isar isar;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await loadEnvironment();

  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open([UserSchema], directory: dir.path);

  // enclose App into a Riverpod ProviderScope() for Consumer() widget
  // to know that exists a provider
  runApp(
    ProviderScope(child: TreinadorProApp()),
  );
}
