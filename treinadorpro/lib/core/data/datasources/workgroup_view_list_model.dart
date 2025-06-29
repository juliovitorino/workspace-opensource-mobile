import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/work_group_model.dart';
import 'iworkgroup_repository.dart';

class WorkgroupViewListModel extends StateNotifier<AsyncValue<List<WorkgroupModel>>>{

  final IWorkgroupRepository _workgroupRepository;
  WorkgroupViewListModel(this._workgroupRepository) : super(const AsyncValue.loading());

  static const String module = 'workgroup_view_list_model';

  Future<void> findAllActiveWorkgroups() async {
    try {
      print('$module :: ok');
      state = const AsyncValue.loading();
      final workgroupsList = await _workgroupRepository.findAllActiveWorkgroups();
      state = AsyncValue.data(workgroupsList);

    } catch (e, st){
      state = AsyncValue.error(e, st);
    }
  }

}