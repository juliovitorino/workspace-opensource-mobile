import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class UserRemoteDatasource implements IUserRemoteDataSource {

  final ApiClient apiClient;

  UserRemoteDatasource(this.apiClient);

  @override
  Future<UserModel> fetchById(int id) async {
    final response = await apiClient.get('https://jsonplaceholder.typicode.com/users/$id');
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> fetchByUUID(String uuid) async {
    print('user_remote_datasource :: uuid = $uuid');

    final response = await apiClient.get('http://localhost:8080/v1/api/business/user/trainer/$uuid');
    print("user_remote_datasource :: response = $response");
    final userJson = response['objectResponse'];
    return UserModel.fromJson(userJson);
  }

}