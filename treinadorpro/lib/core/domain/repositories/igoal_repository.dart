import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class IGoalRepository extends Repository<GoalModel, int>{
  Future<List<GoalModel>> findAllActiveGoals();
}