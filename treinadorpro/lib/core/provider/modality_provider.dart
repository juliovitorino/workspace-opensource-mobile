
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/imodality_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/modality_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/modality_model.dart';
import 'package:treinadorpro/core/domain/repositories/imodality_repository.dart';
import 'package:treinadorpro/core/domain/repositories/modality_repository.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/http_api_client_provider.dart';
import 'package:treinadorpro/core/viewmodel/modality_view_model.dart';

// remote datasource provider
final modalityDatasourceProvider = Provider<IModalityRemoteDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('modalityDatasourceProvider has been created');

  return ModalityRemoteDatasource(apiClient, appConfig);

});

// repository provider
final modalityRepositoryProvider = Provider<IModalityRepository>((ref){
  final remoteDatasource = ref.read(modalityDatasourceProvider);
  print('modalityRepositoryProvider has been created');

  return ModalityRepository(remoteDatasource);
});

final modalityViewModelProvider = StateNotifierProvider<ModalityViewModel, AsyncValue<List<ModalityModel>>>((ref){
  final repository = ref.read(modalityRepositoryProvider);
  print('ModalityViewModelProvider has been created');

  return ModalityViewModel(repository);

});