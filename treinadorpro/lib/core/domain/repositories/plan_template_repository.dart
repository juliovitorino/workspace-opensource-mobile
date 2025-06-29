import 'package:treinadorpro/core/data/datasources/iplan_template_remote_datasource.dart';
import 'package:treinadorpro/core/data/models/plan_template_model.dart';
import 'package:treinadorpro/core/domain/repositories/iplan_template_repository.dart';

class PlanTemplateRepository implements IPlanTemplateRepository{

  final IPlanTemplateRemoteDatasource _planTemplateRemoteDatasource;
  PlanTemplateRepository(this._planTemplateRemoteDatasource);

  @override
  Future<List<PlanTemplateModel>> findAllActivePlan() async {
    print('plan_template_repository :: ok');
    return await _planTemplateRemoteDatasource.findAllActivePlan();
  }

  @override
  Future<PlanTemplateModel> findById(String token, int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<PlanTemplateModel> findByUUID(String token, String id) {
    // TODO: implement findByUUID
    throw UnimplementedError();
  }

}