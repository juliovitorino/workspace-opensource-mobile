import 'package:treinadorpro/core/data/models/user_model.dart';
import '../../domain/entities/trainer_user.dart';

class TrainerUserModel extends TrainerUser {
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
      personalUser: UserModel.fromJson(json['personalUser']),
      studentUser: UserModel.fromJson(json['studentUser']),
      status: json['status'] ?? 'A',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'personalUser': (personalUser as UserModel).toJson(),
      'studentUser': (studentUser as UserModel).toJson(),
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
