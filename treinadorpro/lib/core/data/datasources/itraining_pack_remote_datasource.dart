import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';

abstract class ITrainingPackRemoteDatasource extends IRemoteDatasource<TrainingPackModel, int> {
  Future<List<TrainingPackModel>> findAllTrainingPackByPersonalExternalId(String id);

}