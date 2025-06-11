import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/iexercise_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class ExerciseRemoteDatasource implements IExerciseRemoteDatasource{

  final ApiClient apiClient;
  final AppConfig config;

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

    if(config.isDebugMode) {
      print('exercise_remote_datasource :: call url = $url');
    }

    final jsonResponse = await apiClient.get(url);
    if(config.isDebugMode) {
      print("exercise_remote_datasource :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> exerciseList = jsonResponse['objectResponse'];

    return exerciseList
        .map((item) => ExerciseModel.fromJson(item))
        .toList();

  }


}