class Program {
  final int id;
  final String namePt;
  final String nameEn;
  final String nameEs;
  final String status;

  const Program({
    required this.id,
    required this.namePt,
    required this.nameEn,
    required this.nameEs,
    required this.status,
  });

  static List<Program> programs = [
    Program(id: 1, namePt: 'Treino ABC - A', nameEn: 'Workout ABC - A', nameEs: 'Entrenamiento A', status: 'A'),
    Program(id: 2, namePt: 'Treino ABC - B', nameEn: 'Workout ABC - B', nameEs: 'Entrenamiento B', status: 'A'),
    Program(id: 3, namePt: 'Treino ABC - C', nameEn: 'Workout ABC - C', nameEs: 'Entrenamiento C', status: 'A'),
    Program(id: 4, namePt: 'Treino ABCD - A', nameEn: 'Workout ABCD - A', nameEs: 'Entrenamiento A', status: 'A'),
    Program(id: 4, namePt: 'Treino ABCD - B', nameEn: 'Workout ABCD - B', nameEs: 'Entrenamiento B', status: 'A'),
    Program(id: 4, namePt: 'Treino ABCD - C', nameEn: 'Workout ABCD - C', nameEs: 'Entrenamiento C', status: 'A'),
    Program(id: 4, namePt: 'Treino ABCD - D', nameEn: 'Workout ABCD - D', nameEs: 'Entrenamiento D', status: 'A'),
    Program(id: 99999, namePt: 'Personalizado', nameEn: 'Customized', nameEs: 'Personalizado', status: 'A'),
  ];
}
