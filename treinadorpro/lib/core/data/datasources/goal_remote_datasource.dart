import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/igoal_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

import '../../infrastructure/localstorage/storage_service.dart';
import '../../infrastructure/localstorage/token_storage_service.dart';

class GoalRemoteDatasource implements IGoalRemoteDatasource{

  final ApiClient apiClient;
  final AppConfig config;

  final StorageService<String> _tokenStorage = TokenStorageService();

  static const module = 'goal_remote_datasource';

  GoalRemoteDatasource(this.apiClient, this.config);

  @override
  Future<GoalModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<GoalModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<GoalModel>> findAllActiveGoals() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/goal";

    String? token = await _tokenStorage.get();

    if(config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if(config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> modalityList = jsonResponse['objectResponse'];

    return modalityList
        .map((modalityItem) => GoalModel.fromJson(modalityItem))
        .toList();

  }


}