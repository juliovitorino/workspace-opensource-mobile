import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';
import 'package:treinadorpro/core/domain/entities/training_pack.dart';
import 'package:treinadorpro/core/domain/entities/user.dart';
import 'package:treinadorpro/core/domain/entities/user_workout_plan.dart';

import 'modality.dart';

part 'contract.g.dart';

@Collection()
class Contract {
  final Id? id;
  final String externalId;

  @ignore
  final TrainingPack? packTrainingEntity;

  @ignore
  final User? studentUser;

  final String goalDescription;

  @ignore
  final Decimal? price;

  final String currency;
  final String? monday;
  final String? tuesday;
  final String? wednesday;
  final String? thursday;
  final String? friday;
  final String? saturday;
  final String? sunday;
  final String duration;
  // final List<String> daysOfWeek;

  @ignore
  final List<UserWorkoutPlan>? userWorkoutPlanList;

  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Contract({
    this.id,
    required this.externalId,
    this.packTrainingEntity,
    this.studentUser,
    required this.goalDescription,
    this.price,
    required this.currency,
    required this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    required this.duration,
    this.userWorkoutPlanList,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

}