import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/user_data_sheet_plan_model.dart';

class UserDataSheetPlanStorageService{

  static const String KEY = 'user_data_sheet_draft';

  Future<void> clear(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("${KEY}_$token");
  }

  Future<UserDataSheetPlanModel?> get(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString("${KEY}_$token");
    if (dataJson != null) {
      final Map<String, dynamic> map = jsonDecode(dataJson);
      return UserDataSheetPlanModel.fromJson(map);
    }
    return null;
  }

  Future<void> save(UserDataSheetPlanModel data, String token) async {
    final prefs = await SharedPreferences.getInstance();
    print('UserDataSheetPlanModel => ${jsonEncode(data.toJson())}');
    final dataJson = jsonEncode(data.toJson());
    await prefs.setString("${KEY}_$token", dataJson);
  }


}
