import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/booking_model_request.dart';
import 'package:treinadorpro/core/data/models/find_all_training_session_calendar_request_model.dart';
import 'package:treinadorpro/core/data/models/find_last_load_exercise_request_model.dart';
import 'package:treinadorpro/core/data/models/find_last_load_exercise_response_model.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';

abstract class ITrainingSessionDatasource extends IRemoteDatasource<UserTrainingSessionModel, int> {
  Future<ApiGenericResponse<bool>> save(UserTrainingSessionModel request);

  Future<ApiGenericResponse<UserTrainingSessionModel>> findMostRecentTrainingSession(
    String contractExternalId,
  );

  Future<ApiGenericResponse<UserTrainingSessionModel>> findMostRecentBookingTrainingSession(
    String contractExternalId,
  );

  Future<ApiGenericResponse<bool>> bookingTrainingSession(BookingModelRequest request);

  Future<ApiGenericResponse<List<UserTrainingSessionModel>>> findTrainingSessionCalendar(
    FindAllTrainingSessionCalendarRequestModel request,
  );

  Future<ApiGenericResponse<bool>> deleteTrainingSession(
    String contractExternalId,
    String trainingSessionExternalId,
  );

  Future<ApiGenericResponse<bool>> changeBooking(
    String contractExternalId,
    String trainingSessionExternalId,
    DateTime newBookingDate,
  );

  Future<ApiGenericResponse<FindLastLoadExerciseResponseModel>> findLastLoadExercise(
    FindLastLoadExerciseRequestModel request,
  );
}
