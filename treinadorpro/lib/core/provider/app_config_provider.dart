
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/config/env_config.dart';

final appConfigProvider = Provider<AppConfig>((ref) => EnvConfig());