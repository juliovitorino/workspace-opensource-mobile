// remote datasource provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/goal_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/igoal_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/domain/repositories/goal_repository.dart';
import 'package:treinadorpro/core/domain/repositories/igoal_repository.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/http_api_client_provider.dart';
import 'package:treinadorpro/core/viewmodel/goal_view_model.dart';

// remote datasource provider
final goalRemoteDatasourceProvider = Provider<IGoalRemoteDatasource>((ref) {
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('goalDatasourceProvider has been created');

  return GoalRemoteDatasource(apiClient, appConfig);
});

// repository provider
final goalRepositoryProvider = Provider<IGoalRepository>((ref) {
  final remoteDatasource = ref.read(goalRemoteDatasourceProvider);
  return GoalRepository(remoteDatasource);
});

// view model provider
final goalViewModelProvider = StateNotifierProvider<GoalViewModel, AsyncValue<List<GoalModel>>>((ref){
  final repository = ref.read(goalRepositoryProvider);
  print('goalViewModelProvider has been created');

  return GoalViewModel(repository);
});