import 'dart:convert';
import 'dart:math';

import 'package:treinadorpro/core/data/datasources/itraining_session_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/booking_model_request.dart';
import 'package:treinadorpro/core/data/models/find_all_training_session_calendar_request_model.dart';
import 'package:treinadorpro/core/data/models/response.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';

import '../../../config/app_config.dart';
import '../../infrastructure/localstorage/storage_service.dart';
import '../../infrastructure/localstorage/token_storage_service.dart';
import '../../network/api_client.dart';

class TrainingSessionDatasource implements ITrainingSessionDatasource {
  final ApiClient apiClient;
  final AppConfig config;

  late StorageService<String> _tokenStorage = TokenStorageService();

  TrainingSessionDatasource(this.apiClient, this.config);

  static const module = 'training_session_datasource';

  @override
  Future<UserTrainingSessionModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<UserTrainingSessionModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<ApiGenericResponse<bool>> save(UserTrainingSessionModel request) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/training/session";

    final String? token = await _tokenStorage.get();

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey,
    };

    final jsonResponse = await apiClient.post(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final response = jsonResponse['response'];
    final bool objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        objectResponse
    );
  }

  @override
  Future<ApiGenericResponse<UserTrainingSessionModel>> findMostRecentTrainingSession(
      String contractExternalId) async {
    final String url = "${config
        .apiBackendUrl}/v1/api/business/training/session/$contractExternalId";

    final String? token = await _tokenStorage.get();

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey,
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final response = jsonResponse['response'];
    final Map<String, dynamic> objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        UserTrainingSessionModel.fromJson(objectResponse)
    );
  }

  @override
  Future<ApiGenericResponse<bool>> bookingTrainingSession(BookingModelRequest request) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/training/session/booking";

    final String? token = await _tokenStorage.get();

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey,
    };

    final jsonResponse = await apiClient.post(
      url,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final response = jsonResponse['response'];
    final bool objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        objectResponse
    );
  }

  @override
  Future<ApiGenericResponse<List<UserTrainingSessionModel>>> findTrainingSessionCalendar(FindAllTrainingSessionCalendarRequestModel request) async {
    final String url = "${config
        .apiBackendUrl}/v1/api/business/training/session/calendar";

    final String? token = await _tokenStorage.get();

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey,
    };

    final jsonResponse = await apiClient.post(url, headers: headers, body: jsonEncode(request.toJson()));
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final response = jsonResponse['response'];
    final List<dynamic> objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        objectResponse.map((e) => UserTrainingSessionModel.fromJson(e))
        .toList()
    );
  }

  @override
  Future<ApiGenericResponse<bool>> deleteTrainingSession(String contractExternalId, String trainingSessionExternalId)  async {
    final String url = "${config.apiBackendUrl}/v1/api/business/training/session/${contractExternalId}/${trainingSessionExternalId}";

    final String? token = await _tokenStorage.get();

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey,
    };

    final jsonResponse = await apiClient.delete(
      url,
      headers: headers
    );
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final response = jsonResponse['response'];
    final bool objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        objectResponse
    );
  }
}