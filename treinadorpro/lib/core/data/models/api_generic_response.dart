import 'package:treinadorpro/core/data/models/response.dart';

class ApiGenericResponse<T> {
  final Response response;
  final T objectResponse;

  const ApiGenericResponse(this.response, this.objectResponse);
}