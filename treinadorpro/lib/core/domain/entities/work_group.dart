import 'package:isar/isar.dart';

part 'work_group.g.dart';

@Collection()
class Workgroup {
  final Id? id;
  final String? externalId;
  final String namePt;
  final String nameEn;
  final String nameEs;
  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Workgroup({
    this.id,
    this.externalId,
    required this.namePt,
    required this.nameEn,
    required this.nameEs,
    required this.status,
    this.createdAt,
    this.updatedAt
  });

  static List<Workgroup> workGroups = [
    Workgroup(id: 1, namePt: 'Peitoral', nameEn: 'Chest', nameEs: 'Pectorales', status: 'A'),
    Workgroup(id: 2, namePt: 'Costas', nameEn: 'Back', nameEs: 'Espalda', status: 'A'),
    Workgroup(id: 3, namePt: 'Ombros', nameEn: 'Shoulders', nameEs: 'Hombros', status: 'A'),
    Workgroup(id: 5, namePt: 'Bíceps', nameEn: 'Biceps', nameEs: 'Bíceps', status: 'A'),
    Workgroup(id: 6, namePt: 'Tríceps', nameEn: 'Triceps', nameEs: 'Tríceps', status: 'A'),
    Workgroup(id: 7, namePt: 'Abdômen', nameEn: 'Abdomen', nameEs: 'Abdomen', status: 'A'),
    Workgroup(id: 8, namePt: 'Glúteos', nameEn: 'Glutes', nameEs: 'Glúteos', status: 'A'),
    Workgroup(id: 9, namePt: 'Quadríceps', nameEn: 'Quadriceps', nameEs: 'Cuádriceps', status: 'A'),
    Workgroup(id: 10, namePt: 'Posterior de Coxa', nameEn: 'Hamstrings', nameEs: 'Isquiotibiales', status: 'A'),
    Workgroup(id: 11, namePt: 'Panturrilhas', nameEn: 'Calves', nameEs: 'Pantorrillas', status: 'A'),
    Workgroup(id: 12, namePt: 'Antebraço', nameEn: 'Forearm', nameEs: 'Antebrazo', status: 'A'),
    Workgroup(id: 13, namePt: 'Trapézio', nameEn: 'Trapezius', nameEs: 'Trapecio', status: 'A'),
    Workgroup(id: 14, namePt: 'Adutores', nameEn: 'Adductors', nameEs: 'Aductores', status: 'A'),
    Workgroup(id: 15, namePt: 'Abdutores', nameEn: 'Abductors', nameEs: 'Abductores', status: 'A'),
    Workgroup(id: 16, namePt: 'Corpo inteiro', nameEn: 'Full Body', nameEs: 'Cuerpo entero', status: 'A'),
    Workgroup(id: 17, namePt: 'Lombar', nameEn: 'Lower Back', nameEs: 'Zona Lumbar', status: 'A'),
  ];
}
