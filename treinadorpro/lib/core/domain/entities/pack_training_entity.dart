import 'package:isar/isar.dart';

import 'user_entity.dart';

part 'pack_training_entity.g.dart';

@Collection()
class PackTrainingEntity {
  final Id? id;
  final String externalId;

  @ignore
  final UserEntity? personalUser;

  final String description;
  final int durationDays;
  final int weeklyFrequency;
  final String notes;
  final double price;
  final String? currency;
  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PackTrainingEntity({
    this.id,
    required this.externalId,
    this.personalUser,
    required this.description,
    required this.durationDays,
    required this.weeklyFrequency,
    required this.notes,
    required this.price,
    this.currency,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  static final List<PackTrainingEntity> packTrainings = [
    PackTrainingEntity(
      id: 1,
      externalId: 'a14f1c8d-ccaa-4b32-9387-74d6ec3d0d01',
      personalUser: UserEntity.users[0],
      description: 'Pacote Básico - 4 semanas',
      durationDays: 30,
      weeklyFrequency: 3,
      notes: 'Ideal para iniciantes',
      price: 199.90,
      currency: 'BRL',
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      updatedAt: DateTime.now(),
    ),
    PackTrainingEntity(
      id: 2,
      externalId: 'b91f1d0a-bb52-4f32-9f70-68f5cb9f64f2',
      personalUser: UserEntity.users[0],
      description: 'Pacote Intermediário - 8 semanas',
      durationDays: 60,
      weeklyFrequency: 4,
      notes: 'Foco em resistência muscular',
      price: 349.90,
      currency: 'BRL',
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
      updatedAt: DateTime.now(),
    ),
    PackTrainingEntity(
      id: 3,
      externalId: 'c82a2f4b-1e28-47ae-b1c2-48bdfde79961',
      personalUser: UserEntity.users[0],
      description: 'Pacote Avançado - 12 semanas',
      durationDays: 90,
      weeklyFrequency: 5,
      notes: 'Para atletas experientes',
      price: 499.90,
      currency: 'BRL',
      status: 'P',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      updatedAt: DateTime.now(),
    ),
  ];
}
