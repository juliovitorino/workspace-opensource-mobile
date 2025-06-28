import 'dart:convert';

import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/data/requests/login_request.dart';
import 'package:treinadorpro/core/data/requests/register_request.dart';
import 'package:treinadorpro/core/data/requests/register_response.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class UserRemoteDatasource implements IUserRemoteDataSource {

  final ApiClient apiClient;
  final AppConfig config;

  UserRemoteDatasource(this.apiClient, this.config);

  static const module = 'user_remote_datasource';

  @override
  Future<UserModel> fetchById(int id) async {
    final response = await apiClient.get('https://jsonplaceholder.typicode.com/users/$id');
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> fetchByUUID(String uuid) async {
    final String url = '${config.apiBackendUrl}/v1/api/business/user/trainer/$uuid';

    if(config.isDebugMode) {
      print('$module :: uuid = $uuid');
      print('call url = $url');
    }

      final response = await apiClient.get(url);
      if(config.isDebugMode) print("$module :: response = $response");

      final userJson = response['objectResponse'];
      return UserModel.fromJson(userJson);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/user/register";

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer token123',
      'X-API-KEY': request.apiKey
    };

    final jsonResponse = await apiClient.post(url, headers: headers, body: jsonEncode(request.toJson()));
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final objectResponse = jsonResponse['objectResponse'];

    return RegisterResponse.fromJson(objectResponse);
  }

  @override
  Future<bool> validateCode(String apiKey, String trainerExternalId, String code) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/user/trainer/validate/$trainerExternalId/$code";

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer token123',
      'X-API-KEY': apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    return jsonResponse['objectResponse'];
  }

  @override
  Future<String> login(String apiKey, LoginRequest loginRequest)  async {
    final String url = "${config.apiBackendUrl}/v1/api/business/user/login";

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer token123',
      'X-API-KEY': apiKey
    };

    final jsonResponse = await apiClient.post(url, headers: headers, body: jsonEncode(loginRequest.toJson()));
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    return jsonResponse['objectResponse'];
  }


}