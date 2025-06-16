
import 'package:json_annotation/json_annotation.dart';

part 'training_info_request.g.dart';

/// TrainingInfo
@JsonSerializable()
class TrainingInfoRequest {
  final String? goal;
  final DateTime? startDate;
  final String? startTime;
  final String? duration;
  final List<String>? weekdays;

  TrainingInfoRequest({
    this.goal,
    this.startDate,
    this.startTime,
    this.duration,
    this.weekdays,
  });

  factory TrainingInfoRequest.fromJson(Map<String, dynamic> json) => _$TrainingInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingInfoRequestToJson(this);
}
