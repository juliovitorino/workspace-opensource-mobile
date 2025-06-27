// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanTemplateModel _$PlanTemplateModelFromJson(Map<String, dynamic> json) =>
    PlanTemplateModel(
      id: (json['id'] as num?)?.toInt(),
      externalId: json['externalId'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      amountDiscount: (json['amountDiscount'] as num).toDouble(),
      paymentFrequency: json['paymentFrequency'] as String,
      qtyContractAllowed: (json['qtyContractAllowed'] as num).toInt(),
      qtyUserStudentAllowed: (json['qtyUserStudentAllowed'] as num).toInt(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PlanTemplateModelToJson(PlanTemplateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'description': instance.description,
      'price': instance.price,
      'amountDiscount': instance.amountDiscount,
      'paymentFrequency': instance.paymentFrequency,
      'qtyContractAllowed': instance.qtyContractAllowed,
      'qtyUserStudentAllowed': instance.qtyUserStudentAllowed,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
