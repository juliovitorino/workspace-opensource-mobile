import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';

abstract class IProgramRemoteDatasource extends IRemoteDatasource<ProgramModel, int>{
  Future<List<ProgramModel>> findAllActivePrograms();
}