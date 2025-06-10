import 'package:treinadorpro/core/data/models/modality_model.dart';

import '../../../config/app_config.dart';
import '../../network/api_client.dart';
import 'imodality_remote_datasource.dart';

class ModalityRemoteDatasource implements IModalityRemoteDatasource{

  final ApiClient apiClient;
  final AppConfig config;
  ModalityRemoteDatasource(this.apiClient, this.config);

  @override
  Future<ModalityModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<ModalityModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<ModalityModel>> findAllActiveModalities() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/modality";

    if(config.isDebugMode) {
      print('modality_remote_datasource :: call url = $url');
    }

    final jsonResponse = await apiClient.get(url);
    if(config.isDebugMode) {
      print("modality_remote_datasource :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> modalityList = jsonResponse['objectResponse'];

    return modalityList
        .map((modalityItem) => ModalityModel.fromJson(modalityItem))
        .toList();

  }

}