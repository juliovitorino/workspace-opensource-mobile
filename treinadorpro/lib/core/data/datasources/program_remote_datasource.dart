import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/iprogram_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class ProgramRemoteDatasource implements IProgramRemoteDatasource {
  final ApiClient apiClient;
  final AppConfig config;

  ProgramRemoteDatasource(this.apiClient, this.config);

  @override
  Future<ProgramModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<ProgramModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID

    throw UnimplementedError();
  }

  @override
  Future<List<ProgramModel>> findAllActivePrograms() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/program";

    if (config.isDebugMode) {
      print('program_remote_datasource :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer token123',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if (config.isDebugMode) {
      print("program_remote_datasource :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> modalityList = jsonResponse['objectResponse'];

    return modalityList
        .map((modalityItem) => ProgramModel.fromJson(modalityItem))
        .toList();
  }
}
