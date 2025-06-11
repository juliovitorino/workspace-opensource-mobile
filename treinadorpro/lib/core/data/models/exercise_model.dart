import 'package:treinadorpro/core/data/models/iname.dart';
import 'package:treinadorpro/core/domain/entities/exercise.dart';

class ExerciseModel extends Exercise implements IName {

  const ExerciseModel({
    int? id,
    String? externalId,
    required String namePt,
    required String nameEs,
    required String nameEn,
    String? videoUrlPt,
    String? videoUrlEn,
    String? videoUrlEs,
    required String imageUuid,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,}) : super(
    id: id,
    externalId: externalId,
    namePt: namePt,
    nameEs: nameEs,
    nameEn: nameEn,
    videoUrlEn: videoUrlEn,
    videoUrlEs: videoUrlEs,
    videoUrlPt: videoUrlPt,
    imageUuid: imageUuid,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );


  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    print('exercise_model :: parsing fromJson');

    final response = ExerciseModel(
      id: json['id'],
      externalId: json['externalId'],
      namePt: json['namePt'],
      nameEs: json['nameEs'],
      nameEn: json['nameEn'],
      videoUrlPt: json['videoUrlPt'] ?? '',
      videoUrlEn: json['videoUrlEn'] ?? '',
      videoUrlEs: json['videoUrlEs'] ?? '',
      imageUuid: json['imageUUID'],
      status: json['status'] ?? 'A',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
    print('exercise_model :: END parsing fromJson successfully');

    return response;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'externalId': externalId,
      'namePt': namePt,
      'nameEs': nameEs,
      'nameEn': nameEn,
      'videoUrlPt': videoUrlPt,
      'videoUrlEs': videoUrlEs,
      'videoUrlEn': videoUrlEn,
      'imageUUID': imageUuid,
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