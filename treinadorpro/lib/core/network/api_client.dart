import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<Map<String,dynamic>> get(String url, {Map<String, String>? headers});
  Future<Map<String,dynamic>> post(String url, {Map<String, String>? headers, Object? body});
  Future<Map<String,dynamic>> put(String url, {Map<String, String>? headers, Object? body});
  Future<Map<String,dynamic>> patch(String url, {Map<String, String>? headers, Object? body});
  Future<Map<String,dynamic>> delete(String url, {Map<String, String>? headers});
}
