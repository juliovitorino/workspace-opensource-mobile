import 'package:treinadorpro/features/woukoutsheet/domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ExerciseModel({
    required id,
    required namePt,
    required nameEn,
    required nameEs,
    required imageUuid,
    required status,
    this.createdAt,
    this.updatedAt,
  }) : super(
         id: id,
         nameEn: nameEn,
         nameEs: nameEs,
         namePt: namePt,
         status: status,
         imageUuid: imageUuid,
       );

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      namePt: json['namePt'],
      nameEn: json['nameEn'],
      nameEs: json['nameEs'],
      imageUuid: json['image_uuid'],
      status: json['status'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'namePt': namePt,
      'nameEn': nameEn,
      'nameEs': nameEs,
      'image_uuid': imageUuid,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
