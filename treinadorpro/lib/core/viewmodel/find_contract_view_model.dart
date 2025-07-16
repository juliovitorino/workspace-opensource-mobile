import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../domain/repositories/icontract_repository.dart';

class FindContractViewModel extends IViewModel<ApiGenericResponse<ContractResponseModel>> {

  final IContractRespository _repository;
  FindContractViewModel(this._repository):super(_repository);


  static const String module = 'find_contract_view_model';

  Future<void> findContract(String externalId) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findContract(externalId);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }
}