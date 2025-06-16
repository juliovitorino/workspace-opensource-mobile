import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:treinadorpro/core/network/api_client.dart';


class HttpApiClient implements ApiClient {
  final http.Client client;

  HttpApiClient(this.client);

  @override
  Future<Map<String,dynamic>> get(String url, {Map<String, String>? headers}) async {
    final response = await client.get(Uri.parse(url), headers: headers);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Erro ao fazer GET: ${response.statusCode}');
  }

  @override
  Future<Map<String,dynamic>> post(String url, {Map<String, String>? headers, Object? body}) async {
    final mergedHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };

    final response = await client.post(Uri.parse(url), headers: mergedHeaders, body: body);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Erro ao fazer POST: ${response.statusCode}');
  }

  @override
  Future<Map<String,dynamic>> put(String url, {Map<String, String>? headers, Object? body}) async {
    final mergedHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };

    final response = await client.put(Uri.parse(url), headers: mergedHeaders, body: body);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Erro ao fazer PUT: ${response.statusCode}');
  }

  @override
  Future<Map<String,dynamic>> patch(String url, {Map<String, String>? headers, Object? body}) async {
    final mergedHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };

    final response = await client.patch(Uri.parse(url), headers: mergedHeaders, body: body);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Erro ao fazer PATCH: ${response.statusCode}');
  }

  @override
  Future<Map<String,dynamic>> delete(String url, {Map<String, String>? headers}) async {
    final response = await client.delete(Uri.parse(url), headers: headers);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Erro ao fazer DELETE: ${response.statusCode}');
  }
}
