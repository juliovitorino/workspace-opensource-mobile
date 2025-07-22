import 'package:treinadorpro/core/data/models/training_pack_model.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';

class ContractResponseModel {
  final String externalId;
  final TrainingPackModel trainingPack;
  final UserModel studentUser;
  final String description;
  final String? workoutSite;
  final double price;
  final String currency;
  final String? monday;
  final String? tuesday;
  final String? wednesday;
  final String? thursday;
  final String? friday;
  final String? saturday;
  final String? sunday;
  final String duration;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ContractResponseModel({
    required this.externalId,
    required this.trainingPack,
    required this.studentUser,
    required this.description,
    this.workoutSite,
    required this.price,
    required this.currency,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    required this.duration,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ContractResponseModel.fromJson(Map<String, dynamic> json) {
    return ContractResponseModel(
      externalId: json['externalId'] as String,
      trainingPack: TrainingPackModel.fromJson(json['trainingPack']),
      studentUser: UserModel.fromJson(json['studentUser']),
      description: json['description'] as String,
      workoutSite: json['workoutSite'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      monday: json['monday'] as String?,
      tuesday: json['tuesday'] as String?,
      wednesday: json['wednesday'] as String?,
      thursday: json['thursday'] as String?,
      friday: json['friday'] as String?,
      saturday: json['saturday'] as String?,
      sunday: json['sunday'] as String?,
      duration: json['duration'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'externalId': externalId,
      'trainingPack': trainingPack.toJson(),
      'studentUser': studentUser.toJson(),
      'description': description,
      'workoutSite': workoutSite,
      'price': price,
      'currency': currency,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'duration': duration,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
