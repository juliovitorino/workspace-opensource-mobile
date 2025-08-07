// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModelRequest _$BookingModelRequestFromJson(Map<String, dynamic> json) =>
    BookingModelRequest(
      contractExternalId: json['contractExternalId'] as String,
      bookingList: (json['bookingList'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      trainingSession: UserTrainingSessionModel.fromJson(
          json['trainingSession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingModelRequestToJson(
        BookingModelRequest instance) =>
    <String, dynamic>{
      'contractExternalId': instance.contractExternalId,
      'bookingList':
          instance.bookingList.map((e) => e.toIso8601String()).toList(),
      'trainingSession': instance.trainingSession,
    };
