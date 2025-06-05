import 'user_entity.dart';

class TrainerUserEntity {
  final int? id;
  final UserEntity personalUser;
  final UserEntity studentUser;
  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TrainerUserEntity({
    this.id,
    required this.personalUser,
    required this.studentUser,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  static final List<TrainerUserEntity> trainerUsers = [
    TrainerUserEntity(
      id: 1,
      personalUser: UserEntity.users[0], // Alice
      studentUser: UserEntity.users[1],  // Bruno
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
      updatedAt: DateTime.now(),
    ),
    TrainerUserEntity(
      id: 2,
      personalUser: UserEntity.users[0], // Alice
      studentUser: UserEntity.users[3],  // Antonio
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      updatedAt: DateTime.now(),
    ),
    TrainerUserEntity(
      id: 3,
      personalUser: UserEntity.users[0], // Alice
      studentUser: UserEntity.users[4],  // Antonio
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      updatedAt: DateTime.now(),
    ),
  ];
}
