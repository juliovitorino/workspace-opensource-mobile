import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';

class TrainingPackPageResultViewModel extends StateNotifier<AsyncValue<PageResultResponseModel<TrainingPackModel>>>{

  final ITrainingPackRespository _repository;

  TrainingPackPageResultViewModel(this._repository) : super(const AsyncValue.loading());

  Future<void> findAllTrainingPackByPersonalExternalId(String uuid, int page, int size) async {
    try{
      print('training_pack_view_model :: uuid = $uuid');
      state = const AsyncValue.loading();
      final pageResponse = await _repository.findAllTrainingPackByPersonalExternalId(uuid, page, size);
      state = AsyncValue.data(pageResponse);
    } catch(e,st){
      state = AsyncValue.error(e, st);
    }
  }

}