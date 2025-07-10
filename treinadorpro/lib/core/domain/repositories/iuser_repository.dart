import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/trainer_available_time_response_model.dart';
import '../../data/models/user_model.dart';
import '../../data/requests/login_request.dart';
import '../../data/requests/register_request.dart';
import '../../data/requests/register_response.dart';

abstract class IUserRepository extends Repository<UserModel, int> {
  Future<RegisterResponse> register(RegisterRequest request);
  Future<bool> validateCode(String trainerExternalId, String code);
  Future<String> login(LoginRequest loginRequest);
  Future<UserModel> getLoggedUser();
  Future<ApiGenericResponse<TrainerAvailableTimeResponseModel>> findTrainerAvailableTime();
}