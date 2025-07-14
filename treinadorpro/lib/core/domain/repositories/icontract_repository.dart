import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/api_generic_response.dart';
import '../../data/models/contract_response_model.dart';
import '../../data/models/create_new_student_contract_request.dart';
import '../../data/models/external_id_response_model.dart';
import '../../data/models/student_payment_response_model.dart';

abstract class IContractRespository extends Repository<ExternalIdResponseModel, int>{
  Future<String> save(CreateNewStudentContractRequest request);
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllActiveContracts();
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllContractTodayWorkout();
  Future<ApiGenericResponse<List<StudentPaymentResponseModel>>> findAllStudentOverduePayment();
}