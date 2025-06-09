import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/core/data/models/page_result_response_model.dart';
import 'package:treinadorpro/core/domain/entities/training_pack.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/provider/training_pack_provider.dart';
import 'package:treinadorpro/core/viewmodel/training_pack_page_result_view_model.dart';
import 'package:treinadorpro/core/widgets/pro_widget_info_alert_dialog.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/widgets/pro_widget_card_pack_training.dart';

class TrainingPackagePage extends ConsumerStatefulWidget {
  const TrainingPackagePage({super.key});

  @override
  ConsumerState<TrainingPackagePage> createState() =>
      _TrainingPackagePageState();
}

class _TrainingPackagePageState extends ConsumerState<TrainingPackagePage> {
  late final AppConfig config;

  List<TrainingPack>? packTrainingEntityList;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);

    Future.microtask(() {
      ref.read(trainingPackPageResultViewModelProvider.notifier).findAllTrainingPackByPersonalExternalId('39c0fd19-dbd2-4c74-8104-7105ca159c7b', 1, 2);

    });
    // copy from mocked if environment is dev
    packTrainingEntityList = TrainingPack.trainingPacks.toList();
  }

  // Widget _buildMockedListView() {
  //   return ListView.builder(
  //     padding: const EdgeInsets.all(12),
  //     itemCount: packTrainingEntityList!.length,
  //     itemBuilder: (context, index) {
  //       final pkg = packTrainingEntityList![index];
  //       return ProWidgetCardPackTraining(pkg: pkg);
  //     },
  //   );
  // }

  Widget _buildListView(PageResultResponseModel pageResultResponseModel){
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: pageResultResponseModel.content.length,
        itemBuilder: (context, index){
          final trainingPackItem = pageResultResponseModel.content[index];
          return ProWidgetCardPackTraining(pkg: trainingPackItem);
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    final trainingPackPageResultState = ref.watch(trainingPackPageResultViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacotes de Treino'),
        actions: [
          if (config.isDebugMode)
            ProWidgetInfoAlertDialog(title: "Page", text: "training_packages_page.dart",),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navegar para AddTrainingPackagePage (a ser implementado)
            },
          ),
        ],
      ),
      body: trainingPackPageResultState.when(
          data: (pageResult) => _buildListView(pageResult),
          error: (e, _) => Center(child: Text('Error: $e')),
          loading: () => Center(child: CircularProgressIndicator())
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Just testing...
            packTrainingEntityList?.add(
              TrainingPack(
                externalId: 'dssdfsdfdsf',
                description: 'bbbb',
                durationDays: 1,
                weeklyFrequency: 1,
                currency: 'BRL',
                price: 1,
                notes: 'sldkfskdf',
                status: 'A',
              ),
            );
          });
        },
        tooltip: 'Adicionar novo pacote',
        child: Icon(Icons.add),
      ),
    );
  }
}
