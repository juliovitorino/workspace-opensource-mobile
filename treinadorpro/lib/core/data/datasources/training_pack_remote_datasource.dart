import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/itraining_pack_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class TrainingPackRemoteDatasource implements ITrainingPackRemoteDatasource {

  final ApiClient apiClient;
  final AppConfig config;

  TrainingPackRemoteDatasource(this.apiClient, this.config);
  static const module = 'training_pack_remote_datasource';



  @override
  Future<TrainingPackModel> fetchById(int id) async {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<TrainingPackModel> fetchByUUID(String uuid) async {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<PageResultResponseModel<
      TrainingPackModel>> findAllTrainingPackByPersonalExternalId(String uuid,
      int page, int size) async {
    final String url = '${config.apiBackendUrl}/v1/api/business/trainingpack?page=$page&size=$size&externalId=$uuid';

    if (config.isDebugMode) {
      print('$module :: uuid = $uuid');
      print('call url = $url');
    }

    final jsonResponse = await apiClient.get(url);
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    return PageResultResponseModel.fromJson(
        jsonResponse['objectResponse'],
            (trainingPackItem) => TrainingPackModel.fromJson(trainingPackItem)
    );
  }

  @override
  Future<List<StudentsFromTrainerResponseModel>> findAllStudentsFromTrainer(
      String externalId) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/userpacktraining/$externalId";

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    final jsonResponse = await apiClient.get(url);
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> studentsFromTrainerList = jsonResponse['objectResponse'];

    return studentsFromTrainerList
        .map((studentItem) => StudentsFromTrainerResponseModel.fromJson(studentItem))
        .toList();
  }

  @override
  Future<List<TrainingPackModel>> findAllTrainingPackByTrainerExternalId(String externalId) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/trainingpack/$externalId";

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    final jsonResponse = await apiClient.get(url);
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> trainingPackFromTrainerList = jsonResponse['objectResponse'];

    return trainingPackFromTrainerList
        .map((studentItem) => TrainingPackModel.fromJson(studentItem))
        .toList();
  }

}