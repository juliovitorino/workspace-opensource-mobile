import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:treinadorpro/core/network/api_client.dart';

import 'api_exception.dart';


class HttpApiClient implements ApiClient {
  final http.Client client;

  HttpApiClient(this.client);

  @override
  Future<Map<String,dynamic>> get(String url, {Map<String, String>? headers}) async {
    final response = await client.get(Uri.parse(url), headers: headers);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    if (response.statusCode >= 400 && response.statusCode < 500) {
      final responseBody = jsonDecode(response.body);
      throw ApiException(response.statusCode, responseBody);
    }

    throw Exception('Error on GET: ${response.statusCode}');
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

    if (response.statusCode >= 400 && response.statusCode < 500) {
      final responseBody = jsonDecode(response.body);
      throw ApiException(response.statusCode, responseBody);
    }

    throw Exception('Error on POST: ${response.statusCode}');
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

    if (response.statusCode >= 400 && response.statusCode < 500) {
      final responseBody = jsonDecode(response.body);
      throw ApiException(response.statusCode, responseBody);
    }

    throw Exception('Error on PUT: ${response.statusCode}');
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

    if (response.statusCode >= 400 && response.statusCode < 500) {
      final responseBody = jsonDecode(response.body);
      throw ApiException(response.statusCode, responseBody);
    }

    throw Exception('Error on PATCH: ${response.statusCode}');
  }

  @override
  Future<Map<String,dynamic>> delete(String url, {Map<String, String>? headers}) async {
    final response = await client.delete(Uri.parse(url), headers: headers);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    if (response.statusCode >= 400 && response.statusCode < 500) {
      final responseBody = jsonDecode(response.body);
      throw ApiException(response.statusCode, responseBody);
    }

    throw Exception('Error on DELETE: ${response.statusCode}');
  }
}
