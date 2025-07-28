import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/key_storage_service.dart';

class UserTrainingStorageService implements KeyStorageService<List<UserWorkoutPlanModel>> {

  static const String KEY = 'user_training_storage_service';

  @override
  Future<void> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${KEY}_$key");
  }

  @override
  Future<List<UserWorkoutPlanModel>?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString("${KEY}_$key");
    if (dataJson != null) {
      final List<dynamic> list = jsonDecode(dataJson);
      return list.map((e) => UserWorkoutPlanModel.fromJson(e)).toList();
    }
    return null;
  }

  @override
  Future<void> save(List<UserWorkoutPlanModel> data, String key) async {
    final prefs = await SharedPreferences.getInstance();
    print('save storage List<UserWorkoutPlanModel> => ${jsonEncode(data.map((e) => e.toJson()).toList())}');
    final dataJson = jsonEncode(data.map((e) => e.toJson()).toList());
    await prefs.setString("${KEY}_$key", dataJson);
  }

}