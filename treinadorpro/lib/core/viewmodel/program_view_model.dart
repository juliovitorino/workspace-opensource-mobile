import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/domain/repositories/iprogram_repository.dart';

class ProgramViewModel extends StateNotifier<AsyncValue<List<ProgramModel>>>{

  final IProgramRepository _programRepository;
  ProgramViewModel(this._programRepository) : super(const AsyncValue.loading());

  Future<void> findAllActivePrograms() async {
    try {
      print('goal_view_model :: ok');
      state = const AsyncValue.loading();
      final modalitiesList = await _programRepository.findAllActivePrograms();
      state = AsyncValue.data(modalitiesList);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }


}