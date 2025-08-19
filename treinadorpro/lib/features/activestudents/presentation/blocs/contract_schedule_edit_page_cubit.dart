import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/data/requests/contract_schedule_modifier_request_model.dart';
import '../../../../core/network/api_exception.dart';

class ContractScheduleEditPageCubit extends Cubit<HandlerState>{
  final IContractRespository _repository;
  ContractScheduleEditPageCubit(this._repository) : super(HandlerState());

  Future<void> changeSchedule(String contractExternalId, ContractScheduleModifierRequestModel request) async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    print(JsonEncoder.withIndent('   ').convert(request.toJson()));

    try {
      final response = await _repository.changeSchedule(contractExternalId, request);
      emit(state.sendToListener(isLoading: false, objectResponse: response));
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