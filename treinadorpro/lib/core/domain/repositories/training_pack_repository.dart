import 'package:treinadorpro/core/data/datasources/itraining_pack_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';

class TrainingPackRepository implements ITrainingPackRepository {

  final ITrainingPackRemoteDatasource _trainingPackRemoteDatasource;

  TrainingPackRepository(this._trainingPackRemoteDatasource);

  static String module = "training_pack_repository";

  @override
  Future<TrainingPackModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<TrainingPackModel> findByUUID(String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

  @override
  Future<PageResultResponseModel<TrainingPackModel>> findAllTrainingPackByPersonalExternalId(String uuid, int page, int size) async {
    print("$module :: uuid = $uuid");

    return await _trainingPackRemoteDatasource.findAllTrainingPackByPersonalExternalId(uuid, page, size);
  }

  @override
  Future<List<TrainingPackModel>> findAllTrainingPackByTrainerExternalId(String externalId) async {
    print("$module :: uuid = $externalId");

    return await _trainingPackRemoteDatasource.findAllTrainingPackByTrainerExternalId(externalId);
  }

  @override
  Future<List<StudentsFromTrainerResponseModel>> findAllStudentsFromTrainer(String externalId) async {
    print("$module :: externalID = $externalId");

    return await _trainingPackRemoteDatasource.findAllStudentsFromTrainer(externalId);
  }


}