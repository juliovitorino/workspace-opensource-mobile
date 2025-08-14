import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/data/models/student_payment_response_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/storage_service.dart';

class BillStorageService implements StorageService<StudentPaymentResponseModel>{

  static const String KEY = 'bill';

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(KEY);
  }

  @override
  Future<StudentPaymentResponseModel?> get() async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString(KEY);
    if (dataJson != null) {
      final Map<String, dynamic> map = jsonDecode(dataJson);
      return StudentPaymentResponseModel.fromJson(map);
    }
    return null;
  }

  @override
  Future<void> save(StudentPaymentResponseModel data) async {
    final prefs = await SharedPreferences.getInstance();
    print('LastTrainingSessionStorageService => ${jsonEncode(data.toJson())}');
    final dataJson = jsonEncode(data.toJson());
    await prefs.setString(KEY, dataJson);
  }

}