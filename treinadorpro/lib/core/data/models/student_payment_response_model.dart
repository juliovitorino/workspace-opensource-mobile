import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';

part 'student_payment_response_model.g.dart';

@JsonSerializable()
class StudentPaymentResponseModel {
  final String externalId;
  final ContractResponseModel contract;
  final double amount;
  final DateTime dueDate;
  final DateTime? paymentDate;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentPaymentResponseModel({
    required this.externalId,
    required this.contract,
    required this.amount,
    required this.dueDate,
    this.paymentDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });


  factory StudentPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StudentPaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentPaymentResponseModelToJson(this);
}
