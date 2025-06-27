// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      json['name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['birthday'] as String,
      json['passwd'] as String,
      json['passwdCheck'] as String,
      json['plan'] as String,
      json['apiKey'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'passwd': instance.passwd,
      'passwdCheck': instance.passwdCheck,
      'plan': instance.plan,
      'apiKey': instance.apiKey,
    };
