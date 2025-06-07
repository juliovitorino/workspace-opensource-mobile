import 'package:treinadorpro/core/data/datasources/iuser_local_datasource.dart';
import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';

class UserRepository implements IUserRepository {

  final IUserRemoteDataSource _userRemoteDatasource;
  final IUserLocalDataSource _userLocalDatasource;
  
  UserRepository(this._userRemoteDatasource, this._userLocalDatasource);

  @override
  Future<UserModel> findById(int id) async {
    try {
      final user = await _userRemoteDatasource.fetchById(id);
      await _userLocalDatasource.cache(user);
      return user;
    } catch (_) {
      final cached = await _userLocalDatasource.fetchById(id);
      if (cached != null) return cached;
      rethrow;
    }
  }
}