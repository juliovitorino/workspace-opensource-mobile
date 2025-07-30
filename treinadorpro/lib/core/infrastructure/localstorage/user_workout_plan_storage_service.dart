import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/key_storage_service.dart';

class UserWorkoutPlanStorageService implements KeyStorageService<UserWorkoutPlanModel>{

  static const String KEY = 'user_workout_plan_storage_service';

  @override
  Future<void> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${KEY}_$key");
  }

  @override
  Future<UserWorkoutPlanModel?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString("${KEY}_$key");
    if (dataJson != null) {
      final dynamic instance = jsonDecode(dataJson);
      return UserWorkoutPlanModel.fromJson(instance);
    }
    return null;
  }

  @override
  Future<void> save(UserWorkoutPlanModel data, String key) async {
    final prefs = await SharedPreferences.getInstance();
    print('save storage UserWorkoutPlanModel => ${jsonEncode(data)}');
    final dataJson = jsonEncode(data);
    await prefs.setString("${KEY}_$key", dataJson);
  }


}