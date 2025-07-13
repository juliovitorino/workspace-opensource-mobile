import 'package:treinadorpro/core/data/datasources/idashboard_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/dashboard_model.dart';

import '../../../config/app_config.dart';
import '../../infrastructure/localstorage/storage_service.dart';
import '../../infrastructure/localstorage/token_storage_service.dart';
import '../../network/api_client.dart';
import '../models/response.dart';

class DashboardDatasource implements IDashboardDatasource {
  final ApiClient apiClient;
  final AppConfig config;

  late StorageService<String> _tokenStorage = TokenStorageService();

  DashboardDatasource(this.apiClient, this.config);

  static const module = 'new_student_remote_datasource';

  @override
  Future<ApiGenericResponse<DashboardModel>> dashboardStatus()  async {
    final String url = "${config.apiBackendUrl}/v1/api/business/dashboard/status";

    final String? token = await _tokenStorage.get();

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final response = jsonResponse['response'];
    final dynamic objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        DashboardModel.fromJson(objectResponse)
    );
  }


  @override
  Future<DashboardModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<DashboardModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

}