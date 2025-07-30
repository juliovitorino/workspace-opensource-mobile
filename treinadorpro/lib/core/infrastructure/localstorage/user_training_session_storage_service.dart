import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/key_storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/token_storage_service.dart';

class UserTrainingSessionStorageService implements KeyStorageService<UserTrainingSessionModel>{

  static const String KEY = 'user_training_session_storage_service';

  @override
  Future<void> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${KEY}_$key");
  }

  @override
  Future<UserTrainingSessionModel?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString("${KEY}_$key");
    if (dataJson != null) {
      final dynamic instance = jsonDecode(dataJson);
      return UserTrainingSessionModel.fromJson(instance);
    }
    return null;
  }

  @override
  Future<void> save(UserTrainingSessionModel data, String key) async {
    final prefs = await SharedPreferences.getInstance();
    print('save storage UserTrainingSessionModel => ${jsonEncode(data)}');
    final dataJson = jsonEncode(data);
    await prefs.setString("${KEY}_$key", dataJson);
  }

}