import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/add_training_pack_request_model.dart';
import '../../data/models/api_generic_response.dart';
import '../../data/models/page_result_response_model.dart';
import '../../data/models/students_from_trainer_response_model.dart';

abstract class ITrainingPackRepository extends Repository<TrainingPackModel, int>{
  Future<PageResultResponseModel<TrainingPackModel>> findAllTrainingPackByPersonalExternalId(int page, int size);
  Future<List<TrainingPackModel>> findAllTrainingPackByTrainerExternalId(String externalId);
  Future<List<StudentsFromTrainerResponseModel>> findAllStudentsFromTrainer(String externalId);
  Future<ApiGenericResponse<bool>> addTrainingPack(AddTrainingPackRequestModel request);
  Future<void> changeStatusTrash(String externalId);
  Future<void> changeStatusRecover(String externalId);
}