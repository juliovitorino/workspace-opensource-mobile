import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/requests/receive_student_payment_request_model.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class RegisterStudentPaymentViewModel extends IViewModel<ApiGenericResponse<bool>>{

  final IContractRespository _repository;
  RegisterStudentPaymentViewModel(this._repository):super(_repository);


  static const String module = 'register_student_payment_view_model';

  Future<void> registerPayment(String studentPaymentExternalId, ReceiveStudentPaymentRequestModel request) async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.receiveStudentPayment(studentPaymentExternalId, request);
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}