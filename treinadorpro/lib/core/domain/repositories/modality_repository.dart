import 'package:treinadorpro/core/data/datasources/imodality_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/modality_model.dart';
import 'package:treinadorpro/core/domain/repositories/imodality_repository.dart';

class ModalityRepository implements IModalityRepository{

  final IModalityRemoteDatasource _modalityRemoteDatasource;

  ModalityRepository(this._modalityRemoteDatasource);

  @override
  Future<ModalityModel> findById(String token, int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<ModalityModel> findByUUID(String token, String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<ModalityModel>> findAllActiveModalities(String token) async {
    print('modality_repository :: ok');

    return await _modalityRemoteDatasource.findAllActiveModalities(token);
  }

}