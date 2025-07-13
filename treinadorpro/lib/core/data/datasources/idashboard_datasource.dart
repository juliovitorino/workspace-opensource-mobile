import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/dashboard_model.dart';

abstract class IDashboardDatasource extends IRemoteDatasource<DashboardModel,int> {
  Future<ApiGenericResponse<DashboardModel>> dashboardStatus();
}