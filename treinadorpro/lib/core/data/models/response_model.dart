import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/response.dart';

part 'response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseModel<T> extends Response{

  final String msgcode;
  final String mensagem;
  final T objectResponse;

  ResponseModel(this.msgcode, this.mensagem, this.objectResponse) : super(msgcode, mensagem);

  factory ResponseModel.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$ResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseModelToJson(this, toJsonT);

}