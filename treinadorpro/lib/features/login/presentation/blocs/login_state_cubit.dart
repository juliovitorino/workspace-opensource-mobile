import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/requests/login_request.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/network/api_exception.dart';

class LoginStateCubit extends Cubit<HandlerState> {

  final IUserRepository _repository;

  LoginStateCubit(this._repository) : super(HandlerState());

  Future<void> processLogin(String email, String password) async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    try{
      final String token = await _repository.login(LoginRequest(email, password));
      emit(state.sendToListener(isLoading: false, objectResponse: token)); // Sucesso
    } catch (e) {
      if (e is ApiException) {
        try {
          final exception = ExceptionApiModel.fromJson({
            'statusCode': e.statusCode,
            'message': e.body['message'] ?? 'Unknown error',
            'msgcode': e.body['msgcode'] ?? '',
          });

          emit(state.sendToListener(
              isLoading: false,
              errorMessage: exception.message,
              objectResponse: exception
          ));
        } catch (_) {
          emit(state.sendToListener(
            isLoading: false,
            errorMessage: 'Error processing API response',
          ));
        }
      } else {
        emit(state.sendToListener(
          isLoading: false,
          errorMessage: 'Unexpected error: ${e.toString()}',
        ));
      }
    }
  }

  Future<void> processLoginGoogle(String idToken) async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    try{
      final String token = await _repository.loginGoogle(idToken);
      emit(state.sendToListener(isLoading: false, objectResponse: token)); // Sucesso
    } catch (e) {
      if (e is ApiException) {
        try {
          final exception = ExceptionApiModel.fromJson({
            'statusCode': e.statusCode,
            'message': e.body['message'] ?? 'Unknown error',
            'msgcode': e.body['msgcode'] ?? '',
          });

          emit(state.sendToListener(
              isLoading: false,
              errorMessage: exception.message,
              objectResponse: exception
          ));
        } catch (_) {
          emit(state.sendToListener(
            isLoading: false,
            errorMessage: 'Error processing API response',
          ));
        }
      } else {
        emit(state.sendToListener(
          isLoading: false,
          errorMessage: 'Unexpected error: ${e.toString()}',
        ));
      }
    }
  }

}