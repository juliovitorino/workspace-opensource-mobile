import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/modality_model.dart';

abstract class IModalityRemoteDatasource extends IRemoteDatasource<ModalityModel, int>{
  Future<List<ModalityModel>> findAllActiveModalities();
}