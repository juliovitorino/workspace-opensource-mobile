import 'package:treinadorpro/core/data/models/work_group_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class IWorkgroupRepository extends Repository<WorkgroupModel, int>{
  Future<List<WorkgroupModel>> findAllActiveWorkgroups();

}