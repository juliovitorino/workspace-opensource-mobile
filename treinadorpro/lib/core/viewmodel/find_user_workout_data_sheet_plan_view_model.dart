import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/user_data_sheet_plan_model.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../domain/repositories/icontract_repository.dart';

class FindUserWorkoutDataSheetPlanViewModel extends IViewModel<ApiGenericResponse<UserDataSheetPlanModel>>{

  final IContractRespository _repository;
  FindUserWorkoutDataSheetPlanViewModel(this._repository):super(_repository);


  static const String module = 'find_all_contract_today_workout_view_model';

  Future<void> findUserWorkoutDataSheetPlan(String contractExternalId) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findUserWorkoutDataSheetPlan(contractExternalId);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}