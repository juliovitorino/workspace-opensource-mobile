import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/find_all_training_session_calendar_request_model.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../domain/repositories/itraining_session_repository.dart';

class FindAllTrainingSessionCalendarViewModel extends IViewModel<ApiGenericResponse<List<UserTrainingSessionModel>>>{

  final ITrainingSessionRepository _repository;
  FindAllTrainingSessionCalendarViewModel(this._repository):super(_repository);


  static const String module = 'booking_training_session_view_model';

  Future<void> findAllTrainingSessionCalendar(FindAllTrainingSessionCalendarRequestModel request) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findTrainingSessionCalendar(request);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }
}