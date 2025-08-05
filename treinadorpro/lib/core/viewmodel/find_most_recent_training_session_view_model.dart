import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class FindMostRecentTrainingSessionViewModel extends IViewModel<ApiGenericResponse<UserTrainingSessionModel>> {

  final ITrainingSessionRepository _repository;
  FindMostRecentTrainingSessionViewModel(this._repository):super(_repository);


  static const String module = 'find_most_recent_training_session_view_model';

  Future<void> findMostRecentTrainingSession(String contractExternalId)  async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findMostRecentTrainingSession(contractExternalId);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}