import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

import '../../data/models/booking_model_request.dart';
import '../../data/models/find_all_training_session_calendar_request_model.dart';

abstract class ITrainingSessionRepository extends Repository<UserTrainingSessionModel, int> {
  Future<ApiGenericResponse<bool>> save(UserTrainingSessionModel request);

  Future<ApiGenericResponse<UserTrainingSessionModel>> findMostRecentTrainingSession(
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
}
