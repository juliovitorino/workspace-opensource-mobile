import 'package:flutter/material.dart';

import '../domain/entities/training_package.dart';

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
        itemCount: TrainingPackage.packages.length,
        itemBuilder: (context, index) {
          final pkg = TrainingPackage.packages[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(pkg.description, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${pkg.durationDays} dias • ${pkg.weeklyFrequency}x/semana'),
                  Text(pkg.notes),
                  Text('Valor: R\$ ${pkg.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green[700])),
                ],
              ),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Abrir página de edição do pacote
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para página de adicionar pacote
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar novo pacote',
      ),
    );
  }
}

