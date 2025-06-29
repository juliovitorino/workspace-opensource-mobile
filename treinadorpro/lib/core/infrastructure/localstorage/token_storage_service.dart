import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/storage_service.dart';

class TokenStorageService implements StorageService<String> {

  static const String TOKEN_KEY = 'auth_token';

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future<String?> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN_KEY);
  }

  @override
  Future<void> save(String token)  async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(TOKEN_KEY, token);
  }
}