
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/dashboard_datasource.dart';
import 'package:treinadorpro/core/data/datasources/idashboard_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/dashboard_model.dart';
import 'package:treinadorpro/core/domain/repositories/dashboard_repository.dart';
import 'package:treinadorpro/core/domain/repositories/idashboard_repository.dart';
import 'package:treinadorpro/core/viewmodel/dashboard_status_view_model.dart';

import 'app_config_provider.dart';
import 'http_api_client_provider.dart';

// remote datasource provider
final dashboardRemoteDatasourceProvider = Provider<IDashboardDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('exerciseRemoteDatasourceProvider has been created');

  return DashboardDatasource(apiClient, appConfig);
});

// repository provider
final dashboardRepositoryProvider = Provider<IDashboardRepository>((ref){
  final datasource = ref.read(dashboardRemoteDatasourceProvider);
  return DashboardRepository(datasource);
});

// view model provider
final dashboardStatusViewModelProvider = StateNotifierProvider<DashboardStatusViewModel, AsyncValue<ApiGenericResponse<DashboardModel>>>((ref){
  final repository = ref.read(dashboardRepositoryProvider);
  return DashboardStatusViewModel(repository);
});