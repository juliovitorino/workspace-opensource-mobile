import 'package:treinadorpro/core/data/datasources/itraining_pack_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';

class TrainingPackRepository implements ITrainingPackRespository {

  final ITrainingPackRemoteDatasource _trainingPackRemoteDatasource;

  TrainingPackRepository(this._trainingPackRemoteDatasource);

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
    print("training_pack_repository :: uuid = $uuid");

    return await _trainingPackRemoteDatasource.findAllTrainingPackByPersonalExternalId(uuid, page, size);
  }

}