import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/iworkgroup_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/work_group_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

import '../../infrastructure/localstorage/storage_service.dart';
import '../../infrastructure/localstorage/token_storage_service.dart';

class WorkgroupRemoteDatasource implements IWorkgroupRemoteDatasource{
  final ApiClient apiClient;
  final AppConfig config;

  static const module = 'workgroup_remote_datasource';

  WorkgroupRemoteDatasource(this.apiClient, this.config);

  final StorageService<String> _tokenStorage = TokenStorageService();

  @override
  Future<WorkgroupModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<WorkgroupModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<WorkgroupModel>> findAllActiveWorkgroups() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/wg";

    if(config.isDebugMode) {
      print('$module :: call url = $url');
    }

    String? token = await _tokenStorage.get();

        Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if(config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> workgroupList = jsonResponse['objectResponse'];

    return workgroupList
        .map((workgroupItem) => WorkgroupModel.fromJson(workgroupItem))
        .toList();
  }

}
