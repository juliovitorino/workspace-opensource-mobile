import 'package:treinadorpro/core/data/models/iname.dart';

class TrainingTimeModel implements IName{

  final String trainingTime;

  TrainingTimeModel(this.trainingTime);

  @override
  String getName() {
    return trainingTime;
  }

  @override
  String toString() => trainingTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TrainingTimeModel && runtimeType == other.runtimeType && trainingTime == other.trainingTime;

  @override
  int get hashCode => trainingTime.hashCode;
}