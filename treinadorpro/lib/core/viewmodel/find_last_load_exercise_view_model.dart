import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/find_last_load_exercise_response_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_session_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../data/models/find_last_load_exercise_request_model.dart';

class FindLastLoadExerciseViewModel
    extends IViewModel<ApiGenericResponse<FindLastLoadExerciseResponseModel>> {
  final ITrainingSessionRepository _repository;

  FindLastLoadExerciseViewModel(this._repository) : super(_repository);

  static const String module = 'add_training_pack_view_model';

  Future<void> findLastLoadExercise(FindLastLoadExerciseRequestModel request) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findLastLoadExercise(request);
      state = AsyncValue.data(apiResponse);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
