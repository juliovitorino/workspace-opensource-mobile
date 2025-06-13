import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/page_result_response_model.dart';
import '../../data/models/students_from_trainer_response_model.dart';

abstract class ITrainingPackRespository extends Repository<TrainingPackModel, int>{
  Future<PageResultResponseModel<TrainingPackModel>> findAllTrainingPackByPersonalExternalId(String id, int page, int size);
  Future<List<StudentsFromTrainerResponseModel>> findAllStudentsFromTrainer(String externalId);


}