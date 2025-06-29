import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/plan_template_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

import 'iplan_template_remote_datasource.dart';

class PlanTemplateRemoteDatasource implements IPlanTemplateRemoteDatasource{

  final ApiClient apiClient;
  final AppConfig config;

  static const module = 'plan_template_remote_datasource';

  PlanTemplateRemoteDatasource(this.apiClient, this.config);

  @override
  Future<PlanTemplateModel> fetchById(int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<PlanTemplateModel> fetchByUUID(String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<PlanTemplateModel>> findAllActivePlan() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/plan/active";

    if(config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer token123',
      'X-API-KEY': config.apiKey
    };

    final jsonResponse = await apiClient.get(url, headers: headers);
    if(config.isDebugMode) {
      print("$module :: jsonResponse = $jsonResponse");
    }

    final List<dynamic> planList = jsonResponse['objectResponse'];

    return planList
        .map((planItem) => PlanTemplateModel.fromJson(planItem))
        .toList();

  }

}