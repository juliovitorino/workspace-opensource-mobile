import 'package:json_annotation/json_annotation.dart';

part 'exception_api_model.g.dart';

@JsonSerializable()
class ExceptionApiModel {

  final int statusCode;
  final String message;
  final String msgcode;

  ExceptionApiModel(this.statusCode, this.message, this.msgcode);


  factory ExceptionApiModel.fromJson(Map<String, dynamic> json) => _$ExceptionApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExceptionApiModelToJson(this);
}