import 'package:json_annotation/json_annotation.dart';

part 'instalment_request.g.dart';

/// Instalment
@JsonSerializable()
class InstalmentRequest {
  final DateTime? duedate;
  final String? currency;
  final double? amount; // BigDecimal in Java maps to double in Dart for simplicity

  InstalmentRequest({
    this.duedate,
    this.currency,
    this.amount,
  });

  factory InstalmentRequest.fromJson(Map<String, dynamic> json) => _$InstalmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InstalmentRequestToJson(this);
}