import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/ExerciseRemoteDatasource.dart';
import 'package:treinadorpro/core/data/datasources/iexercise_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/domain/repositories/exercise_repository.dart';
import 'package:treinadorpro/core/domain/repositories/iexercise_repository.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/http_api_client_provider.dart';
import 'package:treinadorpro/core/viewmodel/exercise_view_model.dart';

// remote datasource provider
final exerciseRemoteDatasourceProvider = Provider<IExerciseRemoteDatasource>((ref) {
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('exerciseRemoteDatasourceProvider has been created');

  return ExerciseRemoteDatasource(apiClient, appConfig);
});

// repository provider
final exerciseRepositoryProvider = Provider<IExerciseRepository>((ref){
  final remoteDatasource = ref.read(exerciseRemoteDatasourceProvider);
  print('exerciseRepositoryProvider has been created');

  return ExerciseRepository(remoteDatasource);
});

// view model provider
final exerciseViewModelProvider = StateNotifierProvider<ExerciseViewModel, AsyncValue<List<ExerciseModel>>>((ref){
  final repository = ref.read(exerciseRepositoryProvider);
  print('exerciseViewModelProvider has been created');

  return ExerciseViewModel(repository);
});