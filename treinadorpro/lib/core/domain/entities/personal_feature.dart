class PersonalFeature {
  final int? id;
  final String? personalUserUuid;
  final String? register;
  final String? place;
  final String? experience;
  final String? specialty;
  final String? monPeriod;
  final String? tuePeriod;
  final String? wedPeriod;
  final String? thuPeriod;
  final String? friPeriod;
  final String? satPeriod;
  final String? sunPeriod;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PersonalFeature({
    this.id,
    this.personalUserUuid,
    this.register,
    this.place,
    this.experience,
    this.specialty,
    this.monPeriod,
    this.tuePeriod,
    this.wedPeriod,
    this.thuPeriod,
    this.friPeriod,
    this.satPeriod,
    this.sunPeriod,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  static List<PersonalFeature> personalFeatures = [
    PersonalFeature(
      id: 1,
      personalUserUuid: 'a7b3d901-55b6-47b0-a823-abc123456789',
      register: 'CREF123456-RJ',
      place: 'Rio de Janeiro',
      experience: '10 anos atuando com treinamento funcional e musculação.',
      specialty: 'Emagrecimento e reabilitação',
      monPeriod: '06:00-12:00',
      tuePeriod: '08:00-14:00',
      wedPeriod: '06:00-12:00',
      thuPeriod: '08:00-14:00',
      friPeriod: '06:00-12:00',
      satPeriod: '08:00-10:00',
      sunPeriod: '',
      status: 'A',
      createdAt: DateTime.parse('2024-01-15T09:00:00'),
      updatedAt: DateTime.parse('2024-06-01T11:30:00'),
    ),
    PersonalFeature(
      id: 2,
      personalUserUuid: 'b9f2c7a5-1234-4e55-b6b3-987654321abc',
      register: 'CREF789456-SP',
      place: 'São Paulo',
      experience: '5 anos focando em treinamento de alta performance.',
      specialty: 'Hipertrofia e condicionamento físico',
      monPeriod: '14:00-20:00',
      tuePeriod: '14:00-20:00',
      wedPeriod: '14:00-20:00',
      thuPeriod: '14:00-20:00',
      friPeriod: '14:00-18:00',
      satPeriod: '',
      sunPeriod: '',
      status: 'A',
      createdAt: DateTime.parse('2023-05-10T10:00:00'),
      updatedAt: DateTime.parse('2025-05-15T14:45:00'),
    ),
    PersonalFeature(
      id: 3,
      personalUserUuid: 'f6d8a3e2-1111-4444-aaaa-0000bbbcccdd',
      register: 'CREF654321-MG',
      place: 'Belo Horizonte',
      experience: '7 anos atuando com grupos especiais (idosos e gestantes).',
      specialty: 'Alongamento e bem-estar',
      monPeriod: '07:00-11:00',
      tuePeriod: '07:00-11:00',
      wedPeriod: '',
      thuPeriod: '07:00-11:00',
      friPeriod: '07:00-11:00',
      satPeriod: '09:00-11:00',
      sunPeriod: '',
      status: 'A',
      createdAt: DateTime.parse('2022-08-20T08:15:00'),
      updatedAt: DateTime.parse('2025-04-12T10:00:00'),
    ),
  ];


}
