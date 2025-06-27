import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/data/requests/register_request.dart';

import '../requests/register_response.dart';

abstract class IUserRemoteDataSource extends IRemoteDatasource<UserModel, int>{
  Future<RegisterResponse> register(RegisterRequest request);
  Future<bool> validateCode(String apiKey, String trainerExternalId, String code);

}