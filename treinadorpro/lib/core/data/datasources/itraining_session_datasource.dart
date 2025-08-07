import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/booking_model_request.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';

abstract class ITrainingSessionDatasource extends IRemoteDatasource<UserTrainingSessionModel, int> {
  Future<ApiGenericResponse<bool>> save(UserTrainingSessionModel request);

  Future<ApiGenericResponse<UserTrainingSessionModel>> findMostRecentTrainingSession(
      String contractExternalId);

  Future<ApiGenericResponse<bool>> bookingTrainingSession(BookingModelRequest request);

  }