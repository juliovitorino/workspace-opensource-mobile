import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:treinadorpro/core/network/api_client.dart';
import 'package:treinadorpro/core/network/http_api_client.dart';

// Injection http.Client
final httpClientProvider = Provider((ref) => http.Client());

// Dependency Injection
// When user ask for apiClientProvider will be provide an
// interface ApiClient with HttpApiClient implementation

final apiClientProvider = Provider<ApiClient>((ref) {

  print('http_api_client_provider :: reading http.Client provider');
  final apiClient = ref.read(httpClientProvider);
  print('http_api_client_provider :: http.Client provider was loaded');

  print('apiClientProvider has been created');
  return HttpApiClient(apiClient);
});
