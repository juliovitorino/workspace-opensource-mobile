import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';
import 'package:treinadorpro/core/domain/entities/training_pack.dart';
import 'package:treinadorpro/core/domain/entities/user.dart';
import 'package:treinadorpro/core/domain/entities/user_workout_plan.dart';

import 'modality.dart';

part 'user_pack_training.g.dart';

@Collection()
class UserPackTraining {
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
  final String startTime;
  final String duration;
  final List<int> daysOfWeek;

  @ignore
  final List<UserWorkoutPlan>? userWorkoutPlanList;

  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserPackTraining({
    this.id,
    required this.externalId,
    this.packTrainingEntity,
    this.studentUser,
    required this.goalDescription,
    this.price,
    required this.currency,
    required this.startTime,
    required this.duration,
    required this.daysOfWeek,
    this.userWorkoutPlanList,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  static final List<UserPackTraining> mockUserPackTrainings = [
    UserPackTraining(
      id: 1,
      externalId: '5c238d12-3f8b-4d95-aaff-123456789003',
      packTrainingEntity: TrainingPack.trainingPacks[0],
      studentUser: User.users[1],
      goalDescription: 'Ganhar massa muscular',
      price: Decimal.parse('299.90'),
      currency: 'BRL',
      startTime: '07:00',
      duration: '60 minutos',
      daysOfWeek: [1, 3, 5],
      status: 'A',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}