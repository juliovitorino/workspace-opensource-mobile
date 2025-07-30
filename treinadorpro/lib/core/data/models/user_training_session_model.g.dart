// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_training_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTrainingSessionModel _$UserTrainingSessionModelFromJson(
        Map<String, dynamic> json) =>
    UserTrainingSessionModel(
      id: (json['id'] as num?)?.toInt(),
      externalId: json['externalId'] as String?,
      contract: ContractResponseModel.fromJson(
          json['contract'] as Map<String, dynamic>),
      executionTimestamp: json['executionTimestamp'] == null
          ? null
          : DateTime.parse(json['executionTimestamp'] as String),
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userWorkoutPlanList: (json['userWorkoutPlanList'] as List<dynamic>?)
          ?.map((e) => UserWorkoutPlanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserTrainingSessionModelToJson(
        UserTrainingSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'contract': instance.contract,
      'executionTimestamp': instance.executionTimestamp?.toIso8601String(),
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userWorkoutPlanList': instance.userWorkoutPlanList,
    };
