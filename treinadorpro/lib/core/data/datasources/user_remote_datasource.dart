import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/network/api_client.dart';

class UserRemoteDatasource implements IUserRemoteDataSource {

  final ApiClient apiClient;

  UserRemoteDatasource(this.apiClient);

  @override
  Future<UserModel> fetchById(int id) async {
    final json = await apiClient.get('https://jsonplaceholder.typicode.com/users/$id');
    return UserModel.fromJson(json);
  }

}