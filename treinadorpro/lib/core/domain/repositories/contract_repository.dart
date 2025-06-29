import 'package:treinadorpro/core/data/datasources/icontract_datasource.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/data/models/external_id_response_model.dart';
import 'package:treinadorpro/core/domain/repositories/icontract_repository.dart';

class ContractRepository implements IContractRespository{

  final IContractDatasource datasource;
  ContractRepository(this.datasource);

  @override
  Future<ExternalIdResponseModel> findById(String token, int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<ExternalIdResponseModel> findByUUID(String token, String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

  @override
  Future<String> save(String token, CreateNewStudentContractRequest request) async {
    return await datasource.save(token,request);
  }

}