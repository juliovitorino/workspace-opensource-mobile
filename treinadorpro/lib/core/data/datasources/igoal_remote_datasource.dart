import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';

abstract class IGoalRemoteDatasource extends IRemoteDatasource<GoalModel, int>{
  Future<List<GoalModel>> findAllActiveGoals();
}