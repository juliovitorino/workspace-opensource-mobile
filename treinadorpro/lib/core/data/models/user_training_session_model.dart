import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

part 'user_training_session_model.g.dart';

@JsonSerializable()
class UserTrainingSessionModel {

  final int? id;
  final String? externalId;
  final ContractResponseModel contract;
  DateTime? startedAt;
  final DateTime? finishedAt;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<UserWorkoutPlanModel>? userWorkoutPlanList;

  UserTrainingSessionModel({
    this.id,
    this.externalId,
    required this.contract,
    this.startedAt,
    this.finishedAt,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userWorkoutPlanList,
  });

  factory UserTrainingSessionModel.fromJson(Map<String, dynamic> json) =>
      _$UserTrainingSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTrainingSessionModelToJson(this);
}
