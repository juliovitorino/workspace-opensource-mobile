import 'dart:convert';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/domain/repositories/icontract_repository.dart';
import '../../../../core/network/api_exception.dart';

class TrainingPageCubit extends Cubit<HandlerState>{

  final IContractRespository _repository;
  TrainingPageCubit(this._repository) : super(HandlerState());

  Future<void> saveTraining(List<UserWorkoutPlanModel> request)  async {
    emit(state.sendToListener(isLoading: true, errorMessage: null));

    // print(jsonEncode(request.toJson()));
    print(JsonEncoder.withIndent('   ').convert( request.map((e) => e.toJson()).toList()));

    try {
      // final externalId = await _repository.saveUserDataSheetPlan(request);
      emit(state.sendToListener(isLoading: false, objectResponse: "ainda vou definir"));
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