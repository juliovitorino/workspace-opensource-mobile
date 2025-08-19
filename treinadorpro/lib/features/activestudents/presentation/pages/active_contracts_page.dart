import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/contract_token_storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/storage_service.dart';
import 'package:treinadorpro/core/infrastructure/localstorage/user_data_sheet_plan_storage_service.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/contract_provider.dart';
import 'package:treinadorpro/core/utils/date_utils.dart';
import 'package:treinadorpro/core/widgets/pro_widget_custom_loading_indicator.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_row.dart';
import 'package:treinadorpro/core/widgets/pro_widget_section_title.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';

import '../../../../core/utils/global.dart';
import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../woukoutsheet/presentation/pages/build_workout_sheet_page.dart';
import '../../../woukoutsheet/presentation/pages/workout_sheet_detail_page.dart';
import 'contract_schedule_edit_page.dart';

class ActiveContractsPage extends ConsumerStatefulWidget {
  const ActiveContractsPage({super.key});

  @override
  ConsumerState<ActiveContractsPage> createState() => _ActiveContractsPageState();
}

class _ActiveContractsPageState extends ConsumerState<ActiveContractsPage> {
  late final AppConfig config;

  final StorageService<String> _contractTokenStorage = ContractTokenStorageService();
  final UserDataSheetPlanStorageService _userDataSheetPlanStorageService =
      UserDataSheetPlanStorageService();

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    Future.microtask(() {
      _loadPage();
    });
  }

  void _loadPage() async {
    await ref.read(findAllActiveContractsViewModelProvider.notifier).findAllActiveContracts();
  }

  Widget _buildListView(ApiGenericResponse<List<ContractResponseModel>> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: data.objectResponse.length,
      itemBuilder: (context, index) {
        final contractItem = data.objectResponse[index];
        return _buildCard(contractItem);
      },
    );
  }

  Widget _buildCard(ContractResponseModel contract) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: ProWidgetSectionTitle(title: contract.studentUser.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProWidgetInfoRow(label: 'Contrato', value: contract.externalId),
            ProWidgetInfoRow(label: 'Objetivo', value: contract.description),
            ProWidgetInfoRow(
              label: 'Valor combinado',
              value: '${contract.currency} \$ ${contract.price.toStringAsFixed(2)}',
            ),
            ProWidgetInfoRow(label: 'Pacote', value: contract.trainingPack.description),
            ProWidgetInfoRow(label: 'Modalidade', value: contract.trainingPack.modality!.namePt),
            ProWidgetInfoRow(label: 'Local do Treino', value: contract.workoutSite!),
            ProWidgetInfoRow(label: 'Contratado em', value: getDateTimeToDT(contract.createdAt)),
            ProWidgetInfoRow(
              label: 'Status',
              value: '...',
              widget: ProWidgetTag(
                text: decodeStatus(contract.status) ?? contract.status,
                borderColor: Colors.green,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 8, height: 10),

            buildDays(contract),
            SizedBox(width: 8, height: 10),

            // action buttons
            Wrap(
              children: [
                // training data sheet
                SizedBox(width: 8, height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    _contractTokenStorage.save(contract.externalId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WorkoutSheetDetailPage(),
                      ), //WorkoutSheetPage()
                    );
                  },
                  icon: Icon(Icons.assignment),
                  label: Text('Ver Ficha de Treino'),
                ),

                // build training data sheet
                SizedBox(width: 8, height: 40),
                ElevatedButton.icon(
                  onPressed: () async {
                    _contractTokenStorage.save(contract.externalId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => BuildWorkoutSheetPage()),
                    );
                  },
                  icon: Icon(Icons.fitness_center),
                  label: Text('Montar Treino'),
                ),

                SizedBox(width: 8, height: 40),
                ElevatedButton.icon(
                  onPressed: () async =>
                      _userDataSheetPlanStorageService.clear(contract.externalId),
                  icon: Icon(Icons.delete_forever),
                  label: Text('Apagar Rascunho Treino'),
                ),

                // edit training schedule
                SizedBox(width: 8, height: 40),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.attach_money),
                  label: Text('Financeiro'),
                ),
              ],
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contractState = ref.watch(findAllActiveContractsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Contratos"),
        actions: [
          if (config.isDebugMode)
            ProWidgetInfoAlertDialog(title: "Page", text: "active_contratcs_page.dart"),
        ],
      ),
      body: contractState.when(
        data: (data) => _buildListView(data),
        error: (e, _) => Center(child: Text("Error: $e")),
        loading: () => Center(child: ProWidgetCustomLoadingIndicator()),
      ),
    );
  }
}
