import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';

import '../models/page_result_response_model.dart';

abstract class ITrainingPackRemoteDatasource extends IRemoteDatasource<TrainingPackModel, int> {
  Future<PageResultResponseModel<TrainingPackModel>> findAllTrainingPackByPersonalExternalId(String id, int page, int size);
  Future<List<StudentsFromTrainerResponseModel>> findAllStudentsFromTrainer(String externalId);

}