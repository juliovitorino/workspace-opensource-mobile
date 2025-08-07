import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../data/models/booking_model_request.dart';

class BookingTrainingSessionViewModel extends IViewModel<ApiGenericResponse<bool>>{

  final ITrainingSessionRepository _repository;
  BookingTrainingSessionViewModel(this._repository):super(_repository);


  static const String module = 'booking_training_session_view_model';

  Future<void> bookingTrainingSession(BookingModelRequest request) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.bookingTrainingSession(request);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}