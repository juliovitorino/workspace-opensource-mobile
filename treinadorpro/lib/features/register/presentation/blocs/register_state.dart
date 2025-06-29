import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/requests/register_request.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/states/handler_state.dart';

class RegisterCubit extends Cubit<HandlerState> {
  final IUserRepository _repository;
  RegisterCubit(this._repository) : super(HandlerState());

  Future<void> register(
    String name,
    String email,
    String phone,
    String birthday,
    String passwd,
    String passwdCheck,
    String plan
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final registerRequest = RegisterRequest(
      name,
      email,
      phone,
      birthday,
      passwd,
      passwdCheck,
      plan,
    );

    // print(jsonEncode(request.toJson()));
    print(JsonEncoder.withIndent('   ').convert(registerRequest.toJson()));

    final response = await _repository.register(registerRequest);
    emit(state.copyWith(isLoading: false, objectResponse: response));

  }
}
