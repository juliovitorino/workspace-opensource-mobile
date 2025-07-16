import 'package:isar/isar.dart';

part 'modality.g.dart';

@Collection()
class Modality {
  final Id? id;
  final String namePt;
  final String nameEn;
  final String nameEs;
  final String? status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Modality({
    this.id,
    required this.nameEn,
    required this.nameEs,
    required this.namePt,
    this.status,
    this.createdAt,
    this.updatedAt
  });

}
