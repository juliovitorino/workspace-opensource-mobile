import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class NewStudentViewModel extends IViewModel<String>{
  final IContractRespository _repository;
  NewStudentViewModel(this._repository) : super(_repository);

  static const String module = 'new_student_view_model';

  Future<void> saveContract(CreateNewStudentContractRequest request) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final externalId = await _repository.save(request);
      state = AsyncValue.data(externalId);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}