import 'package:isar/isar.dart';
import 'package:treinadorpro/core/domain/entities/contract.dart';
import 'package:treinadorpro/core/domain/entities/exercise.dart';
import 'package:treinadorpro/core/domain/entities/goal.dart';
import 'package:treinadorpro/core/domain/entities/modality.dart';
import 'package:treinadorpro/core/domain/entities/program.dart';
import 'package:treinadorpro/core/domain/entities/work_group.dart';

part 'user_workout_plan.g.dart';

@Collection()
class UserWorkoutPlan {
  final Id? id;

  @ignore
  final Contract? contract;

  @ignore
  final Modality? modality;

  @ignore
  final Goal? goal;

  @ignore
  final Program? program;

  @ignore
  final Workgroup? workgroup;

  @ignore
  final Exercise? exercise;

  final String externalId;
  final String customExercise;
  final String customProgram;
  final String executionMethod;
  final int qtySeries;
  final int qtyReps;
  final String execution;
  final String executionTime;
  final String restTime;
  final String comments;
  final String obs;
  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserWorkoutPlan({
    this.id,
    this.contract,
    this.modality,
    this.goal,
    this.program,
    this.workgroup,
    this.exercise,
    required this.externalId,
    required this.customExercise,
    required this.customProgram,
    required this.executionMethod,
    required this.qtySeries,
    required this.qtyReps,
    required this.execution,
    required this.executionTime,
    required this.restTime,
    required this.comments,
    required this.obs,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });
}
