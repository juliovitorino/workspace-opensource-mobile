import 'package:json_annotation/json_annotation.dart';

part 'find_last_load_exercise_request_model.g.dart';

@JsonSerializable()
class FindLastLoadExerciseRequestModel {
  @JsonKey(name: 'contractExternalId')
  final String contractExternalId;

  @JsonKey(name: 'exerciseExternalId')
  final String? exerciseExternalId;

  @JsonKey(name: 'customExercise')
  final String? customExercise;

  FindLastLoadExerciseRequestModel({
    required this.contractExternalId,
    this.exerciseExternalId,
    this.customExercise,
  });

  factory FindLastLoadExerciseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FindLastLoadExerciseRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FindLastLoadExerciseRequestModelToJson(this);
}
