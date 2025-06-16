import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/create_new_student_contract_request.dart';
import 'package:treinadorpro/core/data/models/external_id_response_model.dart';

abstract class IContractDatasource extends IRemoteDatasource<ExternalIdResponseModel, int>{
  Future<String> save(CreateNewStudentContractRequest request);
}