import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

class NewStudentCubit extends Cubit<HandlerState>{
  NewStudentCubit() : super(HandlerState());

  Future<void> saveContract(CreateNewStudentContractRequest request, String apiKey) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // print(jsonEncode(request.toJson()));
    print(JsonEncoder.withIndent('   ').convert(request.toJson()));

    // se tiver mais alguma regra de negócio de camada de visão pode colocar aqui
    await Future.delayed(const Duration(seconds: 3)); // Simula API - chamada do meu backend
    //
    // if (email.contains('@')) {
    //   emit(state.copyWith(isLoading: false)); // Sucesso
    // } else {
    //   emit(state.copyWith(isLoading: false, errorMessage: 'Email inválido'));
    // }


  }
}
