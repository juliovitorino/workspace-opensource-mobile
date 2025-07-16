import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

import '../../../config/app_config.dart';
import '../../infrastructure/localstorage/storage_service.dart';
import '../../infrastructure/localstorage/token_storage_service.dart';
import '../../network/api_client.dart';
import 'iuser_workout_plan_datasource.dart';

class UserWorkoutPlanDatasource implements IUserWorkoutPlanDatasource {
  final ApiClient apiClient;
  final AppConfig config;

  late StorageService<String> _tokenStorage = TokenStorageService();

  UserWorkoutPlanDatasource(this.apiClient, this.config);

  static const module = 'user_workout_plan_datasource';


  @override
  Future<UserWorkoutPlanModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<UserWorkoutPlanModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

}