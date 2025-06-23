import 'package:treinadorpro/core/data/models/iname.dart';

class TrainingTimeModel implements IName{

  final String trainingTime;

  TrainingTimeModel(this.trainingTime);

  @override
  String getName() {
    return trainingTime;
  }

}