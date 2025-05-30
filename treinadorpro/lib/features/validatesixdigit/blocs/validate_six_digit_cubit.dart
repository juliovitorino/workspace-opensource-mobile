import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

class ValidateSixDigitCubit extends Cubit<HandlerState> {
  ValidateSixDigitCubit() : super(HandlerState());

  Future<void> validate(String code, String apiKey) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // se tiver mais alguma regra de negócio de camada de visão pode colocar aqui
    await Future.delayed(const Duration(seconds: 3)); // Simula API - chamada do meu backend

    if (RegExp(r'^\d{6}$').hasMatch(code)) {
      emit(state.copyWith(isLoading: false)); // Sucesso
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'O código deve somente conter 6 números'));
    }
  }
}