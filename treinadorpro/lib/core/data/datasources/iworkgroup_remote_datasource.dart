import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/work_group_model.dart';

abstract class IWorkgroupRemoteDatasource extends IRemoteDatasource<WorkgroupModel, int>{
  Future<List<WorkgroupModel>> findAllActiveWorkgroups();
}