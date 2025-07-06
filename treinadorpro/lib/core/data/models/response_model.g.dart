// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<T> _$ResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResponseModel<T>(
      json['msgcode'] as String,
      json['mensagem'] as String,
      fromJsonT(json['objectResponse']),
    );

Map<String, dynamic> _$ResponseModelToJson<T>(
  ResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'msgcode': instance.msgcode,
      'mensagem': instance.mensagem,
      'objectResponse': toJsonT(instance.objectResponse),
    };
