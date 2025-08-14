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
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      studentPaymentsTransactions:
          (json['studentPaymentsTransactions'] as List<dynamic>?)
              ?.map((e) => StudentPaymentsTransactionResponseModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$StudentPaymentResponseModelToJson(
        StudentPaymentResponseModel instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'contract': instance.contract,
      'amount': instance.amount,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'studentPaymentsTransactions': instance.studentPaymentsTransactions,
    };
