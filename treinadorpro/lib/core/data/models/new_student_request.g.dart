// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_student_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewStudentRequest _$NewStudentRequestFromJson(Map<String, dynamic> json) =>
    NewStudentRequest(
      name: json['name'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$NewStudentRequestToJson(NewStudentRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthday': instance.birthday?.toIso8601String(),
      'phone': instance.phone,
      'email': instance.email,
      'gender': instance.gender,
    };
