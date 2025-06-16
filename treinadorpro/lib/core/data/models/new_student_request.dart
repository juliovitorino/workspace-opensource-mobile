import 'package:json_annotation/json_annotation.dart';

part 'new_student_request.g.dart';

/// NewStudent
@JsonSerializable()
class NewStudentRequest {
  final String? name;
  final DateTime? birthday;
  final String? phone;
  final String? email;
  final String? gender;

  NewStudentRequest({
    this.name,
    this.birthday,
    this.phone,
    this.email,
    this.gender,
  });

  factory NewStudentRequest.fromJson(Map<String, dynamic> json) => _$NewStudentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewStudentRequestToJson(this);
}
