import 'package:treinadorpro/core/data/datasources/iuser_workout_plan_datasource.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

import '../../data/datasources/icontract_datasource.dart';
import 'iuser_workout_plan_repository.dart';

class UserWorkoutPlanRepository implements IUserWorkoutPlanRepository{

  final IUserWorkoutPlanDatasource datasource;
  UserWorkoutPlanRepository(this.datasource);

  @override
  Future<UserWorkoutPlanModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<UserWorkoutPlanModel> findByUUID(String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

}