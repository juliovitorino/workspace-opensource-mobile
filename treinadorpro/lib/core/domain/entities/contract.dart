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

  static final List<Contract> mockContracts = [
    Contract(
      id: 1,
      externalId: '5c238d12-3f8b-4d95-aaff-123456789003',
      packTrainingEntity: TrainingPack.trainingPacks[0],
      studentUser: User.users[1],
      goalDescription: 'Ganhar massa muscular',
      price: Decimal.parse('299.90'),
      currency: 'BRL',
      monday: '07:00',
      tuesday: '07:00',
      wednesday: '07:00',
      duration: '60 minutos',
      status: 'A',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}