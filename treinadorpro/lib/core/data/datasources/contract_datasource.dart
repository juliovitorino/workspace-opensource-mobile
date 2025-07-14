import 'dart:convert';

import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/icontract_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/data/models/external_id_response_model.dart';
import 'package:treinadorpro/core/data/models/response.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/token_storage_service.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class ContractDatasource implements IContractDatasource {
  final ApiClient apiClient;
  final AppConfig config;

  late StorageService<String> _tokenStorage = TokenStorageService();

  ContractDatasource(this.apiClient, this.config);

  static const module = 'contract_datasource';

  @override
  Future<ExternalIdResponseModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<ExternalIdResponseModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<String> save(CreateNewStudentContractRequest request) async {
    final String url = "${config.apiBackendUrl}/v1/api/business/contract";

    final String? token = await _tokenStorage.get();

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.post(url, headers: headers, body: jsonEncode(request.toJson()));
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final objectResponse = jsonResponse['objectResponse'];

    return objectResponse['externalId'];
  }

  @override
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllActiveContracts() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/contract/trainer/active";

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
    final List<dynamic> objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        objectResponse
        .map((contract) => ContractResponseModel.fromJson(contract))
        .toList());
  }

  @override
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllContractTodayWorkout()  async {
    final String url = "${config.apiBackendUrl}/v1/api/business/contract/trainer/today";

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
    final List<dynamic> objectResponse = jsonResponse['objectResponse'];

    return ApiGenericResponse(
        Response(response['msgcode'], response['mensagem']),
        objectResponse
            .map((contract) => ContractResponseModel.fromJson(contract))
            .toList());
  }
}
