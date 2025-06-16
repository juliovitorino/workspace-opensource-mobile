// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_student_contract_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewStudentContractRequest _$CreateNewStudentContractRequestFromJson(
        Map<String, dynamic> json) =>
    CreateNewStudentContractRequest(
      personalTrainerExternalId: const UuidValueConverter()
          .fromJson(json['personalTrainerExternalId'] as String),
      trainingPackExternalId: _$JsonConverterFromJson<String, UuidValue>(
          json['trainingPackExternalId'], const UuidValueConverter().fromJson),
      existingStudentExternalId: json['existingStudentExternalId'] as String?,
      newStudent: json['newStudent'] == null
          ? null
          : NewStudentRequest.fromJson(
              json['newStudent'] as Map<String, dynamic>),
      trainingInfo: TrainingInfoRequest.fromJson(
          json['trainingInfo'] as Map<String, dynamic>),
      instalments: (json['instalments'] as List<dynamic>)
          .map((e) => InstalmentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateNewStudentContractRequestToJson(
        CreateNewStudentContractRequest instance) =>
    <String, dynamic>{
      'personalTrainerExternalId':
          const UuidValueConverter().toJson(instance.personalTrainerExternalId),
      'trainingPackExternalId': _$JsonConverterToJson<String, UuidValue>(
          instance.trainingPackExternalId, const UuidValueConverter().toJson),
      'existingStudentExternalId': instance.existingStudentExternalId,
      'newStudent': instance.newStudent,
      'trainingInfo': instance.trainingInfo,
      'instalments': instance.instalments,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
