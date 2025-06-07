import '../../domain/entities/personal_feature.dart';

class PersonalFeatureModel extends PersonalFeature {
  const PersonalFeatureModel({
    super.id,
    super.personalUserUuid,
    super.register,
    super.place,
    super.experience,
    super.specialty,
    super.monPeriod,
    super.tuePeriod,
    super.wedPeriod,
    super.thuPeriod,
    super.friPeriod,
    super.satPeriod,
    super.sunPeriod,
    super.status,
    super.createdAt,
    super.updatedAt,
  });

  factory PersonalFeatureModel.fromJson(Map<String, dynamic> json) {
    return PersonalFeatureModel(
      id: json['id'],
      personalUserUuid: json['personalUserUuid'],
      register: json['register'],
      place: json['place'],
      experience: json['experience'],
      specialty: json['specialty'],
      monPeriod: json['monPeriod'],
      tuePeriod: json['tuePeriod'],
      wedPeriod: json['wedPeriod'],
      thuPeriod: json['thuPeriod'],
      friPeriod: json['friPeriod'],
      satPeriod: json['satPeriod'],
      sunPeriod: json['sunPeriod'],
      status: json['status'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'personalUserUuid': personalUserUuid,
      'register': register,
      'place': place,
      'experience': experience,
      'specialty': specialty,
      'monPeriod': monPeriod,
      'tuePeriod': tuePeriod,
      'wedPeriod': wedPeriod,
      'thuPeriod': thuPeriod,
      'friPeriod': friPeriod,
      'satPeriod': satPeriod,
      'sunPeriod': sunPeriod,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  PersonalFeature toEntity() {
    return PersonalFeature(
      id: id,
      personalUserUuid: personalUserUuid,
      register: register,
      place: place,
      experience: experience,
      specialty: specialty,
      monPeriod: monPeriod,
      tuePeriod: tuePeriod,
      wedPeriod: wedPeriod,
      thuPeriod: thuPeriod,
      friPeriod: friPeriod,
      satPeriod: satPeriod,
      sunPeriod: sunPeriod,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory PersonalFeatureModel.fromEntity(PersonalFeature entity) {
    return PersonalFeatureModel(
      id: entity.id,
      personalUserUuid: entity.personalUserUuid,
      register: entity.register,
      place: entity.place,
      experience: entity.experience,
      specialty: entity.specialty,
      monPeriod: entity.monPeriod,
      tuePeriod: entity.tuePeriod,
      wedPeriod: entity.wedPeriod,
      thuPeriod: entity.thuPeriod,
      friPeriod: entity.friPeriod,
      satPeriod: entity.satPeriod,
      sunPeriod: entity.sunPeriod,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
