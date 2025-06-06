import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';

import '../data/models/user_model.dart';

class UserViewModel extends StateNotifier<AsyncValue<UserModel>> {

  final IUserRepository _repository;

  UserViewModel(this._repository) : super(const AsyncValue.loading());

  Future<void> loadUser(int id) async {
    try {
      state = const AsyncValue.loading();
      final user = await _repository.findById(id);
      state = AsyncValue.data(user);
    } catch(e, st) {
      state = AsyncValue.error(e, st);
    }

  }



}