import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/itraining_session_datasource.dart';
import 'package:treinadorpro/core/data/datasources/training_session_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/domain/repositories/training_session_repository.dart';

import '../viewmodel/booking_training_session_view_model.dart';
import '../viewmodel/find_most_recent_training_session_view_model.dart';
import '../viewmodel/save_training_session_view_model.dart';
import 'app_config_provider.dart';
import 'http_api_client_provider.dart';

//-----------------------------
//remote datasource provider
//------------------------------
final trainingSessionRemoteDatasourceProvider = Provider<ITrainingSessionDatasource>((ref) {
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('trainingSessionRemoteDatasourceProvider has been created');

  return TrainingSessionDatasource(apiClient, appConfig);
});

//---------------------
// repository provider
//----------------------
final trainingSessionRepositoryProvider = Provider<ITrainingSessionRepository>((ref) {
  final datasource = ref.read(trainingSessionRemoteDatasourceProvider);
  return TrainingSessionRepository(datasource);
});

//-------------------------
// View Model Provider
//-------------------------
final saveTrainingSessionViewModelProvider =
    StateNotifierProvider<SaveTrainingSessionViewModel, AsyncValue<ApiGenericResponse<bool>>>((
      ref,
    ) {
      final repository = ref.read(trainingSessionRepositoryProvider);
      return SaveTrainingSessionViewModel(repository);
    });

final findMostRecentTrainingSessionViewModelProvider =
    StateNotifierProvider<
      FindMostRecentTrainingSessionViewModel,
      AsyncValue<ApiGenericResponse<UserTrainingSessionModel>>
    >((ref) {
      print('findMostRecentTrainingSessionViewModelProvider criado');
      final repository = ref.read(trainingSessionRepositoryProvider);
      return FindMostRecentTrainingSessionViewModel(repository);
    });

final bookingTrainingSessionViewModelProvider =
    StateNotifierProvider<BookingTrainingSessionViewModel, AsyncValue<ApiGenericResponse<bool>>>((
      ref,
    ) {
      final repository = ref.read(trainingSessionRepositoryProvider);
      return BookingTrainingSessionViewModel(repository);
    });
