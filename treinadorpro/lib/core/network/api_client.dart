import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<http.Response> get(String url, {Map<String, String>? headers});
  Future<http.Response> post(String url, {Map<String, String>? headers, Object? body});
  Future<http.Response> put(String url, {Map<String, String>? headers, Object? body});
  Future<http.Response> patch(String url, {Map<String, String>? headers, Object? body});
  Future<http.Response> delete(String url, {Map<String, String>? headers});
}
