import 'package:json_annotation/json_annotation.dart';

part 'add_training_pack_request_model.g.dart';

@JsonSerializable()
class AddTrainingPackRequestModel {
  @JsonKey(name: 'modalityId')
  final int? modalityId;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'durationDays')
  final int? durationDays;

  @JsonKey(name: 'weeklyFrequency')
  final int? weeklyFrequency;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'price')
  final double? price;

  @JsonKey(name: 'currency')
  final String? currency;

  AddTrainingPackRequestModel({
    this.modalityId,
    this.description,
    this.durationDays,
    this.weeklyFrequency,
    this.notes,
    this.price,
    this.currency,
  });

  /// fromJson
  factory AddTrainingPackRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddTrainingPackRequestModelFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$AddTrainingPackRequestModelToJson(this);
}
