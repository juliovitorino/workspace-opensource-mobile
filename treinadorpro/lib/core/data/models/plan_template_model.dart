import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/iname.dart';

part 'plan_template_model.g.dart';

@JsonSerializable()
class PlanTemplateModel implements IName{
  final int? id;
  final String externalId;
  final String description;
  final double price;
  final double amountDiscount;
  final String paymentFrequency;
  final int qtyContractAllowed;
  final int qtyUserStudentAllowed;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  PlanTemplateModel({
    this.id,
    required this.externalId,
    required this.description,
    required this.price,
    required this.amountDiscount,
    required this.paymentFrequency,
    required this.qtyContractAllowed,
    required this.qtyUserStudentAllowed,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  factory PlanTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$PlanTemplateModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanTemplateModelToJson(this);

  @override
  String getName() {
    return this.description;
  }
}
