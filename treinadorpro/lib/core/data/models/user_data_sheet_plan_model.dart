import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/data/models/goal_model.dart';
import 'package:treinadorpro/core/data/models/modality_model.dart';
import 'package:treinadorpro/core/data/models/program_model.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

// part 'user_data_sheet_plan_model.g.dart';

// @JsonSerializable()
class UserDataSheetPlanModel {
  final ContractResponseModel contract;
  final ModalityModel? modality;
  final GoalModel? goal;
  final ProgramModel? program;
  final Map<String, List<UserWorkoutPlanModel>> plan;

  UserDataSheetPlanModel({
    required this.contract,
    this.modality,
    this.goal,
    this.program,
    required this.plan,
  });

  factory UserDataSheetPlanModel.fromJson(Map<String, dynamic> json) {
    final planMap = <String, List<UserWorkoutPlanModel>>{};

    (json['plan'] as Map<String, dynamic>).forEach((key, value) {
      planMap[key] = (value as List)
          .map((e) => UserWorkoutPlanModel.fromJson(e))
          .toList();
    });

    return UserDataSheetPlanModel(
      contract: ContractResponseModel.fromJson(json['contract']),
      modality: json['modality'] != null ? ModalityModel.fromJson(json['modality']) : null,
      goal: json['goal'] != null ? GoalModel.fromJson(json['goal']) :null,
      program: json['program'] != null ?ProgramModel.fromJson(json['program']):null,
      plan: planMap,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contract': contract.toJson(),
      'modality': modality?.toJson(),
      'goal': goal?.toJson(),
      'program': program?.toJson(),
      'plan': plan.map(
        (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
      ),
    };
  }
}
