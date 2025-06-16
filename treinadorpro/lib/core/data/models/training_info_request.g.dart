// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingInfoRequest _$TrainingInfoRequestFromJson(Map<String, dynamic> json) =>
    TrainingInfoRequest(
      goal: json['goal'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      startTime: json['startTime'] as String?,
      duration: json['duration'] as String?,
      weekdays: (json['weekdays'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TrainingInfoRequestToJson(
        TrainingInfoRequest instance) =>
    <String, dynamic>{
      'goal': instance.goal,
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime,
      'duration': instance.duration,
      'weekdays': instance.weekdays,
    };
