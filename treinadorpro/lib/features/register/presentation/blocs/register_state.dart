import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterState {
  final bool isLoading;
  final String? errorMessage;

  RegisterState({this.isLoading = false, this.errorMessage});

  RegisterState copyWith({bool? isLoading, String? errorMessage}) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  Future<void> register(String name, String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // se tiver mais alguma regra de negócio de camada de visão pode colocar aqui
    await Future.delayed(const Duration(seconds: 3)); // Simula API - chamada do meu backend

    if (email.contains('@')) {
      emit(state.copyWith(isLoading: false)); // Sucesso
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: 'Email inválido j'));
    }
  }
}
