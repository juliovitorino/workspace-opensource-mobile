import 'package:treinadorpro/core/data/requests/receive_student_payment_request_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/api_generic_response.dart';
import '../../data/models/contract_response_model.dart';
import '../../data/models/create_new_student_contract_request.dart';
import '../../data/models/external_id_response_model.dart';
import '../../data/models/student_payment_response_model.dart';
import '../../data/models/student_payments_transaction_response_model.dart';
import '../../data/models/user_data_sheet_plan_model.dart';
import '../../data/requests/contract_schedule_modifier_request_model.dart';

abstract class IContractRespository extends Repository<ExternalIdResponseModel, int>{
  Future<String> save(CreateNewStudentContractRequest request);
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllActiveContracts();
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllContractTodayWorkout();
  Future<ApiGenericResponse<ContractResponseModel>> findContract(String externalId);
  Future<ApiGenericResponse<List<StudentPaymentResponseModel>>> findAllStudentOverduePayment();
  Future<ApiGenericResponse<List<StudentPaymentsTransactionResponseModel>>> findAllStudentReceivedPayment();
  Future<ApiGenericResponse<bool>> saveUserDataSheetPlan(UserDataSheetPlanModel request);
  Future<ApiGenericResponse<UserDataSheetPlanModel>> findUserWorkoutDataSheetPlan(String contractExternalId);
  Future<ApiGenericResponse<bool>> receiveStudentPayment(String studentPaymentExternalId, ReceiveStudentPaymentRequestModel request);
  Future<ApiGenericResponse<bool>> changeSchedule(String contractExternalId, ContractScheduleModifierRequestModel request);

}