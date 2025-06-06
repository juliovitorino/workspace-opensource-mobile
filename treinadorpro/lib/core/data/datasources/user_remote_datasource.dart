import 'dart:convert';

import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/domain/entities/user.dart';
import 'package:treinadorpro/core/domain/repositories/userRepository.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class UserRemoteDatasource implements UserRepository {

  final ApiClient apiClient;

  UserRemoteDatasource(this.apiClient);

  @override
  Future<User> findById(int id) async {
    String url = 'http://julio.vitorino/api/user/${id}';
    final response = await apiClient.get(url);

    if(response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro ao buscar usuário');
    }
  }

}