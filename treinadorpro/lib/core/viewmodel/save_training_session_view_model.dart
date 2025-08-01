import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../data/models/user_training_session_model.dart';

class SaveTrainingSessionViewModel extends IViewModel<ApiGenericResponse<bool>> {

  final ITrainingSessionRepository _repository;
  SaveTrainingSessionViewModel(this._repository):super(_repository);


  static const String module = 'save_training_session_view_model';

  Future<void> save(UserTrainingSessionModel request) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.save(request);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }
}