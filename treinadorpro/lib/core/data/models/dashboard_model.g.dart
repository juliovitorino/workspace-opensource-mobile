// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      (json['activeStudentContract'] as num).toInt(),
      (json['overdueAmountContracts'] as num).toDouble(),
      (json['totalAmountReceivedMonth'] as num).toDouble(),
      (json['totalTodayWorkout'] as num).toInt(),
      (json['totalTrainingPack'] as num).toInt(),
      (json['totalFutureRevenueAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'activeStudentContract': instance.activeStudentContract,
      'overdueAmountContracts': instance.overdueAmountContracts,
      'totalTrainingPack': instance.totalTrainingPack,
      'totalTodayWorkout': instance.totalTodayWorkout,
      'totalAmountReceivedMonth': instance.totalAmountReceivedMonth,
      'totalFutureRevenueAmount': instance.totalFutureRevenueAmount,
    };
