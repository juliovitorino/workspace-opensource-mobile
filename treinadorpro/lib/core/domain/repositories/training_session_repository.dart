import 'package:treinadorpro/core/data/datasources/itraining_session_datasource.dart';
import 'package:treinadorpro/core/data/models/booking_model_request.dart';
import 'package:treinadorpro/core/data/models/find_all_training_session_calendar_request_model.dart';

import '../../data/models/api_generic_response.dart';
import '../../data/models/user_training_session_model.dart';
import 'itraining_session_repository.dart';

class TrainingSessionRepository implements ITrainingSessionRepository {
  final ITrainingSessionDatasource datasource;

  TrainingSessionRepository(this.datasource);

  @override
  Future<UserTrainingSessionModel> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<UserTrainingSessionModel> findByUUID(String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

  @override
  Future<ApiGenericResponse<bool>> save(UserTrainingSessionModel request) async {
    return await datasource.save(request);
  }

  @override
  Future<ApiGenericResponse<UserTrainingSessionModel>> findMostRecentTrainingSession(
    String contractExternalId,
  ) async {
    return await datasource.findMostRecentTrainingSession(contractExternalId);
  }

  @override
  Future<ApiGenericResponse<bool>> bookingTrainingSession(BookingModelRequest request) async {
    return await datasource.bookingTrainingSession(request);
  }

  @override
  Future<ApiGenericResponse<List<UserTrainingSessionModel>>> findTrainingSessionCalendar(
    FindAllTrainingSessionCalendarRequestModel request,
  ) async {
    return await datasource.findTrainingSessionCalendar(request);
  }

  @override
  Future<ApiGenericResponse<bool>> deleteTrainingSession(String contractExternalId, String trainingSessionExternalId) async {
    return await datasource.deleteTrainingSession(contractExternalId, trainingSessionExternalId);
  }

  @override
  Future<ApiGenericResponse<bool>> changeBooking(String contractExternalId, String trainingSessionExternalId, DateTime newBookingDate) async {
    return await datasource.changeBooking(contractExternalId, trainingSessionExternalId, newBookingDate);
  }
}
