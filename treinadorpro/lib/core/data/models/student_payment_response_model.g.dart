// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentPaymentResponseModel _$StudentPaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    StudentPaymentResponseModel(
      externalId: json['externalId'] as String,
      contract: ContractResponseModel.fromJson(
          json['contract'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      dueDate: DateTime.parse(json['dueDate'] as String),
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$StudentPaymentResponseModelToJson(
        StudentPaymentResponseModel instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'contract': instance.contract,
      'amount': instance.amount,
      'dueDate': instance.dueDate.toIso8601String(),
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
