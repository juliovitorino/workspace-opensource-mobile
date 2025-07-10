import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/user_model.dart';

part 'trainer_available_time_response_model.g.dart';

@JsonSerializable()
class TrainerAvailableTimeResponseModel {
  final UserModel? trainer;
  final int? monTotal;
  final int? tueTotal;
  final int? wedTotal;
  final int? thuTotal;
  final int? friTotal;
  final int? satTotal;
  final int? sunTotal;
  final List<String>? mondayAvailableTimes;
  final List<String>? tuesdayAvailableTimes;
  final List<String>? wednesdayAvailableTimes;
  final List<String>? thursdayAvailableTimes;
  final List<String>? fridayAvailableTimes;
  final List<String>? saturdayAvailableTimes;
  final List<String>? sundayAvailableTimes;

  TrainerAvailableTimeResponseModel({
    this.trainer,
    this.monTotal,
    this.tueTotal,
    this.wedTotal,
    this.thuTotal,
    this.friTotal,
    this.satTotal,
    this.sunTotal,
    this.mondayAvailableTimes,
    this.tuesdayAvailableTimes,
    this.wednesdayAvailableTimes,
    this.thursdayAvailableTimes,
    this.fridayAvailableTimes,
    this.saturdayAvailableTimes,
    this.sundayAvailableTimes,
  });

  factory TrainerAvailableTimeResponseModel.fromJson(Map<String, dynamic> json) => _$TrainerAvailableTimeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainerAvailableTimeResponseModelToJson(this);

  //
  // factory TrainerAvailableTimeResponseModel.fromJson(Map<String, dynamic> json) {
  //   print('parse iniciado');
  //   final trainerAvailableTime = TrainerAvailableTimeResponseModel(
  //     trainer: json['trainer'] != null ? UserModel.fromJson(json['trainer']) : null,
  //     monTotal: json['monTotal'],
  //     tueTotal: json['tueTotal'],
  //     wedTotal: json['wedTotal'],
  //     thuTotal: json['thuTotal'],
  //     friTotal: json['friTotal'],
  //     satTotal: json['satTotal'],
  //     sunTotal: json['sunTotal'],
  //     mondayAvailableTimes: (json['mondayAvailableTimes'] as List?)?.cast<String>(),
  //     tuesdayAvailableTimes: (json['tuesdayAvailableTimes'] as List?)?.cast<String>(),
  //     wednesdayAvailableTimes: (json['wednesdayAvailableTimes'] as List?)?.cast<String>(),
  //     thursdayAvailableTimes: (json['thursdayAvailableTimes'] as List?)?.cast<String>(),
  //     fridayAvailableTimes: (json['fridayAvailableTimes'] as List?)?.cast<String>(),
  //     saturdayAvailableTimes: (json['saturdayAvailableTimes'] as List?)?.cast<String>(),
  //     sundayAvailableTimes: (json['sundayAvailableTimes'] as List?)?.cast<String>(),
  //   );
  //   print('parse finalizado');
  //
  //   return trainerAvailableTime;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'trainer': trainer?.toJson(),
  //     'monTotal': monTotal,
  //     'tueTotal': tueTotal,
  //     'wedTotal': wedTotal,
  //     'thuTotal': thuTotal,
  //     'friTotal': friTotal,
  //     'satTotal': satTotal,
  //     'sunTotal': sunTotal,
  //     'mondayAvailableTimes': mondayAvailableTimes,
  //     'tuesdayAvailableTimes': tuesdayAvailableTimes,
  //     'wednesdayAvailableTimes': wednesdayAvailableTimes,
  //     'thursdayAvailableTimes': thursdayAvailableTimes,
  //     'fridayAvailableTimes': fridayAvailableTimes,
  //     'saturdayAvailableTimes': saturdayAvailableTimes,
  //     'sundayAvailableTimes': sundayAvailableTimes,
  //   };
  // }
}
