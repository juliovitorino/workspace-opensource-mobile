
import '../../domain/entities/work_group.dart';
import 'iname.dart';

class WorkgroupModel extends Workgroup implements IName{
  const WorkgroupModel({
    int? id,
    String? externalId,
    required String namePt,
    required String nameEs,
    required String nameEn,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
    id: id,
    externalId: externalId,
    namePt: namePt,
    nameEs: nameEs,
    nameEn: nameEn,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory WorkgroupModel.fromJson(Map<String, dynamic> json) {
    print('WorkGroup_model :: parsing fromJson');

    final response = WorkgroupModel(
      id: json['id'],
      externalId: json['externalId'],
      namePt: json['namePt'],
      nameEs: json['nameEs'],
      nameEn: json['nameEn'],
      status: json['status'] ?? 'A',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
    print('WorkGroup_model :: parsing fromJson was finished successfully');

    return response;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'externalId': externalId,
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