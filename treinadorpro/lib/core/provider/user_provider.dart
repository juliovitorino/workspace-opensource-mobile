import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/user_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:treinadorpro/core/domain/repositories/userRepository.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/viewmodel/user_view_model.dart';

import 'http_api_client_provider.dart';

final userRemoteDatasourceProvider = Provider<IUserRemoteDataSource>((ref) {
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('userRemoteDatasourceProvider has been created');

  return UserRemoteDatasource(apiClient, appConfig);
});

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  final remoteDatasource = ref.read(userRemoteDatasourceProvider);
  print('userRepositoryProvider has been created');

  return UserRepository(remoteDatasource);
});

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModel>>((ref) {
      final repository = ref.read(userRepositoryProvider);
      print('userViewModelProvider has been created');

      return UserViewModel(repository);
    });
