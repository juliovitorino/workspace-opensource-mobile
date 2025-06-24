import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/plan_template_model.dart';
import 'package:treinadorpro/core/domain/repositories/iplan_template_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class PlanTemplateListViewModel extends IViewModel<List<PlanTemplateModel>> {
  final IPlanTemplateRepository _planTemplateRepository;

  PlanTemplateListViewModel(this._planTemplateRepository)
    : super(_planTemplateRepository);

  Future<void> findAllActivePlan() async {
    try {
      print('plan_template_list_view_model :: ok');
      state = const AsyncValue.loading();
      final planList = await _planTemplateRepository.findAllActivePlan();
      state = AsyncValue.data(planList);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
