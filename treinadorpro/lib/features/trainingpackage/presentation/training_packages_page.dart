import 'package:flutter/material.dart';
import 'package:treinadorpro/core/domain/entities/pack_training_entity.dart';

import '../../newstudent/presentation/pages/new_student_page.dart';

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
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(pkg.description, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${pkg.durationDays} dias • ${pkg.weeklyFrequency}x/semana'),
                  Text(pkg.notes),
                  Text('R\$ ${pkg.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold, fontSize: 16.0)),
                  Text('Você tem 5 alunos neste pacote'),
                  SizedBox(width: 8, height: 8),

                  Wrap(
                    children:[
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => NewStudentPage()),
                          );
                        },
                        icon: Icon(Icons.person_add),
                        label: Text('Novo Aluno'),
                      ),

                      SizedBox(width: 8, height: 40),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.group),
                        label: Text('Ver Todos'),
                      ),

                      SizedBox(width: 8, height: 40),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        label: Text('Editar'),
                      ),
                    ]
                  ),
                ],
              ),
              onTap: () {},
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

