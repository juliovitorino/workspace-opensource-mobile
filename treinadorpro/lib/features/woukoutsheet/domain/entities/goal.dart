import 'package:isar/isar.dart';

part 'goal.g.dart';

@Collection()
class Goal {
  final Id? id;
  final String namePt;
  final String nameEn;
  final String nameEs;
  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Goal({
    this.id,
    required this.namePt,
    required this.nameEn,
    required this.nameEs,
    required this.status,
    this.createdAt,
    this.updatedAt

  });

  static List<Goal> goals = [
    Goal(id: 1, namePt: 'Hipertrofia', nameEn: 'Hypertrophy', nameEs: 'Hipertrofia', status: 'A'),
    Goal(id: 2, namePt: 'Perda de Peso', nameEn: 'Weight Loss', nameEs: 'Pérdida de Peso', status: 'A'),
    Goal(id: 3, namePt: 'Emagrecimento', nameEn: 'Slimming', nameEs: 'Adelgazamiento', status: 'A'),
    Goal(id: 4, namePt: 'Definição Muscular', nameEn: 'Muscle Definition', nameEs: 'Definición Muscular', status: 'A'),
    Goal(id: 5, namePt: 'Condicionamento Físico', nameEn: 'Physical Conditioning', nameEs: 'Condicionamiento Físico', status: 'A'),
    Goal(id: 6, namePt: 'Ganho de Força', nameEn: 'Strength Gain', nameEs: 'Ganancia de Fuerza', status: 'A'),
    Goal(id: 7, namePt: 'Resistência Cardiorrespiratória', nameEn: 'Cardiorespiratory Endurance', nameEs: 'Resistencia Cardiorrespiratoria', status: 'A'),
    Goal(id: 8, namePt: 'Flexibilidade', nameEn: 'Flexibility', nameEs: 'Flexibilidad', status: 'A'),
    Goal(id: 9, namePt: 'Melhora da Mobilidade', nameEn: 'Mobility Improvement', nameEs: 'Mejora de la Movilidad', status: 'A'),
    Goal(id: 10, namePt: 'Reabilitação Física', nameEn: 'Physical Rehabilitation', nameEs: 'Rehabilitación Física', status: 'A'),
    Goal(id: 11, namePt: 'Prevenção de Lesões', nameEn: 'Injury Prevention', nameEs: 'Prevención de Lesiones', status: 'A'),
    Goal(id: 12, namePt: 'Manutenção da Saúde', nameEn: 'Health Maintenance', nameEs: 'Mantenimiento de la Salud', status: 'A'),
    Goal(id: 13, namePt: 'Preparação para Corridas', nameEn: 'Race Preparation', nameEs: 'Preparación para Carreras', status: 'A'),
    Goal(id: 14, namePt: 'Aumento de Energia', nameEn: 'Energy Boost', nameEs: 'Aumento de Energía', status: 'A'),
  ];
}
