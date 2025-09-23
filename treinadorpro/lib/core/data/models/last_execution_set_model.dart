import 'package:json_annotation/json_annotation.dart';

part 'last_execution_set_model.g.dart';


@JsonSerializable()
class LastExecutionSetModel {

  final int set;
  final int weight;
  final int reps;
  final String elapseTime;

  LastExecutionSetModel({required this.set, required this.weight, required this.reps, required this.elapseTime});

  /// fromJson
  factory LastExecutionSetModel.fromJson(Map<String, dynamic> json) =>
      _$LastExecutionSetModelFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$LastExecutionSetModelToJson(this);


}