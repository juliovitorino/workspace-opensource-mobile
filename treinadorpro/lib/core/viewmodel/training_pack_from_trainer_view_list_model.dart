import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class TrainingPackFromTrainerViewListModel extends IViewModel<List<TrainingPackModel>>{

  final ITrainingPackRepository _repository;
  TrainingPackFromTrainerViewListModel(this._repository):super(_repository);


  Future<void> findAllActiveTrainingPackFromTrainer(String externalId) async {
    try {
      print('goal_view_model :: ok');
      state = const AsyncValue.loading();
      final list = await _repository.findAllTrainingPackByTrainerExternalId(externalId);
      state = AsyncValue.data(list);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }


}