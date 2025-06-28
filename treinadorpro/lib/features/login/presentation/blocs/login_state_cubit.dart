import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/requests/login_request.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

class LoginStateCubit extends Cubit<HandlerState> {

  final IUserRepository _repository;

  LoginStateCubit(this._repository) : super(HandlerState());

  Future<void> processLogin(String email, String password, String apiKey) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final String token = await _repository.login(apiKey, LoginRequest(email, password));
    emit(state.copyWith(isLoading: false, objectResponse: token)); // Sucesso
      // emit(state.copyWith(isLoading: false, errorMessage: 'Email inválido'));
  }

}