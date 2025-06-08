
import 'package:treinadorpro/core/domain/entities/modality.dart';

class ModalityModel extends Modality {
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ModalityModel({
    required id,
    required namePt,
    required nameEn,
    required nameEs,
    required status,
    this.createdAt,
    this.updatedAt
  }) : super(
    id: id,
    nameEn: nameEn,
    nameEs: nameEs,
    namePt: namePt,
    status: status,
  );

  factory ModalityModel.fromJson(Map<String, dynamic> json) {
    return ModalityModel(
      id: json['id'],
      namePt: json['namePt'],
      nameEn: json['nameEn'],
      nameEs: json['nameEs'],
      status: json['status'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namePt': namePt,
      'nameEn': nameEn,
      'nameEs': nameEs,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String()
    };
  }
}
