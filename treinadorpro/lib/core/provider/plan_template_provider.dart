
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/iplan_template_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/plan_template_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/plan_template_model.dart';
import 'package:treinadorpro/core/domain/repositories/iplan_template_repository.dart';
import 'package:treinadorpro/core/domain/repositories/plan_template_repository.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/http_api_client_provider.dart';
import 'package:treinadorpro/core/viewmodel/plan_template_list_view_model.dart';

// remote datasource provider
final planTemplateDatasourceProvider = Provider<IPlanTemplateRemoteDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.read(appConfigProvider);

  print('planTemplateDatasourceProvider has been created');

  return PlanTemplateRemoteDatasource(apiClient, appConfig);
});

// repository provider
final planTemplateRepositoryProvider = Provider<IPlanTemplateRepository>((ref){
  final remoteDatasource = ref.read(planTemplateDatasourceProvider);
  return PlanTemplateRepository(remoteDatasource);
});

// view model provider
final planTemplateListViewModelProvider = StateNotifierProvider<PlanTemplateListViewModel, AsyncValue<List<PlanTemplateModel>>>((ref){
  final repository = ref.read(planTemplateRepositoryProvider);
  return PlanTemplateListViewModel(repository);
});