import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String name;
  final String email;
  final String phone;
  final String birthday;
  final String passwd;
  final String passwdCheck;
  final String plan;
  final String apiKey;

  RegisterRequest(
    this.name,
    this.email,
    this.phone,
    this.birthday,
    this.passwd,
    this.passwdCheck,
    this.plan,
    this.apiKey,
  );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
