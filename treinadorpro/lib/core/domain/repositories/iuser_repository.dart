import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/user_model.dart';
import '../../data/requests/login_request.dart';
import '../../data/requests/register_request.dart';
import '../../data/requests/register_response.dart';

abstract class IUserRepository extends Repository<UserModel, int> {
  Future<RegisterResponse> register(RegisterRequest request);
  Future<bool> validateCode(String apiKey, String trainerExternalId, String code);
  Future<String> login(String apiKey, LoginRequest loginRequest);
}