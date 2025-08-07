import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';

part 'booking_model_request.g.dart';

@JsonSerializable()
class BookingModelRequest {
  final String contractExternalId;
  final List<DateTime> bookingList;
  final UserTrainingSessionModel trainingSession;

  BookingModelRequest({
    required this.contractExternalId,
    required this.bookingList,
    required this.trainingSession,
  });


  factory BookingModelRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingModelRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BookingModelRequestToJson(this);

}
