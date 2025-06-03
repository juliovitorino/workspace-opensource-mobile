class TrainingPackage {
  final String description;
  final int durationDays;
  final int weeklyFrequency;
  final double price;
  final String notes;

  TrainingPackage({
    required this.description,
    required this.durationDays,
    required this.weeklyFrequency,
    required this.price,
    required this.notes,
  });

  static List<TrainingPackage> packages = [
    TrainingPackage(
      description: 'Plano Mensal Intermediário',
      durationDays: 30,
      weeklyFrequency: 3,
      price: 199.00,
      notes: 'Acesso total à academia, suporte online',
    ),
    TrainingPackage(
      description: 'Emagrecimento Master',
      durationDays: 120,
      weeklyFrequency: 18,
      price: 499.00,
      notes: 'Treinamento personalizado + nutricionista',
    ),
    TrainingPackage(
      description: 'Plano Trimestral Avançado',
      durationDays: 90,
      weeklyFrequency: 5,
      price: 499.00,
      notes: 'Treinamento personalizado + nutricionista',
    ),
    TrainingPackage(
      description: 'Plano Light',
      durationDays: 30,
      weeklyFrequency: 2,
      price: 149.00,
      notes: 'Ideal para iniciantes',
    ),
    TrainingPackage(
      description: 'HIIT',
      durationDays: 90,
      weeklyFrequency: 2,
      price: 149.00,
      notes: 'Ideal para iniciantes',
    ),
    TrainingPackage(
      description: 'Jump',
      durationDays: 90,
      weeklyFrequency: 2,
      price: 112.00,
      notes: 'Ideal para qualquer idade',
    ),
  ];

}
