// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_student_payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveStudentPaymentRequestModel _$ReceiveStudentPaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    ReceiveStudentPaymentRequestModel(
      studentPaymentExternalId: json['studentPaymentExternalId'] as String?,
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      receivedAmount: (json['receivedAmount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ReceiveStudentPaymentRequestModelToJson(
    ReceiveStudentPaymentRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('studentPaymentExternalId', instance.studentPaymentExternalId);
  val['paymentDate'] = instance.paymentDate.toIso8601String();
  val['receivedAmount'] = instance.receivedAmount;
  val['paymentMethod'] = instance.paymentMethod;
  val['comment'] = instance.comment;
  return val;
}
