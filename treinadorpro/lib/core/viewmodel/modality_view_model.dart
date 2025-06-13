import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/modality_model.dart';
import 'package:treinadorpro/core/domain/repositories/imodality_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class ModalityViewModel extends IViewModel<List<ModalityModel>>{

  final IModalityRepository _repository;

  ModalityViewModel(this._repository) : super(_repository);

  Future<void> findAllActiveModalities() async {
    try {
      print('modality_view_model :: ok');
      state = const AsyncValue.loading();
      final modalitiesList = await _repository.findAllActiveModalities();
      state = AsyncValue.data(modalitiesList);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}