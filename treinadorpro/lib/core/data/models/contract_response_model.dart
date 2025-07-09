import 'package:json_annotation/json_annotation.dart';

part 'contract_response_model.g.dart';

@JsonSerializable()
class ContractResponseModel {
  final String externalId;
  final String description;
  final double price;
  final String currency;
  final String? monday;
  final String? tuesday;
  final String? wednesday;
  final String? thursday;
  final String? friday;
  final String? saturday;
  final String? sunday;
  final String duration;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ContractResponseModel({
    required this.externalId,
    required this.description,
    required this.price,
    required this.currency,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    required this.duration,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ContractResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContractResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractResponseModelToJson(this);
}
