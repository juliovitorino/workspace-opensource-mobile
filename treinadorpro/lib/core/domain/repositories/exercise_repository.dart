import 'package:treinadorpro/core/data/datasources/iexercise_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/domain/repositories/iexercise_repository.dart';

class ExerciseRepository implements IExerciseRepository{

  final IExerciseRemoteDatasource _exerciseRemoteDatasource;
  ExerciseRepository(this._exerciseRemoteDatasource);

  @override
  Future<List<ExerciseModel>> findAllActiveExercises() async {
    print('exercise_repository :: ok');
    return await _exerciseRemoteDatasource.findAllActiveExercises();
  }

  @override
  Future<ExerciseModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<ExerciseModel> findByUUID(String id) {
    // TODO: implement findAllActiveExercises
    throw UnimplementedError();
  }

}