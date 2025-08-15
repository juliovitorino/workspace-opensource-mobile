import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/add_training_pack_request_model.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';

import '../models/page_result_response_model.dart';

abstract class ITrainingPackRemoteDatasource extends IRemoteDatasource<TrainingPackModel, int> {
  Future<PageResultResponseModel<TrainingPackModel>> findAllTrainingPackByPersonalExternalId(int page, int size);
  Future<List<TrainingPackModel>> findAllTrainingPackByTrainerExternalId(String id);
  Future<List<StudentsFromTrainerResponseModel>> findAllStudentsFromTrainer(String externalId);
  Future<ApiGenericResponse<bool>> addTrainingPack(AddTrainingPackRequestModel request);
  Future<void> changeStatusTrash(String externalId);
  Future<void> changeStatusRecover(String externalId);

}