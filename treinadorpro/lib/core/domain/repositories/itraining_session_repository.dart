import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class ITrainingSessionRepository extends Repository<UserTrainingSessionModel, int>{
  Future<ApiGenericResponse<bool>> save(UserTrainingSessionModel request);

  Future<ApiGenericResponse<UserTrainingSessionModel>> findMostRecentTrainingSession(
      String contractExternalId);
}