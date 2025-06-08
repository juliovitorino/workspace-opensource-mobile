import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/datasources/itraining_pack_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class TrainingPackRemoteDatasource implements ITrainingPackRemoteDatasource {

  final ApiClient apiClient;
  final AppConfig config;

  TrainingPackRemoteDatasource(this.apiClient, this.config);

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
  Future<List<TrainingPackModel>> findAllTrainingPackByPersonalExternalId(String uuid) async {
    final String url = '${config.apiBackendUrl}/v1/api/business/trainingpack/$uuid';

    if(config.isDebugMode) {
      print('training_pack_remote_datasource :: uuid = $uuid');
      print('call url = $url');
    }

    final response = await apiClient.get(url);
    if(config.isDebugMode) print("training_pack_remote_datasource :: response = $response");

    final List<dynamic> jsonList = response['objectResponse'];

    return jsonList.map(
            (packTrainingItemJson) => TrainingPackModel.fromJson(packTrainingItemJson)
      ).toList();
  }

}