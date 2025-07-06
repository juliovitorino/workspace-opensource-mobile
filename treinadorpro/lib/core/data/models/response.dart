import 'package:json_annotation/json_annotation.dart';

// part 'response.g.dart';
// @JsonSerializable()
class Response {
  final String msgcode;
  final String mensagem;

  const Response(this.msgcode, this.mensagem);

  //
  // factory Response.fromJson(Map<String, dynamic> json) =>
  //     _$ResponseFromJson(json);
  //
  // Map<String, dynamic> toJson() =>
  //     _$ResponseToJson(this);

}