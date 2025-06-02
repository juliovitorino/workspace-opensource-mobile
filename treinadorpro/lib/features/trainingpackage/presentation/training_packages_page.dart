import 'package:flutter/material.dart';

class TrainingPackagesPage extends StatelessWidget {
  final List<TrainingPackage> packages = [
    TrainingPackage(
      name: 'Plano Mensal Intermediário',
      durationDays: 30,
      weeklyFrequency: 3,
      price: 199.00,
      description: 'Acesso total à academia, suporte online',
    ),
    TrainingPackage(
      name: 'Plano Trimestral Avançado',
      durationDays: 90,
      weeklyFrequency: 5,
      price: 499.00,
      description: 'Treinamento personalizado + nutricionista',
    ),
    TrainingPackage(
      name: 'Plano Light',
      durationDays: 30,
      weeklyFrequency: 2,
      price: 149.00,
      description: 'Ideal para iniciantes',
    ),
  ];

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
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final pkg = packages[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(pkg.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${pkg.durationDays} dias • ${pkg.weeklyFrequency}x/semana'),
                  Text(pkg.description),
                  Text('Valor: R\$ ${pkg.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green[700])),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person_add),
                    label: Text('Adicionar aluno ao plano'),
                  ),
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

class TrainingPackage {
  final String name;
  final int durationDays;
  final int weeklyFrequency;
  final double price;
  final String description;

  TrainingPackage({
    required this.name,
    required this.durationDays,
    required this.weeklyFrequency,
    required this.price,
    required this.description,
  });
}
