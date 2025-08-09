import 'package:json_annotation/json_annotation.dart';

part 'find_all_training_session_calendar_request_model.g.dart';

@JsonSerializable()
class FindAllTrainingSessionCalendarRequestModel {
  FindAllTrainingSessionCalendarRequestModel(this.contractExternalId, this.startDate, this.endDate);

  final String contractExternalId;
  final DateTime startDate;
  final DateTime endDate;

  factory FindAllTrainingSessionCalendarRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FindAllTrainingSessionCalendarRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FindAllTrainingSessionCalendarRequestModelToJson(this);


}
