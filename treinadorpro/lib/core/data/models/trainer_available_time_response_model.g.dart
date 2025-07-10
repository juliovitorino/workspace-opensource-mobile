// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_available_time_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainerAvailableTimeResponseModel _$TrainerAvailableTimeResponseModelFromJson(
        Map<String, dynamic> json) =>
    TrainerAvailableTimeResponseModel(
      trainer: json['trainer'] == null
          ? null
          : UserModel.fromJson(json['trainer'] as Map<String, dynamic>),
      monTotal: (json['monTotal'] as num?)?.toInt(),
      tueTotal: (json['tueTotal'] as num?)?.toInt(),
      wedTotal: (json['wedTotal'] as num?)?.toInt(),
      thuTotal: (json['thuTotal'] as num?)?.toInt(),
      friTotal: (json['friTotal'] as num?)?.toInt(),
      satTotal: (json['satTotal'] as num?)?.toInt(),
      sunTotal: (json['sunTotal'] as num?)?.toInt(),
      mondayAvailableTimes: (json['mondayAvailableTimes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tuesdayAvailableTimes: (json['tuesdayAvailableTimes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      wednesdayAvailableTimes:
          (json['wednesdayAvailableTimes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      thursdayAvailableTimes: (json['thursdayAvailableTimes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fridayAvailableTimes: (json['fridayAvailableTimes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      saturdayAvailableTimes: (json['saturdayAvailableTimes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sundayAvailableTimes: (json['sundayAvailableTimes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$TrainerAvailableTimeResponseModelToJson(
        TrainerAvailableTimeResponseModel instance) =>
    <String, dynamic>{
      'trainer': instance.trainer,
      'monTotal': instance.monTotal,
      'tueTotal': instance.tueTotal,
      'wedTotal': instance.wedTotal,
      'thuTotal': instance.thuTotal,
      'friTotal': instance.friTotal,
      'satTotal': instance.satTotal,
      'sunTotal': instance.sunTotal,
      'mondayAvailableTimes': instance.mondayAvailableTimes,
      'tuesdayAvailableTimes': instance.tuesdayAvailableTimes,
      'wednesdayAvailableTimes': instance.wednesdayAvailableTimes,
      'thursdayAvailableTimes': instance.thursdayAvailableTimes,
      'fridayAvailableTimes': instance.fridayAvailableTimes,
      'saturdayAvailableTimes': instance.saturdayAvailableTimes,
      'sundayAvailableTimes': instance.sundayAvailableTimes,
    };
