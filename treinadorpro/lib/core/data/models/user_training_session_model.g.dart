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
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      progressStatus: json['progressStatus'] as String? ?? 'NOT_STARTED',
      syncStatus: json['syncStatus'] as String? ?? 'NOT_STARTED',
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
      'startedAt': instance.startedAt?.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'progressStatus': instance.progressStatus,
      'syncStatus': instance.syncStatus,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userWorkoutPlanList': instance.userWorkoutPlanList,
    };
