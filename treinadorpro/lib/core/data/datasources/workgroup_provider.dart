import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/data/datasources/workgroup_remote_datasource.dart';
import 'package:treinadorpro/core/data/datasources/workgroup_repository.dart';
import 'package:treinadorpro/core/data/datasources/workgroup_view_list_model.dart';
import '../../provider/app_config_provider.dart';
import '../../provider/http_api_client_provider.dart';
import '../models/work_group_model.dart';
import 'iworkgroup_remote_datasource.dart';
import 'iworkgroup_repository.dart';

// remote datasource provider
final workgroupRemoteDatasourceProvider = Provider<IWorkgroupRemoteDatasource>((ref){
  final apiClient = ref.read(apiClientProvider);
  final appConfig = ref.watch(appConfigProvider);
  print('workgroupRemoteDatasourceProvider has been created');

  return WorkgroupRemoteDatasource(apiClient,appConfig);
});

// repository provider
final workgroupRepositoryProvider = Provider<IWorkgroupRepository>((ref){
  final datasource = ref.read(workgroupRemoteDatasourceProvider);
  print('workgroupRepositoryProvider has been created');
  return WorkgroupRepository(datasource);
});

// view model provider
final workgroupViewListModelProvider = StateNotifierProvider<WorkgroupViewListModel, AsyncValue<List<WorkgroupModel>>>((ref){
  final repository = ref.read(workgroupRepositoryProvider);
  return WorkgroupViewListModel(repository);

});