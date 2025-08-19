import 'package:json_annotation/json_annotation.dart';

part 'contract_schedule_modifier_request_model.g.dart';

@JsonSerializable()
class ContractScheduleModifierRequestModel {
  @JsonKey(name: 'contractExternalId')
  final String contractExternalId;

  @JsonKey(name: 'monday')
  final String? monday;

  @JsonKey(name: 'tuesday')
  final String? tuesday;

  @JsonKey(name: 'wednesday')
  final String? wednesday;

  @JsonKey(name: 'thursday')
  final String? thursday;

  @JsonKey(name: 'friday')
  final String? friday;

  @JsonKey(name: 'saturday')
  final String? saturday;

  @JsonKey(name: 'sunday')
  final String? sunday;

  const ContractScheduleModifierRequestModel({
    required this.contractExternalId,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory ContractScheduleModifierRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ContractScheduleModifierRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractScheduleModifierRequestModelToJson(this);
}
