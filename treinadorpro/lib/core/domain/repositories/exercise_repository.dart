import 'package:treinadorpro/core/data/datasources/iexercise_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/domain/repositories/iexercise_repository.dart';

class ExerciseRepository implements IExerciseRepository{

  final IExerciseRemoteDatasource _exerciseRemoteDatasource;
  ExerciseRepository(this._exerciseRemoteDatasource);

  @override
  Future<List<ExerciseModel>> findAllActiveExercises(String token) async {
    print('exercise_repository :: ok');
    return await _exerciseRemoteDatasource.findAllActiveExercises(token);
  }

  @override
  Future<ExerciseModel> findById(String token, int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<ExerciseModel> findByUUID(String token, String id) {
    // TODO: implement findAllActiveExercises
    throw UnimplementedError();
  }

}