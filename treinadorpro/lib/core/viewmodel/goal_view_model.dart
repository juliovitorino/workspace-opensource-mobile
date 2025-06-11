import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/domain/repositories/igoal_repository.dart';

class GoalViewModel extends StateNotifier<AsyncValue<List<GoalModel>>>{

  final IGoalRepository _goalRepository;

  GoalViewModel(this._goalRepository) : super(const AsyncValue.loading());


  Future<void> findAllActiveGoals() async {
    try {
      print('goal_view_model :: ok');
      state = const AsyncValue.loading();
      final modalitiesList = await _goalRepository.findAllActiveGoals();
      state = AsyncValue.data(modalitiesList);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }


}