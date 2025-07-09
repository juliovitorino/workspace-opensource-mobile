// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractResponseModel _$ContractResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContractResponseModel(
      externalId: json['externalId'] as String,
      trainingPack: TrainingPackModel.fromJson(
          json['trainingPack'] as Map<String, dynamic>),
      description: json['description'] as String,
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ContractResponseModelToJson(
        ContractResponseModel instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'trainingPack': instance.trainingPack,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
      'duration': instance.duration,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
