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
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      monday: json['monday'] as String?,
      tuesday: json['tuesday'] as String?,
      wednesday: json['wednesday'] as String?,
      thursday: json['thursday'] as String?,
      friday: json['friday'] as String?,
      saturday: json['saturday'] as String?,
      sunday: json['sunday'] as String?,
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$TrainingInfoRequestToJson(
        TrainingInfoRequest instance) =>
    <String, dynamic>{
      'goal': instance.goal,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
      'duration': instance.duration,
    };
