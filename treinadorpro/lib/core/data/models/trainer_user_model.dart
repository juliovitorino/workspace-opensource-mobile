import 'package:treinadorpro/core/data/models/user_model.dart';
import '../../domain/entities/trainer_user_entity.dart';

class TrainerUserModel extends TrainerUserEntity {
  const TrainerUserModel({
    int? id,
    required UserModel personalUser,
    required UserModel studentUser,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
    id: id,
    personalUser: personalUser,
    studentUser: studentUser,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory TrainerUserModel.fromJson(Map<String, dynamic> json) {
    return TrainerUserModel(
      id: json['id'],
      personalUser: UserModel.fromJson(json['personal_user']),
      studentUser: UserModel.fromJson(json['student_user']),
      status: json['status'] ?? 'A',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'personal_user': (personalUser as UserModel).toJson(),
      'student_user': (studentUser as UserModel).toJson(),
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
