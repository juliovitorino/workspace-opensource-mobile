import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/iexercise_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

import '../../infrastructure/localstorage/storage_service.dart';
import '../../infrastructure/localstorage/token_storage_service.dart';

class ExerciseRemoteDatasource implements IExerciseRemoteDatasource{

  final ApiClient apiClient;
  final AppConfig config;

  final StorageService<String> _tokenStorage = TokenStorageService();

  ExerciseRemoteDatasource(this.apiClient, this.config);

  @override
  Future<ExerciseModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<ExerciseModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<ExerciseModel>> findAllActiveExercises() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/exercise";

    String? token = await _tokenStorage.get();

    if(config.isDebugMode) {
      print('exercise_remote_datasource :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if(config.isDebugMode) {
      print("exercise_remote_datasource :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> exerciseList = jsonResponse['objectResponse'];

    return exerciseList
        .map((item) => ExerciseModel.fromJson(item))
        .toList();

  }


}