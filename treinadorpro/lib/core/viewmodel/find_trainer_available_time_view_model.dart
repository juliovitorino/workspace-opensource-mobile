import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/trainer_available_time_response_model.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class FindTrainerAvailableTimeViewModel extends IViewModel<ApiGenericResponse<TrainerAvailableTimeResponseModel>> {

  final IUserRepository _repository;
  FindTrainerAvailableTimeViewModel(this._repository): super(_repository);


  static const String module = 'find_trainer_available_time_view_model';

  Future<void> findTrainerAvailableTime() async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findTrainerAvailableTime();
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      print('${st}');
      state = AsyncValue.error(e, st);
    }
  }


}