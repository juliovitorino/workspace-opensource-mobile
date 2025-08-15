import 'package:isar/isar.dart';

import 'modality.dart';
import 'user.dart';

part 'training_pack.g.dart';

@Collection()
class TrainingPack {
  final Id? id;
  final String externalId;

  @ignore
  final User? personalTrainer;

  @ignore
  final Modality? modality;

  final String description;
  final int durationDays;
  final int weeklyFrequency;
  final String notes;
  final double price;
  final String? currency;
  final String? status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TrainingPack({
    this.id,
    required this.externalId,
    this.personalTrainer,
    this.modality,
    required this.description,
    required this.durationDays,
    required this.weeklyFrequency,
    required this.notes,
    required this.price,
    this.currency,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

}
