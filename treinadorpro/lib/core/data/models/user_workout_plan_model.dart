
import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/data/models/exercise_model.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/data/models/modality_model.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/data/models/work_group_model.dart';
import 'package:treinadorpro/core/enums/execution_method_enum.dart';

part 'user_workout_plan_model.g.dart';

@JsonSerializable()
class UserWorkoutPlanModel {
  final int? id;
  final String? externalId;
  final ContractResponseModel contract;
  final ModalityModel? modality;
  final GoalModel? goal;
  final ProgramModel? program;
  final WorkgroupModel workGroup;
  final ExerciseModel? exercise;
  final String? customExercise;
  final String? customProgram;
  final ExecutionMethod? executionMethod;
  final int? qtySeries;
  final int? qtyReps;
  final String? execution;
  final String? executionTime;
  final String? restTime;
  final int? weight;
  final String? weightUnit;
  final String? comments;
  final String? obs;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? control;

  UserWorkoutPlanModel( {
    this.id,
    this.externalId,
    required this.contract,
    this.modality,
    this.goal,
    this.program,
    required this.workGroup,
    this.exercise,
    this.customExercise,
    this.customProgram,
    this.executionMethod,
    this.qtySeries,
    this.qtyReps,
    this.execution,
    this.executionTime,
    this.restTime,
    this.weight,
    this.weightUnit,
    this.comments,
    this.obs,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.control,
  });

  factory UserWorkoutPlanModel.fromJson(Map<String, dynamic> json) =>
      _$UserWorkoutPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserWorkoutPlanModelToJson(this);



}
