
import 'package:treinadorpro/core/data/models/iname.dart';

import '../../domain/entities/modality.dart';

class ModalityModel extends Modality implements IName {
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
    print('modality_model :: parsing fromJson');

    return ModalityModel(
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
