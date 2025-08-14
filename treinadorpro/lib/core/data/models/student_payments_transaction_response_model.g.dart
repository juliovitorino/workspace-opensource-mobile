// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_payments_transaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentPaymentsTransactionResponseModel
    _$StudentPaymentsTransactionResponseModelFromJson(
            Map<String, dynamic> json) =>
        StudentPaymentsTransactionResponseModel(
          id: (json['id'] as num?)?.toInt(),
          externalId: json['externalId'] as String?,
          studentPayment: json['studentPayment'] == null
              ? null
              : StudentPaymentResponseModel.fromJson(
                  json['studentPayment'] as Map<String, dynamic>),
          paymentDate: json['paymentDate'] == null
              ? null
              : DateTime.parse(json['paymentDate'] as String),
          receivedAmount: (json['receivedAmount'] as num?)?.toDouble(),
          paymentMethod: json['paymentMethod'] as String?,
          comment: json['comment'] as String?,
          status: json['status'] as String?,
          createdAt: json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
          updatedAt: json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
        );

Map<String, dynamic> _$StudentPaymentsTransactionResponseModelToJson(
        StudentPaymentsTransactionResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'studentPayment': instance.studentPayment,
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'receivedAmount': instance.receivedAmount,
      'paymentMethod': instance.paymentMethod,
      'comment': instance.comment,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
