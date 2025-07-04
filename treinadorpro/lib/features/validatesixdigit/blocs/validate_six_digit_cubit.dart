import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

class ValidateSixDigitCubit extends Cubit<HandlerState> {
  final IUserRepository _repository;

  ValidateSixDigitCubit(this._repository) : super(HandlerState());

  Future<void> validate(String code, String trainerExternalId) async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    final bool response = await _repository.validateCode(trainerExternalId, code);

    if (response) {
      emit(state.sendToListener(isLoading: false)); // Sucesso
    } else {
      emit(state.sendToListener(isLoading: false, errorMessage: 'Houve alguma falha'));
    }
  }
}