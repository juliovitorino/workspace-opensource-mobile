import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

class NewStudentCubit extends Cubit<HandlerState>{
  final IContractRespository _repository;
  NewStudentCubit(this._repository) : super(HandlerState());

  Future<void> saveContract(CreateNewStudentContractRequest request, String apiKey) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // print(jsonEncode(request.toJson()));
    print(JsonEncoder.withIndent('   ').convert(request.toJson()));

    final externalId = await _repository.save(request);
    emit(state.copyWith(isLoading: false, objectResponse: externalId));

  }
}
