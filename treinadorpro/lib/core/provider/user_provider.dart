import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/user_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:treinadorpro/core/domain/repositories/userRepository.dart';
import 'package:treinadorpro/core/network/http_api_client.dart';
import 'package:treinadorpro/core/viewmodel/user_view_model.dart';

// Injection http.Client
final httpClientProvider = Provider((ref) => http.Client());

// Network injection layer
final apiClientProvider = Provider((ref) {
  final apiClient = ref.read(httpClientProvider);
  return HttpApiClient(apiClient);
});

// Injection for remote datasource

final userRemoteDatasourceProvider = Provider<IUserRemoteDataSource>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return UserRemoteDatasource(apiClient);
});

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  final remote = ref.read(userRemoteDatasourceProvider);
  return UserRepository(remote);
});

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<UserModel>>((ref) {
      final repo = ref.read(userRepositoryProvider);
      return UserViewModel(repo);
    });
