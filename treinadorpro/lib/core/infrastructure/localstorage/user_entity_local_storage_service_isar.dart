import 'package:isar/isar.dart';
import 'package:treinadorpro/core/domain/entities/user.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_entity_local_storage_service.dart';

import '../../../main.dart';

class UserEntityLocalStorageServiceIsar implements IUserEntityLocalStorageService {
  @override
  Future<void> delete(int id) async {
    await isar.writeTxn(() async {
      await isar.users.delete(id);
    });
  }

  @override
  Future<List<User>> getAll() async {
    return await isar.users.where().findAll();
  }

  @override
  Future<User?> getById(int id) async {
    User? userEntity = await isar.users.get(id);
    return userEntity;
  }

  @override
  Future<void> save(User user) async{
    await isar.writeTxn(() async {
      await isar.users.put(user);
    });

  }

}