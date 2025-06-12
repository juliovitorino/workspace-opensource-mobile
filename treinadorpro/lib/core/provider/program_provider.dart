import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/iprogram_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/program_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/domain/repositories/iprogram_repository.dart';
import 'package:treinadorpro/core/domain/repositories/program_repository.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/http_api_client_provider.dart';
import 'package:treinadorpro/core/viewmodel/program_view_model.dart';

// remote datasource provider
final programRemoteDatasourceProvider = Provider<IProgramRemoteDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('programRemoteDatasourceProvider has been created');

  return ProgramRemoteDatasource(apiClient, appConfig);
});

// repository provider
final programRepositoryProvider = Provider<IProgramRepository>((ref){
  final IProgramRemoteDatasource remoteDatasource = ref.read(programRemoteDatasourceProvider);
  print('programRepositoryProvider has been created');

  return ProgramRepository(remoteDatasource);
});

// view model provider
final programViewModelProvider = StateNotifierProvider<ProgramViewModel, AsyncValue<List<ProgramModel>>>((ref){
  final IProgramRepository _programRepository = ref.read(programRepositoryProvider);
  print('programViewModelProvider has been created');

  return ProgramViewModel(_programRepository);
});