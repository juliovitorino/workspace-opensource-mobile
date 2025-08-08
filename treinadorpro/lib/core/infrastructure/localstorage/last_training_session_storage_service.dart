import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';

import '../../data/models/user_data_sheet_plan_model.dart';
import 'key_storage_service.dart';

class LastTrainingSessionStorageService implements KeyStorageService<UserTrainingSessionModel>{

  static const String KEY = 'user_last_training_session';

  @override
  Future<void> clear(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${KEY}_$token");
  }

  @override
  Future<UserTrainingSessionModel?> get(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString("${KEY}_$token");
    if (dataJson != null) {
      final Map<String, dynamic> map = jsonDecode(dataJson);
      return UserTrainingSessionModel.fromJson(map);
    }
    return null;
  }

  @override
  Future<void> save(UserTrainingSessionModel data, String token) async {
    final prefs = await SharedPreferences.getInstance();
    print('LastTrainingSessionStorageService => ${jsonEncode(data.toJson())}');
    final dataJson = jsonEncode(data.toJson());
    await prefs.setString("${KEY}_$token", dataJson);
  }

}