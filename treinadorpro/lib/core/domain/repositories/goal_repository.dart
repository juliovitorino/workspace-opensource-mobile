import 'package:treinadorpro/core/data/datasources/igoal_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/domain/repositories/igoal_repository.dart';

class GoalRepository implements IGoalRepository{

  final IGoalRemoteDatasource _goalRemoteDatasource;
  GoalRepository(this._goalRemoteDatasource);

  @override
  Future<GoalModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<GoalModel> findByUUID(String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<GoalModel>> findAllActiveGoals() async {
    print('goal_repository :: ok');
    return await _goalRemoteDatasource.findAllActiveGoals();
  }

}