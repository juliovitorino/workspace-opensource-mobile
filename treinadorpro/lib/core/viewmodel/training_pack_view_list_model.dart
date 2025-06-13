import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/students_from_trainer_response_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';

class TrainingPackViewListModel extends StateNotifier<AsyncValue<List<StudentsFromTrainerResponseModel>>>{

  final ITrainingPackRespository _trainingPackRespository;
  TrainingPackViewListModel(this._trainingPackRespository) : super(const AsyncValue.loading());

  static const String module = 'training_pack_view_list_model';

  Future<void> findAllStudentsFromTrainer(String externalId) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final studentsList = await _trainingPackRespository.findAllStudentsFromTrainer(externalId);
      state = AsyncValue.data(studentsList);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}