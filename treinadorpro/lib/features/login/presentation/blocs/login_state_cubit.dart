import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/requests/login_request.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

class LoginStateCubit extends Cubit<HandlerState> {

  final IUserRepository _repository;

  LoginStateCubit(this._repository) : super(HandlerState());

  Future<void> processLogin(String email, String password) async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    try{
      final String token = await _repository.login(LoginRequest(email, password));
      emit(state.sendToListener(isLoading: false, objectResponse: token)); // Sucesso
    } catch (e) {
      emit(state.sendToListener(isLoading: false, errorMessage: e.toString()));
    }

  }

}