class WorkGroup {
  final int id;
  final String namePt;
  final String nameEn;
  final String nameEs;
  final String status;

  const WorkGroup({
    required this.id,
    required this.namePt,
    required this.nameEn,
    required this.nameEs,
    required this.status,
  });

  static List<WorkGroup> workGroups = [
    WorkGroup(id: 1, namePt: 'Peitoral', nameEn: 'Chest', nameEs: 'Pectorales', status: 'A'),
    WorkGroup(id: 2, namePt: 'Costas', nameEn: 'Back', nameEs: 'Espalda', status: 'A'),
    WorkGroup(id: 3, namePt: 'Ombros', nameEn: 'Shoulders', nameEs: 'Hombros', status: 'A'),
    WorkGroup(id: 5, namePt: 'Bíceps', nameEn: 'Biceps', nameEs: 'Bíceps', status: 'A'),
    WorkGroup(id: 6, namePt: 'Tríceps', nameEn: 'Triceps', nameEs: 'Tríceps', status: 'A'),
    WorkGroup(id: 7, namePt: 'Abdômen', nameEn: 'Abdomen', nameEs: 'Abdomen', status: 'A'),
    WorkGroup(id: 8, namePt: 'Glúteos', nameEn: 'Glutes', nameEs: 'Glúteos', status: 'A'),
    WorkGroup(id: 9, namePt: 'Quadríceps', nameEn: 'Quadriceps', nameEs: 'Cuádriceps', status: 'A'),
    WorkGroup(id: 10, namePt: 'Posterior de Coxa', nameEn: 'Hamstrings', nameEs: 'Isquiotibiales', status: 'A'),
    WorkGroup(id: 11, namePt: 'Panturrilhas', nameEn: 'Calves', nameEs: 'Pantorrillas', status: 'A'),
    WorkGroup(id: 12, namePt: 'Antebraço', nameEn: 'Forearm', nameEs: 'Antebrazo', status: 'A'),
    WorkGroup(id: 13, namePt: 'Trapézio', nameEn: 'Trapezius', nameEs: 'Trapecio', status: 'A'),
    WorkGroup(id: 14, namePt: 'Adutores', nameEn: 'Adductors', nameEs: 'Aductores', status: 'A'),
    WorkGroup(id: 15, namePt: 'Abdutores', nameEn: 'Abductors', nameEs: 'Abductores', status: 'A'),
    WorkGroup(id: 16, namePt: 'Corpo inteiro', nameEn: 'Full Body', nameEs: 'Cuerpo entero', status: 'A'),
    WorkGroup(id: 17, namePt: 'Lombar', nameEn: 'Lower Back', nameEs: 'Zona Lumbar', status: 'A'),
  ];
}
