
import 'package:treinadorpro/core/data/models/modality_model.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';
import 'package:treinadorpro/core/domain/entities/modality.dart';

import '../../domain/entities/training_pack.dart';

class TrainingPackModel extends TrainingPack {
  const TrainingPackModel({
    int? id,
    required String externalId,
    required UserModel personalUser,
    required Modality modality,
    required String description,
    required int durationDays,
    required int weeklyFrequency,
    required String notes,
    required double price,
    String? currency,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
    id: id,
    externalId: externalId,
    personalUser: personalUser,
    modality: modality,
    description: description,
    durationDays: durationDays,
    weeklyFrequency: weeklyFrequency,
    notes: notes,
    price: price,
    currency: currency,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory TrainingPackModel.fromJson(Map<String, dynamic> json) {
    return TrainingPackModel(
      id: json['id'],
      externalId: json['external_id'],
      personalUser: UserModel.fromJson(json['personal_user']),
      modality: ModalityModel.fromJson(json['modality']),
      description: json['description'],
      durationDays: json['duration_days'],
      weeklyFrequency: json['weekly_frequency'],
      notes: json['notes'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      status: json['status'] ?? 'A',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'external_id': externalId,
      'personal_user': (personalUser as UserModel).toJson(),
      'modality': (modality as ModalityModel).toJson(),
      'description': description,
      'duration_days': durationDays,
      'weekly_frequency': weeklyFrequency,
      'notes': notes,
      'price': price,
      'currency': currency,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
