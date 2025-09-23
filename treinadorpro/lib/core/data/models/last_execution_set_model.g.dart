// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_execution_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastExecutionSetModel _$LastExecutionSetModelFromJson(
        Map<String, dynamic> json) =>
    LastExecutionSetModel(
      set: (json['set'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      elapseTime: json['elapseTime'] as String,
    );

Map<String, dynamic> _$LastExecutionSetModelToJson(
        LastExecutionSetModel instance) =>
    <String, dynamic>{
      'set': instance.set,
      'weight': instance.weight,
      'reps': instance.reps,
      'elapseTime': instance.elapseTime,
    };
