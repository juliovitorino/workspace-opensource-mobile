import 'package:treinadorpro/core/data/datasources/idashboard_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/dashboard_model.dart';
import 'package:treinadorpro/core/domain/repositories/idashboard_repository.dart';

class DashboardRepository implements IDashboardRepository {

  final IDashboardDatasource datasource;
  DashboardRepository(this.datasource);

  @override
  Future<ApiGenericResponse<DashboardModel>> dashboardStatus() async {
    return await datasource.dashboardStatus();
  }

  @override
  Future<DashboardModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<DashboardModel> findByUUID(String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

}