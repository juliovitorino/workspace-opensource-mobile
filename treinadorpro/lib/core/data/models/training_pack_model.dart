
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
    print('training_pack_model :: parsing fromJson');
    return TrainingPackModel(
      id: json['id'],
      externalId: json['externalId'],
      personalUser: UserModel.fromJson(json['personalTrainer']),
      modality: ModalityModel.fromJson(json['modality']),
      description: json['description'],
      durationDays: json['durationDays'],
      weeklyFrequency: json['weeklyFrequency'],
      notes: json['notes'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      status: json['status'] ?? 'A',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'externalId': externalId,
      'personalUser': (personalUser as UserModel).toJson(),
      'modality': (modality as ModalityModel).toJson(),
      'description': description,
      'durationDays': durationDays,
      'weeklyFrequency': weeklyFrequency,
      'notes': notes,
      'price': price,
      'currency': currency,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
