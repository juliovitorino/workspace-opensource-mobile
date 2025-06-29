import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/create_new_student_contract_request.dart';
import '../../data/models/external_id_response_model.dart';

abstract class IContractRespository extends Repository<ExternalIdResponseModel, int>{
  Future<String> save(CreateNewStudentContractRequest request);
}