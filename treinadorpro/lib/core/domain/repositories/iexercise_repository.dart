import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class IExerciseRepository extends Repository<ExerciseModel, int>{
  Future<List<ExerciseModel>> findAllActiveExercises();

}