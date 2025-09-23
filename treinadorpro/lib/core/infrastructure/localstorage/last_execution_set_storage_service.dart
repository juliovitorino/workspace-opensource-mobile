import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/last_execution_set_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/key_storage_service.dart';

class LastExecutionSetStorageService implements KeyStorageService<LastExecutionSetModel>{

  static const String KEY = 'last_execution_set_storage_service';

  @override
  Future<void> clear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${KEY}_$key");
  }

  @override
  Future<LastExecutionSetModel?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString("${KEY}_$key");
    if (dataJson != null) {
      final dynamic instance = jsonDecode(dataJson);
      return LastExecutionSetModel.fromJson(instance);
    }
    return null;
  }

  @override
  Future<void> save(LastExecutionSetModel data, String key) async {
    final prefs = await SharedPreferences.getInstance();
    print('save storage UserWorkoutPlanModel => ${jsonEncode(data)}');
    final dataJson = jsonEncode(data);
    await prefs.setString("${KEY}_$key", dataJson);
  }


}
