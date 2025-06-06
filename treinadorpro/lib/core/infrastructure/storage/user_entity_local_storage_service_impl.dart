import 'package:isar/isar.dart';
import 'package:treinadorpro/core/domain/entities/user_entity.dart';
import 'package:treinadorpro/core/infrastructure/storage/user_entity_local_storage_service.dart';

import '../../../main.dart';

class UserEntityLocalStorageServiceImpl implements IUserEntityLocalStorageService {
  @override
  Future<void> delete(int id) async {
    await isar.writeTxn(() async {
      await isar.userEntitys.delete(id);
    });
  }

  @override
  Future<List<UserEntity>> getAll() async {
    return await isar.userEntitys.where().findAll();
  }

  @override
  Future<UserEntity?> getById(int id) async {
    return await isar.userEntitys.get(id);
  }

  @override
  Future<void> save(UserEntity user) async{
    await isar.writeTxn(() async {
      await isar.userEntitys.put(user);
    });

  }

}