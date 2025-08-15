import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../data/models/add_training_pack_request_model.dart';

class AddTrainingPackViewModel extends IViewModel<ApiGenericResponse<bool>>{

  final ITrainingPackRepository _repository;
  AddTrainingPackViewModel(this._repository):super(_repository);


  static const String module = 'add_training_pack_view_model';

  Future<void> addTrainingPack(AddTrainingPackRequestModel request) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.addTrainingPack(request);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }
}