import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';
import 'package:treinadorpro/core/domain/entities/pack_training_entity.dart';
import 'package:treinadorpro/core/domain/entities/user_entity.dart';

part 'user_pack_training_entity.g.dart';

@Collection()
class UserPackTrainingEntity {
  final Id? id;
  final String externalId;

  @ignore
  final PackTrainingEntity? packTrainingEntity;

  @ignore
  final UserEntity? studentUser;

  final String goalDescription;

  @ignore
  final Decimal? price;

  final String currency;
  final String startTime;
  final String duration;
  final List<int> daysOfWeek;
  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserPackTrainingEntity({
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
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  static final List<UserPackTrainingEntity> mockUserPackTrainings = [
    UserPackTrainingEntity(
      id: 1,
      externalId: '5c238d12-3f8b-4d95-aaff-123456789003',
      packTrainingEntity: PackTrainingEntity.packTrainings[0],
      studentUser: UserEntity.users[1],
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