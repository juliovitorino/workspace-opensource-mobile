import 'package:isar/isar.dart';

import 'user.dart';

part 'trainer_user.g.dart';

@Collection()
class TrainerUser {
  final Id? id;

  @ignore
  final User? personalUser;

  @ignore
  final User? studentUser;

  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TrainerUser({
    this.id,
    this.personalUser,
    this.studentUser,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  static final List<TrainerUser> trainerUsers = [
    TrainerUser(
      id: 1,
      personalUser: User.users[0], // Alice
      studentUser: User.users[1],  // Bruno
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 100)),
      updatedAt: DateTime.now(),
    ),
    TrainerUser(
      id: 2,
      personalUser: User.users[0], // Alice
      studentUser: User.users[3],  // Antonio
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      updatedAt: DateTime.now(),
    ),
    TrainerUser(
      id: 3,
      personalUser: User.users[0], // Alice
      studentUser: User.users[4],  // Antonio
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
      updatedAt: DateTime.now(),
    ),
  ];
}
