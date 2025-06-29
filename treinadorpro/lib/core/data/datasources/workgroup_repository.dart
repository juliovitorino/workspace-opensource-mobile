import 'package:treinadorpro/core/data/datasources/iworkgroup_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/iworkgroup_repository.dart';
import 'package:treinadorpro/core/data/models/work_group_model.dart';

class WorkgroupRepository implements IWorkgroupRepository{

  final IWorkgroupRemoteDatasource _workgroupRemoteDatasource;
  WorkgroupRepository(this._workgroupRemoteDatasource);

  static const module = 'workgoup_repository';

  @override
  Future<List<WorkgroupModel>> findAllActiveWorkgroups(String token) async {
    print('$module :: ok');
    return await _workgroupRemoteDatasource.findAllActiveWorkgroups(token);
  }

  @override
  Future<WorkgroupModel> findById(String token, int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<WorkgroupModel> findByUUID(String token, String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

}