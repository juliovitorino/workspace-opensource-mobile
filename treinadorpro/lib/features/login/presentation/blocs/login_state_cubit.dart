import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

class LoginStateCubit extends Cubit<HandlerState> {
  LoginStateCubit() : super(HandlerState());

  Future<void> processLogin(String email, String password, String apiKey) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // se tiver mais alguma regra de negócio de camada de visão pode colocar aqui
    await Future.delayed(const Duration(seconds: 3)); // Simula API - chamada do meu backend

    if (email.contains('@')) {
      emit(state.copyWith(isLoading: false)); // Sucesso
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'Email inválido'));
    }
  }

}