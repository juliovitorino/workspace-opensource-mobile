import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/requests/receive_student_payment_request_model.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/network/api_exception.dart';

class RegisterPaymentCubit extends Cubit<HandlerState>{

  final IContractRespository _repository;
  RegisterPaymentCubit(this._repository) : super(HandlerState());

  Future<void> registerPayment(String paymentExternalId, ReceiveStudentPaymentRequestModel request) async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    // print(jsonEncode(request.toJson()));
    print(JsonEncoder.withIndent('   ').convert(request.toJson()));

    try {
      final externalId = await _repository.receiveStudentPayment(paymentExternalId, request);
      emit(state.sendToListener(isLoading: false, objectResponse: externalId));
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