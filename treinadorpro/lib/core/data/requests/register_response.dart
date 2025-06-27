import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse{

  final String externalUserId;
  final String code;

  RegisterResponse(this.externalUserId, this.code);


  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

}