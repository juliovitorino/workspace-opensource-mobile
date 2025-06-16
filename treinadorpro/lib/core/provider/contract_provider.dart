

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/contract_datasource.dart';
import 'package:treinadorpro/core/data/datasources/icontract_datasource.dart';
import 'package:treinadorpro/core/domain/repositories/contract_repository.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';
import 'package:treinadorpro/core/viewmodel/new_student_view_model.dart';

import 'app_config_provider.dart';
import 'http_api_client_provider.dart';

// remote datasource provider
final contractRemoteDatasourceProvider = Provider<IContractDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('exerciseRemoteDatasourceProvider has been created');

  return ContractDatasource(apiClient, appConfig);
});

// repository provider
final contractRepositoryProvider = Provider<IContractRespository>((ref){
  final datasource = ref.read(contractRemoteDatasourceProvider);
  return ContractRepository(datasource);
});

// view model provider
final newStudentViewModel = StateNotifierProvider<NewStudentViewModel, AsyncValue<String>>((ref){
  final repository = ref.read(contractRepositoryProvider);
  return NewStudentViewModel(repository);
});