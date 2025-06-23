
import 'package:json_annotation/json_annotation.dart';

part 'training_info_request.g.dart';

/// TrainingInfo
@JsonSerializable()
class TrainingInfoRequest {
  final String? goal;
  final DateTime? startDate;
  final String? monday;
  final String? tuesday;
  final String? wednesday;
  final String? thursday;
  final String? friday;
  final String? saturday;
  final String? sunday;
  final String? duration;

  TrainingInfoRequest({
    this.goal,
    this.startDate,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.duration,
  });

  factory TrainingInfoRequest.fromJson(Map<String, dynamic> json) => _$TrainingInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingInfoRequestToJson(this);
}
