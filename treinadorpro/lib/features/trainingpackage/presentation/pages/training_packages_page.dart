import 'package:flutter/material.dart';
import 'package:treinadorpro/core/domain/entities/pack_training_entity.dart';
import 'package:treinadorpro/features/trainingpackage/presentation/widgets/pro_widget_card_pack_training.dart';

class TrainingPackagesPage extends StatelessWidget {

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
        itemCount: PackTrainingEntity.packTrainings.length,
        itemBuilder: (context, index) {
          final pkg = PackTrainingEntity.packTrainings[index];
          return ProWidgetCardPackTraining(pkg: pkg);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para página de adicionar pacote
        },
        tooltip: 'Adicionar novo pacote',
        child: Icon(Icons.add),
      ),
    );
  }
}

