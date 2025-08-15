import 'dart:convert';

import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/itraining_pack_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/add_training_pack_request_model.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/data/models/response.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

import '../../infrastructure/localstorage/storage_service.dart';
import '../../infrastructure/localstorage/token_storage_service.dart';

class TrainingPackRemoteDatasource implements ITrainingPackRemoteDatasource {

  final ApiClient apiClient;
  final AppConfig config;

  TrainingPackRemoteDatasource(this.apiClient, this.config);

  final StorageService<String> _tokenStorage = TokenStorageService();

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
      TrainingPackModel>> findAllTrainingPackByPersonalExternalId(
      int page, int size) async {
    final String url = '${config
        .apiBackendUrl}/v1/api/business/trainingpack?page=$page&size=$size';

    if (config.isDebugMode) {
      print('$module :: ok');
      print('call url = $url');
    }

    String? token = await _tokenStorage.get();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
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
    final String url = "${config.apiBackendUrl}/v1/api/business/contract/$externalId";

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    String? token = await _tokenStorage.get();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
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

    String? token = await _tokenStorage.get();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> trainingPackFromTrainerList = jsonResponse['objectResponse'];

    return trainingPackFromTrainerList
        .map((studentItem) => TrainingPackModel.fromJson(studentItem))
        .toList();
  }

  @override
  Future<ApiGenericResponse<bool>> addTrainingPack(AddTrainingPackRequestModel request) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/trainingpack";

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    String? token = await _tokenStorage.get();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.post(
        url, headers: headers, body: jsonEncode(request.toJson()));
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final Map<String, dynamic> response = jsonResponse['response'];
    final bool result = jsonResponse['objectResponse'];

    return ApiGenericResponse(Response(response['msgcode'], response['mensagem']), result);
  }

}