import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource _userRemoteDatasource;

  UserRepository(this._userRemoteDatasource);

  @override
  Future<UserModel> findById(int id) async {
    final user = await _userRemoteDatasource.fetchById(id);
    return user;
  }

  @override
  Future<UserModel> findByUUID(String uuid) async {
    print('user_repository :: uuid = $uuid');

    final user = await _userRemoteDatasource.fetchByUUID(uuid);
    return user;
  }
}
