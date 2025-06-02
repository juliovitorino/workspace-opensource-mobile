import 'package:flutter/material.dart';

class WorkoutSheetPage extends StatelessWidget {
  final String studentName = 'João Pedro';
  final String goal = 'Hipertrofia';
  final String plan = 'Plano Trimestral';
  final String date = '31/05/2025';
  final String observation = 'Evitar agachamento profundo devido a dor no joelho esquerdo.';

  final List<WorkoutExercise> exercises = [
    WorkoutExercise(
      name: 'Agachamento Livre',
      sets: 3,
      reps: 12,
      weight: '40kg',
      rest: '60s',
      notes: 'Manter postura ereta',
      completed: false,
    ),
    WorkoutExercise(
      name: 'Leg Press',
      sets: 4,
      reps: 10,
      weight: '100kg',
      rest: '90s',
      notes: 'Não estender completamente o joelho',
      completed: true,
    ),
    WorkoutExercise(
      name: 'Cadeira Extensora',
      sets: 3,
      reps: 15,
      weight: '35kg',
      rest: '60s',
      notes: '',
      completed: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ficha de Treino')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(studentName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('$plan • Objetivo: $goal'),
          Text('Data do treino: $date'),
          SizedBox(height: 12),
          if (observation.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('📌 Observação: $observation'),
            ),
          Text('Exercícios', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ...exercises.map((e) => _buildExerciseCard(e)).toList(),
          SizedBox(height: 24),
          Wrap(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.play_circle),
                label: Text('Iniciar'),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              ),
              SizedBox(height: 10, width: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.check_circle),
                label: Text('Concluir Treino'),
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              )
            ],
          )

        ],
      ),
    );
  }

  Widget _buildExerciseCard(WorkoutExercise e) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(
                  e.completed ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: e.completed ? Colors.green : Colors.grey,
                )
              ],
            ),
            SizedBox(height: 4),
            Text('${e.sets}x${e.reps} • ${e.weight} • Descanso: ${e.rest}'),
            if (e.notes.isNotEmpty)
              Text('Nota: ${e.notes}', style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 6),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit),
                label: Text('Editar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutExercise {
  final String name;
  final int sets;
  final int reps;
  final String weight;
  final String rest;
  final String notes;
  final bool completed;

  WorkoutExercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.weight,
    required this.rest,
    required this.notes,
    required this.completed,
  });
}
