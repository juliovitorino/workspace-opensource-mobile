import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';
import 'package:treinadorpro/core/states/handler_state.dart';

import '../../../../core/data/models/exception_api_model.dart';
import '../../../../core/network/api_exception.dart';

class ChangeStatusTrainingPackageCubit extends Cubit<HandlerState>{

  final ITrainingPackRepository _repository;
  ChangeStatusTrainingPackageCubit(this._repository) : super(HandlerState());

  Future<void> changeStatus(String trainingPackageExternalId, String decisionMap) async {

    final Map<String,Function(String)> strategyMap = {
      'D': (externalId) => _repository.changeStatusTrash(externalId),
      'R': (externalId) => _repository.changeStatusRecover(externalId),
    };

    emit(state.sendToListener(isLoading: true, errorMessage: null));

    try {
      await strategyMap[decisionMap]?.call(trainingPackageExternalId);
      emit(state.sendToListener(isLoading: false));
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