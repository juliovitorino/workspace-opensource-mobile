import 'package:json_annotation/json_annotation.dart';
import 'student_payment_response_model.dart';

part 'student_payments_transaction_response_model.g.dart';

@JsonSerializable()
class StudentPaymentsTransactionResponseModel {
  final int? id;
  final String? externalId;
  final StudentPaymentResponseModel? studentPayment;
  final DateTime? paymentDate;
  final double? receivedAmount;
  final String? paymentMethod;
  final String? comment;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StudentPaymentsTransactionResponseModel({
    this.id,
    this.externalId,
    this.studentPayment,
    this.paymentDate,
    this.receivedAmount,
    this.paymentMethod,
    this.comment,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory StudentPaymentsTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StudentPaymentsTransactionResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentPaymentsTransactionResponseModelToJson(this);
}
