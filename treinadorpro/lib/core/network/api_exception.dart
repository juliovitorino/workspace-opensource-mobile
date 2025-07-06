class ApiException implements Exception {
  final int statusCode;
  final Map<String, dynamic> body;

  ApiException(this.statusCode, this.body);

  @override
  String toString() => 'ApiException(statusCode: $statusCode, body: $body)';
}
