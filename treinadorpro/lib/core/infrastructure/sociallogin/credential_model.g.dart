// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialModel _$CredentialModelFromJson(Map<String, dynamic> json) =>
    CredentialModel(
      provider: $enumDecode(_$SocialProviderEnumMap, json['provider']),
      idToken: json['idToken'] as String?,
      accessToken: json['accessToken'] as String?,
      authorizationCode: json['authorizationCode'] as String?,
      nonce: json['nonce'] as String?,
      codeVerifier: json['codeVerifier'] as String?,
      redirectUri: json['redirectUri'] == null
          ? null
          : Uri.parse(json['redirectUri'] as String),
    );

Map<String, dynamic> _$CredentialModelToJson(CredentialModel instance) =>
    <String, dynamic>{
      'provider': _$SocialProviderEnumMap[instance.provider]!,
      'idToken': instance.idToken,
      'accessToken': instance.accessToken,
      'authorizationCode': instance.authorizationCode,
      'nonce': instance.nonce,
      'codeVerifier': instance.codeVerifier,
      'redirectUri': instance.redirectUri?.toString(),
    };

const _$SocialProviderEnumMap = {
  SocialProvider.google: 'google',
  SocialProvider.apple: 'apple',
};
