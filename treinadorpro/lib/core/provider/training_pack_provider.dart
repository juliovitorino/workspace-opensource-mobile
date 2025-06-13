import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/itraining_pack_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/training_pack_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/training_pack_repository.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/http_api_client_provider.dart';
import 'package:treinadorpro/core/viewmodel/training_pack_page_result_view_model.dart';
import 'package:treinadorpro/core/viewmodel/training_pack_view_list_model.dart';

import '../data/models/page_result_response_model.dart';

final trainingPackRemoteDataSourceProvider =
    Provider<ITrainingPackRemoteDatasource>((ref) {
      final apiClient = ref.read(apiClientProvider);
      final appConfig = ref.watch(appConfigProvider);

      print('trainingPackRemoteDataSourceProvider has been created');
      return TrainingPackRemoteDatasource(apiClient, appConfig);
    });

final trainingPackRepositoryProvider = Provider<TrainingPackRepository>((ref) {
  final remoteDatasource = ref.read(trainingPackRemoteDataSourceProvider);
  print('trainingPackRepositoryProvider has been created');

  return TrainingPackRepository(remoteDatasource);
});

final trainingPackPageResultViewModelProvider =
    StateNotifierProvider<TrainingPackPageResultViewModel, AsyncValue<PageResultResponseModel<TrainingPackModel>>>(
      (ref) {
        final repository = ref.read(trainingPackRepositoryProvider);
        print('trainingPackPageResultViewModelProvider has been created');

        return TrainingPackPageResultViewModel(repository);
      },
    );

final trainingPackViewListModelProvider =
    StateNotifierProvider<TrainingPackViewListModel, AsyncValue<List<StudentsFromTrainerResponseModel>>>((ref){
      final repository = ref.read(trainingPackRepositoryProvider);
      print('trainingPackViewListModelProvider has been created');

      return TrainingPackViewListModel(repository);
    });