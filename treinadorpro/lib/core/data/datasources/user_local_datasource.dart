import 'package:isar/isar.dart';
import 'package:treinadorpro/core/data/datasources/iuser_local_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';

class UserLocalDatasource implements IUserLocalDataSource {

  final Map<Id, UserModel> _cache = {};

  @override
  Future<UserModel?> fetchById(Id id) async {
    return _cache[id];
  }

  @override
  Future<void> cache(UserModel user) async {
    _cache[user.id] = user;
  }


}