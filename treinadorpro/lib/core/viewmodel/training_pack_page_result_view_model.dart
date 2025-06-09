import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/domain/repositories/itraining_pack_repository.dart';

class TrainingPackPageResultViewModel
    extends
        StateNotifier<AsyncValue<PageResultResponseModel<TrainingPackModel>>> {
  final ITrainingPackRespository _repository;

  TrainingPackPageResultViewModel(this._repository)
    : super(const AsyncValue.loading());

  Future<PageResultResponseModel<TrainingPackModel>?>  findAllTrainingPackByPersonalExternalId( String uuid, int page, int size) async {
    try {
      print('training_pack_view_model :: uuid = $uuid');
      final previous = state.valueOrNull;
      print("previous: ${previous?.content.length ?? 0}");

      state = const AsyncValue.loading();
      final pageResponse = await _repository
          .findAllTrainingPackByPersonalExternalId(uuid, page, size);

      final List<TrainingPackModel> combined = [
        if (previous != null && page > 1) ...previous.content,
        ...pageResponse.content,
      ];

      print("combined: ${combined}");
      final newState = PageResultResponseModel<TrainingPackModel>(
        page: pageResponse.page,
        totalPages: pageResponse.totalPages,
        count: combined.length,
        content: combined,
      );

      state = AsyncValue.data(newState);
      return pageResponse;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}
