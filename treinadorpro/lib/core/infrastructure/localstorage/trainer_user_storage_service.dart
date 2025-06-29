import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/storage_service.dart';

class TrainerUserStorageService implements StorageService<UserModel>{

  static const String USER_KEY = 'user_data';

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future<UserModel?> get() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(USER_KEY);
    if (userJson != null) {
      final Map<String, dynamic> map = jsonDecode(userJson);
      return UserModel.fromJson(map);
    }
    return null;
  }

  @override
  Future<void> save(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(USER_KEY, userJson);
  }


}