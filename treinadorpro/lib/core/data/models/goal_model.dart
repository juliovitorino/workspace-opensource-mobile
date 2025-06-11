import 'package:treinadorpro/core/data/models/iname.dart';
import 'package:treinadorpro/core/domain/entities/goal.dart';

class GoalModel extends Goal implements IName{
  const GoalModel({
    int? id,
    required String namePt,
    required String nameEs,
    required String nameEn,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
    id: id,
    namePt: namePt,
    nameEs: nameEs,
    nameEn: nameEn,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    print('goal_model :: parsing fromJson');

    return GoalModel(
      id: json['id'],
      namePt: json['namePt'],
      nameEs: json['nameEs'],
      nameEn: json['nameEn'],
      status: json['status'] ?? 'A',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namePt': namePt,
      'nameEs': nameEs,
      'nameEn': nameEn,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  String getName() {
    return this.namePt; // Waiting for int10l
  }
}