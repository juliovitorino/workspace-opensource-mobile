// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_last_load_exercise_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindLastLoadExerciseRequestModel _$FindLastLoadExerciseRequestModelFromJson(
        Map<String, dynamic> json) =>
    FindLastLoadExerciseRequestModel(
      contractExternalId: json['contractExternalId'] as String,
      exerciseExternalId: json['exerciseExternalId'] as String?,
      customExercise: json['customExercise'] as String?,
    );

Map<String, dynamic> _$FindLastLoadExerciseRequestModelToJson(
        FindLastLoadExerciseRequestModel instance) =>
    <String, dynamic>{
      'contractExternalId': instance.contractExternalId,
      'exerciseExternalId': instance.exerciseExternalId,
      'customExercise': instance.customExercise,
    };
