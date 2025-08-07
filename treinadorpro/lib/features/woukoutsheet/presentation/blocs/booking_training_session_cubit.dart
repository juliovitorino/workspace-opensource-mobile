import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/models/booking_model_request.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/network/api_exception.dart';

class BookingTrainingSessionCubit extends Cubit<HandlerState>{
  final ITrainingSessionRepository _repository;
  BookingTrainingSessionCubit(this._repository) : super(HandlerState());

  Future<void> bookingTrainingSession(BookingModelRequest request) async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    // print(jsonEncode(request.toJson()));
    print(JsonEncoder.withIndent('   ').convert(request.toJson()));

    try {
      request.trainingSession.startedAt = DateTime.now();
      request.trainingSession.finishedAt = request.trainingSession.startedAt;
      final externalId = await _repository.bookingTrainingSession(request);
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