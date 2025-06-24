import 'package:treinadorpro/core/data/datasources/iremote_datasource.dart';
import 'package:treinadorpro/core/data/models/plan_template_model.dart';

abstract class IPlanTemplateRemoteDatasource extends IRemoteDatasource<PlanTemplateModel, int>{
  Future<List<PlanTemplateModel>> findAllActivePlan();
}