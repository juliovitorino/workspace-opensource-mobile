import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/user_training_session_model.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

part 'user_execution_set_model.g.dart';

@JsonSerializable()
class UserExecutionSetModel {
  final int? id;
  final String? externalId;
  // final UserTrainingSessionModel userTrainingSession;
  // final UserWorkoutPlanModel? userWorkoutPlan;
  final DateTime startedAt;
  final DateTime finishedAt;
  final int setNumber;
  final int? reps;
  final double? weight;
  final String? weightUnit;
  final int? elapsedTime;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserExecutionSetModel({
    this.id,
    this.externalId,
    // required this.userTrainingSession,
    // this.userWorkoutPlan,
    required this.startedAt,
    required this.finishedAt,
    required this.setNumber,
    this.reps,
    this.weight,
    this.weightUnit,
    this.elapsedTime,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UserExecutionSetModel.fromJson(Map<String, dynamic> json) =>
      _$UserExecutionSetModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserExecutionSetModelToJson(this);
}
