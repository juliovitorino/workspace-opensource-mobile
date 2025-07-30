// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_execution_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserExecutionSetModel _$UserExecutionSetModelFromJson(
        Map<String, dynamic> json) =>
    UserExecutionSetModel(
      id: (json['id'] as num).toInt(),
      externalId: json['externalId'] as String,
      userTrainingSessionId: (json['userTrainingSessionId'] as num).toInt(),
      userWorkoutPlan: json['userWorkoutPlan'] == null
          ? null
          : UserWorkoutPlanModel.fromJson(
              json['userWorkoutPlan'] as Map<String, dynamic>),
      startedAt: DateTime.parse(json['startedAt'] as String),
      finishedAt: DateTime.parse(json['finishedAt'] as String),
      setNumber: (json['setNumber'] as num).toInt(),
      reps: (json['reps'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      weightUnit: json['weightUnit'] as String,
      elapsedTime: (json['elapsedTime'] as num?)?.toInt(),
      status: json['status'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserExecutionSetModelToJson(
        UserExecutionSetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'userTrainingSessionId': instance.userTrainingSessionId,
      'userWorkoutPlan': instance.userWorkoutPlan,
      'startedAt': instance.startedAt.toIso8601String(),
      'finishedAt': instance.finishedAt.toIso8601String(),
      'setNumber': instance.setNumber,
      'reps': instance.reps,
      'weight': instance.weight,
      'weightUnit': instance.weightUnit,
      'elapsedTime': instance.elapsedTime,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
