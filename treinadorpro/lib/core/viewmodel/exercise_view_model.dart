import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/domain/repositories/iexercise_repository.dart';

class ExerciseViewModel extends StateNotifier<AsyncValue<List<ExerciseModel>>>{

  final IExerciseRepository _repository;
  ExerciseViewModel(this._repository) : super(const AsyncValue.loading());

  Future<void> findAllActiveExercises() async {
    try {
      print('exercise_view_model :: ok');
      state = const AsyncValue.loading();
      final modalitiesList = await _repository.findAllActiveExercises();
      state = AsyncValue.data(modalitiesList);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}