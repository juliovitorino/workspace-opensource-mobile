import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treinadorpro/core/domain/entities/pack_training.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/widgets/pro_widget_card_pack_training.dart';

class TrainingPackagePage extends StatefulWidget {
  const TrainingPackagePage({super.key});

  @override
  State<TrainingPackagePage> createState() => _TrainingPackagePageState();
}

class _TrainingPackagePageState extends State<TrainingPackagePage> {

  List<PackTrainingEntity>? packTrainingEntityList;

  @override
  void initState() {
    // copy from mocked if environment is dev
    packTrainingEntityList = PackTrainingEntity.packTrainings.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacotes de Treino'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navegar para AddTrainingPackagePage (a ser implementado)
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: packTrainingEntityList!.length,
        itemBuilder: (context, index) {
          final pkg = packTrainingEntityList![index];
          return ProWidgetCardPackTraining(pkg: pkg);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

            // Just testing...
            packTrainingEntityList?.add(PackTrainingEntity(
                externalId: 'dssdfsdfdsf',
                description: 'bbbb',
                durationDays: 1,
                weeklyFrequency: 1,
                currency: 'BRL',
                price: 1,
                notes: 'sldkfskdf',
                status: 'A'));
          });
        },
        tooltip: 'Adicionar novo pacote',
        child: Icon(Icons.add),
      ),
    );
  }
}

