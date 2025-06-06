import 'package:http/http.dart' as http;
import 'package:treinadorpro/core/network/api_client.dart';


class HttpApiClient implements ApiClient {
  final http.Client client;

  HttpApiClient(this.client);

  @override
  Future<http.Response> get(String url, {Map<String, String>? headers}) {
    return client.get(Uri.parse(url), headers: headers);
  }

  @override
  Future<http.Response> post(String url, {Map<String, String>? headers, Object? body}) {
    return client.post(Uri.parse(url), headers: headers, body: body);
  }

  @override
  Future<http.Response> put(String url, {Map<String, String>? headers, Object? body}) {
    return client.put(Uri.parse(url), headers: headers, body: body);
  }

  @override
  Future<http.Response> patch(String url, {Map<String, String>? headers, Object? body}) {
    return client.patch(Uri.parse(url), headers: headers, body: body);
  }

  @override
  Future<http.Response> delete(String url, {Map<String, String>? headers}) {
    return client.delete(Uri.parse(url), headers: headers);
  }
}
