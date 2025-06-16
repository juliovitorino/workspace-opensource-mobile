import 'package:json_annotation/json_annotation.dart';

part 'external_id_response_model.g.dart';

@JsonSerializable()
class ExternalIdResponseModel{

  final String externalId;
  ExternalIdResponseModel(this.externalId);


  factory ExternalIdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ExternalIdResponseModelToJson(this);

}