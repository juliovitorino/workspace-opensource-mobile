import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/domain/repositories/igoal_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class GoalViewModel extends IViewModel<List<GoalModel>>{

  final IGoalRepository _goalRepository;
  GoalViewModel(this._goalRepository) : super(_goalRepository);

  static const String module = 'goal_view_list_model';

  Future<void> findAllActiveGoals() async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final modalitiesList = await _goalRepository.findAllActiveGoals();
      state = AsyncValue.data(modalitiesList);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }


}