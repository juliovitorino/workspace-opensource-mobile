import 'package:treinadorpro/core/states/handler_state.dart';

class NewStudentHandlerState extends HandlerState<String>{
  final String? externalId;
  NewStudentHandlerState(this.externalId):super(isLoading: false, objectResponse: externalId);
}