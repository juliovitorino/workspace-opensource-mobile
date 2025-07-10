import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/trainer_available_time_response_model.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/data/requests/register_request.dart';

import '../requests/login_request.dart';
import '../requests/register_response.dart';

abstract class IUserRemoteDataSource extends IRemoteDatasource<UserModel, int>{
  Future<RegisterResponse> register(RegisterRequest request);
  Future<bool> validateCode(String trainerExternalId, String code);
  Future<String> login(LoginRequest loginRequest);
  Future<UserModel> getLoggedUser();
  Future<ApiGenericResponse<TrainerAvailableTimeResponseModel>> findTrainerAvailableTime();
}