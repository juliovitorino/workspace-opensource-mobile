import 'package:json_annotation/json_annotation.dart';

part 'find_last_load_exercise_response_model.g.dart';

@JsonSerializable()
class FindLastLoadExerciseResponseModel {
  @JsonKey(name: 'setNumber')
  final int? setNumber;

  @JsonKey(name: 'reps')
  final int? reps;

  @JsonKey(name: 'weight')
  final int? weight;

  FindLastLoadExerciseResponseModel({
    this.setNumber,
    this.reps,
    this.weight,
  });

  factory FindLastLoadExerciseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FindLastLoadExerciseResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FindLastLoadExerciseResponseModelToJson(this);
}
