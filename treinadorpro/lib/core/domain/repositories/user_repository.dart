import 'package:treinadorpro/core/data/datasources/iuser_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/trainer_available_time_response_model.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/data/requests/login_request.dart';
import 'package:treinadorpro/core/data/requests/register_request.dart';
import 'package:treinadorpro/core/data/requests/register_response.dart';
import 'package:treinadorpro/core/domain/repositories/iuser_repository.dart';

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource _userRemoteDatasource;

  UserRepository(this._userRemoteDatasource);

  @override
  Future<UserModel> findById(int id) async {
    final user = await _userRemoteDatasource.fetchById(id);
    return user;
  }

  @override
  Future<UserModel> findByUUID(String uuid) async {
    print('user_repository :: uuid = $uuid');

    final user = await _userRemoteDatasource.fetchByUUID(uuid);
    return user;
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    return await _userRemoteDatasource.register(request);
  }

  @override
  Future<bool> validateCode(String trainerExternalId, String code) async {
    return await _userRemoteDatasource.validateCode(trainerExternalId, code);
  }

  @override
  Future<String> login(LoginRequest loginRequest) async {
    return await _userRemoteDatasource.login(loginRequest);
  }

  @override
  Future<String> loginGoogle(String idToken) async {
    return await _userRemoteDatasource.loginGoogle(idToken);
  }

  @override
  Future<UserModel> getLoggedUser() async {
    return await _userRemoteDatasource.getLoggedUser();
  }

  @override
  Future<ApiGenericResponse<TrainerAvailableTimeResponseModel>> findTrainerAvailableTime() async {
    return await _userRemoteDatasource.findTrainerAvailableTime();
  }
}
