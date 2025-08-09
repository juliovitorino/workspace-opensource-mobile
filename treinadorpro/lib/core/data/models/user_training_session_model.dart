import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

part 'user_training_session_model.g.dart';

@JsonSerializable()
class UserTrainingSessionModel {

  final int? id;
  final String? externalId;
  String? bookingExternalId;
  final ContractResponseModel contract;
  DateTime? startedAt;
  DateTime? finishedAt;
  DateTime? booking;
  String progressStatus;
  String syncStatus;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<UserWorkoutPlanModel>? userWorkoutPlanList;
  String? comments;

  UserTrainingSessionModel({
    this.id,
    this.externalId,
    this.bookingExternalId,
    required this.contract,
    this.startedAt,
    this.finishedAt,
    this.booking,
    this.progressStatus = 'NOT_STARTED',
    this.syncStatus = 'NOT_STARTED',
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userWorkoutPlanList,
    this.comments,
  });

  factory UserTrainingSessionModel.fromJson(Map<String, dynamic> json) =>
      _$UserTrainingSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTrainingSessionModelToJson(this);

}
