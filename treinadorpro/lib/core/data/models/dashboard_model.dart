import 'package:json_annotation/json_annotation.dart';


part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {

  final int activeStudentContract;
  final double overdueAmountContracts;
  final int totalTrainingPack;
  final int totalTodayWorkout;
  final double totalAmountReceivedMonth;
  final double totalFutureRevenueAmount;

  DashboardModel(this.activeStudentContract, this.overdueAmountContracts,
      this.totalAmountReceivedMonth, this.totalTodayWorkout,
      this.totalTrainingPack, this.totalFutureRevenueAmount);


  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

}