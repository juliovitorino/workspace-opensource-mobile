import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';

abstract class IExerciseRemoteDatasource extends IRemoteDatasource<ExerciseModel, int>{
  Future<List<ExerciseModel>> findAllActiveExercises();

}