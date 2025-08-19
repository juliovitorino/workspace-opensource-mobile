// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_schedule_modifier_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractScheduleModifierRequestModel
    _$ContractScheduleModifierRequestModelFromJson(Map<String, dynamic> json) =>
        ContractScheduleModifierRequestModel(
          contractExternalId: json['contractExternalId'] as String,
          monday: json['monday'] as String?,
          tuesday: json['tuesday'] as String?,
          wednesday: json['wednesday'] as String?,
          thursday: json['thursday'] as String?,
          friday: json['friday'] as String?,
          saturday: json['saturday'] as String?,
          sunday: json['sunday'] as String?,
        );

Map<String, dynamic> _$ContractScheduleModifierRequestModelToJson(
        ContractScheduleModifierRequestModel instance) =>
    <String, dynamic>{
      'contractExternalId': instance.contractExternalId,
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };
