
import 'package:treinadorpro/core/data/models/user_model.dart';

import '../../domain/entities/modality.dart';
import '../../domain/entities/training_pack.dart';

class ModalityModel extends Modality {
  const ModalityModel({
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

  factory ModalityModel.fromJson(Map<String, dynamic> json) {
    return ModalityModel(
      id: json['id'],
      namePt: json['namePt'],
      nameEs: json['nameEs'],
      nameEn: json['nameEn'],
      status: json['status'] ?? 'A',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namePt': namePt,
      'nameEs': nameEs,
      'nameEn': nameEn,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
