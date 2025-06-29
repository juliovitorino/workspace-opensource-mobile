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
  Future<PlanTemplateModel> fetchById(String token, int id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<PlanTemplateModel> fetchByUUID(String token, String id) {
    // TODO: implement fetchByUUID
    throw UnimplementedError();
  }

  @override
  Future<List<PlanTemplateModel>> findAllActivePlan() async {
    final String url = "${config.apiBackendUrl}/v1/api/business/public/plan/active";

    if(config.isDebugMode) {
      print('$module :: call url = $url');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
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