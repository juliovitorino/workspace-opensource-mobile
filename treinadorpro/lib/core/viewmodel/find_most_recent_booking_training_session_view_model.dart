import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class FindMostRecentBookingTrainingSessionViewModel extends IViewModel<ApiGenericResponse<UserTrainingSessionModel>> {

  final ITrainingSessionRepository _repository;
  FindMostRecentBookingTrainingSessionViewModel(this._repository):super(_repository);


  static const String module = 'find_most_recent_booking_training_session_view_model';

  Future<void> findMostRecentBookingTrainingSession(String contractExternalId)  async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findMostRecentBookingTrainingSession(contractExternalId);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}