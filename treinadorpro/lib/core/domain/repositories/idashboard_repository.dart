import 'package:treinadorpro/core/data/models/dashboard_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/api_generic_response.dart';

abstract class IDashboardRepository extends Repository<DashboardModel, int> {
  Future<ApiGenericResponse<DashboardModel>> dashboardStatus();

}