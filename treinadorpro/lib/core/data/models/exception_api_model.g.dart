// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionApiModel _$ExceptionApiModelFromJson(Map<String, dynamic> json) =>
    ExceptionApiModel(
      (json['statusCode'] as num).toInt(),
      json['message'] as String,
      json['msgcode'] as String,
    );

Map<String, dynamic> _$ExceptionApiModelToJson(ExceptionApiModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'msgcode': instance.msgcode,
    };
