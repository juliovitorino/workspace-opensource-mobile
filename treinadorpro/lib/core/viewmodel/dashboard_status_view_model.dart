import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/dashboard_model.dart';
import 'package:treinadorpro/core/domain/repositories/idashboard_repository.dart';
import 'package:treinadorpro/core/viewmodel/iview_model.dart';

class DashboardStatusViewModel extends IViewModel<ApiGenericResponse<DashboardModel>> {

  final IDashboardRepository _repository;
  DashboardStatusViewModel(this._repository):super(_repository);


  static const String module = 'dashboard_status_view_model';

  Future<void> dashboardStatus() async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final apiResponse = await _repository.dashboardStatus();
      state = AsyncValue.data(apiResponse);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }


}