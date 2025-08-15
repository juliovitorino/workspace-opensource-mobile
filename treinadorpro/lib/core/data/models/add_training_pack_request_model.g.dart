// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_training_pack_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTrainingPackRequestModel _$AddTrainingPackRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddTrainingPackRequestModel(
      modalityId: (json['modalityId'] as num?)?.toInt(),
      description: json['description'] as String?,
      durationDays: (json['durationDays'] as num?)?.toInt(),
      weeklyFrequency: (json['weeklyFrequency'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$AddTrainingPackRequestModelToJson(
        AddTrainingPackRequestModel instance) =>
    <String, dynamic>{
      'modalityId': instance.modalityId,
      'description': instance.description,
      'durationDays': instance.durationDays,
      'weeklyFrequency': instance.weeklyFrequency,
      'notes': instance.notes,
      'price': instance.price,
      'currency': instance.currency,
    };
