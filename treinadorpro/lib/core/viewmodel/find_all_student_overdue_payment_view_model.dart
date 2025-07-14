import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/student_payment_response_model.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

import '../domain/repositories/icontract_repository.dart';

class FindAllStudentOverduePaymentViewModel extends IViewModel<ApiGenericResponse<List<StudentPaymentResponseModel>>> {

  final IContractRespository _repository;
  FindAllStudentOverduePaymentViewModel(this._repository):super(_repository);


  static const String module = 'find_all_student_overdue_payment_view_model';

  Future<void> findAllStudentOverduePayment() async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.findAllStudentOverduePayment();
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}