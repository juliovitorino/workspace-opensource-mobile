// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_all_training_session_calendar_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindAllTrainingSessionCalendarRequestModel
    _$FindAllTrainingSessionCalendarRequestModelFromJson(
            Map<String, dynamic> json) =>
        FindAllTrainingSessionCalendarRequestModel(
          json['contractExternalId'] as String,
          DateTime.parse(json['startDate'] as String),
          DateTime.parse(json['endDate'] as String),
        );

Map<String, dynamic> _$FindAllTrainingSessionCalendarRequestModelToJson(
        FindAllTrainingSessionCalendarRequestModel instance) =>
    <String, dynamic>{
      'contractExternalId': instance.contractExternalId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
