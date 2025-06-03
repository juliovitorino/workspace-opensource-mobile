import '../../domain/entities/available_time.dart';

class AvailableTimeModel extends AvailableTime {
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AvailableTimeModel({
    int? id,
    required int personalUserId,
    required int daysOfWeek,
    required String dayTime,
    bool? available,
    required String status,
    this.createdAt,
    this.updatedAt,
  }) : super(
    id: id,
    personalUserId: personalUserId,
    daysOfWeek: daysOfWeek,
    dayTime: dayTime,
    available: available,
    status: status,
  );

  factory AvailableTimeModel.fromJson(Map<String, dynamic> json) {
    return AvailableTimeModel(
      id: json['id'],
      personalUserId: json['personal_user_id'],
      daysOfWeek: json['days_of_week'],
      dayTime: json['day_time'],
      available: json['available'],
      status: json['status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'personal_user_id': personalUserId,
      'days_of_week': daysOfWeek,
      'day_time': dayTime,
      'available': available,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
