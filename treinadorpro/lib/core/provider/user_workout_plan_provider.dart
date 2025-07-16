

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/iuser_workout_plan_datasource.dart';
import 'package:treinadorpro/core/data/datasources/user_workout_plan_datasource.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_workout_plan_repository.dart';
import 'package:treinadorpro/core/domain/repositories/user_workout_plan_repository.dart';

import 'app_config_provider.dart';
import 'http_api_client_provider.dart';

//----------------------------
// remote datasource provider
//----------------------------
final userWorkoutPlanDatasourceProvider = Provider<IUserWorkoutPlanDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('userWorkoutPlanDatasourceProvider has been created');

  return UserWorkoutPlanDatasource(apiClient, appConfig);
});

//----------------------------
// repository provider
//----------------------------
final userWorkoutPlanRespositoryProvider = Provider<IUserWorkoutPlanRepository>((ref){
  final datasource = ref.read(userWorkoutPlanDatasourceProvider);
  return UserWorkoutPlanRepository(datasource);
});