import 'package:treinadorpro/core/data/datasources/iprogram_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/domain/repositories/iprogram_repository.dart';

class ProgramRepository implements IProgramRepository{

  final IProgramRemoteDatasource _programRemoteDatasource;
  ProgramRepository(this._programRemoteDatasource);

  @override
  Future<List<ProgramModel>> findAllActivePrograms() async {
    print('program_repository :: ok');
    return await _programRemoteDatasource.findAllActivePrograms();
  }


  @override
  Future<ProgramModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<ProgramModel> findByUUID(String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

}