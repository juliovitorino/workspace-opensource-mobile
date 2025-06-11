import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class IProgramRepository extends Repository<ProgramModel, int>{
  Future<List<ProgramModel>> findAllActivePrograms();

}