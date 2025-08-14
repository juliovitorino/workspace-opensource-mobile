import 'package:treinadorpro/core/data/datasources/icontract_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/data/models/external_id_response_model.dart';
import 'package:treinadorpro/core/data/models/student_payment_response_model.dart';
import 'package:treinadorpro/core/data/models/user_data_sheet_plan_model.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';

import '../../data/models/student_payments_transaction_response_model.dart';

class ContractRepository implements IContractRespository{

  final IContractDatasource datasource;
  ContractRepository(this.datasource);

  @override
  Future<ExternalIdResponseModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<ExternalIdResponseModel> findByUUID(String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

  @override
  Future<String> save(CreateNewStudentContractRequest request) async {
    return await datasource.save(request);
  }

  @override
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllActiveContracts() async {
    return await datasource.findAllActiveContracts();
  }

  @override
  Future<ApiGenericResponse<List<ContractResponseModel>>> findAllContractTodayWorkout() async {
    return await datasource.findAllContractTodayWorkout();
  }

  @override
  Future<ApiGenericResponse<List<StudentPaymentResponseModel>>> findAllStudentOverduePayment() async {
    return await datasource.findAllStudentOverduePayment();
  }

  @override
  Future<ApiGenericResponse<List<StudentPaymentsTransactionResponseModel>>> findAllStudentReceivedPayment() async {
    return await datasource.findAllStudentReceivedPayment();
  }

  @override
  Future<ApiGenericResponse<ContractResponseModel>> findContract(String externalId) async {
    return await datasource.findContract(externalId);
  }

  @override
  Future<ApiGenericResponse<bool>> saveUserDataSheetPlan(UserDataSheetPlanModel request) async {
    return await datasource.saveUserDataSheetPlan(request);
  }

  @override
  Future<ApiGenericResponse<UserDataSheetPlanModel>> findUserWorkoutDataSheetPlan(String contractExternalId) async {
    return await datasource.findUserWorkoutDataSheetPlan(contractExternalId);
  }
}