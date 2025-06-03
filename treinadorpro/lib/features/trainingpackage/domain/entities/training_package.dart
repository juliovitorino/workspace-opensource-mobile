class TrainingPackage {
  late final String description;
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
      description: 'Pilates',
      durationDays: 120,
      weeklyFrequency: 5,
      price: 399.00,
      notes: 'Acesso total à academia, suporte online',
    ),
    TrainingPackage(
      description: 'Yoga',
      durationDays: 120,
      weeklyFrequency: 5,
      price: 129.00,
      notes: 'Direito a 1 sessão de massoterapia',
    ),
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
