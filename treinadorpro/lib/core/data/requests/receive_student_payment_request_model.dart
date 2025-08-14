import 'package:json_annotation/json_annotation.dart';

part 'receive_student_payment_request_model.g.dart';

@JsonSerializable()
class ReceiveStudentPaymentRequestModel {
  @JsonKey(includeIfNull: false)
  final String? studentPaymentExternalId;

  final DateTime paymentDate;
  final double receivedAmount;
  final String paymentMethod;
  final String? comment;

  ReceiveStudentPaymentRequestModel({
    this.studentPaymentExternalId,
    required this.paymentDate,
    required this.receivedAmount,
    required this.paymentMethod,
    this.comment,
  });

  factory ReceiveStudentPaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiveStudentPaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReceiveStudentPaymentRequestModelToJson(this);
}
