// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_last_load_exercise_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindLastLoadExerciseResponseModel _$FindLastLoadExerciseResponseModelFromJson(
        Map<String, dynamic> json) =>
    FindLastLoadExerciseResponseModel(
      setNumber: (json['setNumber'] as num?)?.toInt(),
      reps: (json['reps'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FindLastLoadExerciseResponseModelToJson(
        FindLastLoadExerciseResponseModel instance) =>
    <String, dynamic>{
      'setNumber': instance.setNumber,
      'reps': instance.reps,
      'weight': instance.weight,
    };
