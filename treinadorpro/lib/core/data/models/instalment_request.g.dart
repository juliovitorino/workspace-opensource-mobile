// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instalment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstalmentRequest _$InstalmentRequestFromJson(Map<String, dynamic> json) =>
    InstalmentRequest(
      duedate: json['duedate'] == null
          ? null
          : DateTime.parse(json['duedate'] as String),
      currency: json['currency'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InstalmentRequestToJson(InstalmentRequest instance) =>
    <String, dynamic>{
      'duedate': instance.duedate?.toIso8601String(),
      'currency': instance.currency,
      'amount': instance.amount,
    };
