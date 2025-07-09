import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/api_generic_response.dart';
import 'package:treinadorpro/core/data/models/contract_response_model.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/contract_provider.dart';

import '../../../../core/widgets/pro_widget_info_alert_dialog.dart';
import '../../../woukoutsheet/presentation/pages/build_workout_sheet_page.dart';

class ActiveContractsPage extends ConsumerStatefulWidget {
  const ActiveContractsPage({super.key});

  @override
  ConsumerState<ActiveContractsPage> createState() => _ActiveContractsPageState();
}

class _ActiveContractsPageState extends ConsumerState<ActiveContractsPage> {

  late final AppConfig config;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    Future.microtask(() {
      _loadPage();
    });

  }

  void _loadPage() async {
    await ref.read(findAllActiveContractsViewModelProvider.notifier)
        .findAllActiveContracts();
  }

  Widget _buildListView(ApiGenericResponse<List<ContractResponseModel>> data){
    return ListView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: data.objectResponse.length,
    itemBuilder: (context, index) {
      final contractItem = data.objectResponse[index];
      return _buildCard(contractItem);
    });
  }

  Widget _buildDays(ContractResponseModel contract) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(contract.monday != null)
        Wrap(children: [
          Text("Segunda"),
          SizedBox(width: 8),
          Text(contract.monday!),
        ]),
      if(contract.tuesday != null)
        Wrap(children: [
          Text("Terça"),
          SizedBox(width: 8),
          Text(contract.tuesday!),
        ]),
      if(contract.wednesday != null)
        Wrap(children: [
          Text("Quarta"),
          SizedBox(width: 8),
          Text(contract.wednesday!),
        ]),
      if(contract.thursday != null)
        Wrap(children: [
          Text("Quinta"),
          SizedBox(width: 8),
          Text(contract.thursday!),
        ]),
      if(contract.friday != null)
        Wrap(children: [
          Text("Sexta"),
          SizedBox(width: 8),
          Text(contract.friday!),
        ]),
      if(contract.saturday != null)
        Wrap(children: [
          Text("Sábado"),
          SizedBox(width: 8),
          Text(contract.saturday!),
        ]),
      if(contract.sunday != null)
        Wrap(children: [
          Text("Domingo"),
          SizedBox(width: 8),
          Text(contract.sunday!),
        ]),
    ],
  );

  Widget _buildCard(ContractResponseModel contract) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          'Objetivo: ${contract.description}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${contract.currency} ${contract.price}'),
            Text('Pacote: ${contract.trainingPack.description}'),
            Text('Modalidade: ${contract.trainingPack.modality?.namePt}'),
            SizedBox(width: 8, height: 10),

            _buildDays(contract),
            SizedBox(width: 8, height: 10),

            Text('Contratado em ${contract.createdAt}'),
            SizedBox(width: 8, height: 10),

            Wrap(
              children: [
                SizedBox(width: 8, height: 40),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.group),
                  label: Text('Ver Todos'),
                ),

                SizedBox(width: 8, height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BuildWorkoutSheetPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.fitness_center),
                  label: Text('Montar Treino'),
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
          if(config.isDebugMode)
            ProWidgetInfoAlertDialog(
              title: "Page",
              text: "active_contratcs_page.dart",
            ),
        ],
      ),
      body: contractState.when(
          data: (data) => _buildListView(data),
          error: (e,_) => Center(child: Text("Error: $e"),),
          loading: ()=> Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
