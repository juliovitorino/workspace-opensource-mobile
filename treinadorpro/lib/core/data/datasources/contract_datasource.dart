import 'dart:convert';

import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/icontract_datasource.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/data/models/external_id_response_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class ContractDatasource implements IContractDatasource {
  final ApiClient apiClient;
  final AppConfig config;

  ContractDatasource(this.apiClient, this.config);

  static const module = 'new_student_remote_datasource';

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

    if (config.isDebugMode) {
      print('$module :: call url = $url');
    }

    final jsonResponse = await apiClient.post(url, body: jsonEncode(request.toJson()));
    if (config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final objectResponse = jsonResponse['objectResponse'];

    return objectResponse['externalId'];
  }
}
