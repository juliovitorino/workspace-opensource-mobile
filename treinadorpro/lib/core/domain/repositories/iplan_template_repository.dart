import 'package:treinadorpro/core/data/models/plan_template_model.dart';
import 'package:treinadorpro/core/domain/repositories/repository.dart';

abstract class IPlanTemplateRepository extends Repository<PlanTemplateModel, int>{
  Future<List<PlanTemplateModel>> findAllActivePlan();
}