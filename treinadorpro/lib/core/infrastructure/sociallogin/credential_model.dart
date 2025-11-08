
import 'package:json_annotation/json_annotation.dart';

part 'credential_model.g.dart';
enum SocialProvider { google, apple }

@JsonSerializable()
class CredentialModel {
  final SocialProvider provider;
  final String? idToken;
  final String? accessToken;
  final String? authorizationCode;
  final String? nonce;
  final String? codeVerifier;
  final Uri? redirectUri;

  CredentialModel({
    required this.provider,
    this.idToken,
    this.accessToken,
    this.authorizationCode,
    this.nonce,
    this.codeVerifier,
    this.redirectUri,
  });

  /// fromJson
  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialModelFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$CredentialModelToJson(this);
}
