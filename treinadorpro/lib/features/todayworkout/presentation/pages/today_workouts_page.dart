import 'package:flutter/material.dart';
import 'package:treinadorpro/features/woukoutsheet/presentation/pages/workout_sheet_page.dart';

class TodayWorkoutsPage extends StatelessWidget {
  final List<TodayWorkout> workouts = [
    TodayWorkout(
      time: '07:00',
      studentName: 'João Pedro',
      type: 'Treino Inferior',
      plan: 'Plano Trimestral',
      location: 'Academia Central',
      confirmed: true,
    ),
    TodayWorkout(
      time: '09:00',
      studentName: 'Carla Lima',
      type: 'Cardio Funcional',
      plan: 'Plano Mensal',
      location: 'Parque das Águas',
      confirmed: false,
    ),
    TodayWorkout(
      time: '18:00',
      studentName: 'Rodrigo Silva',
      type: 'Superior',
      plan: 'Online',
      location: 'Google Meet',
      confirmed: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Treinos de Hoje')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${workout.time} - ${workout.studentName}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        workout.confirmed
                            ? Icons.check_circle
                            : Icons.help_outline,
                        color: workout.confirmed ? Colors.green : Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text('${workout.type} • ${workout.plan}'),
                  Text('📍 ${workout.location}'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.chat),
                        label: Text('WhatsApp'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                      SizedBox(width: 8),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WorkoutSheetPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.assignment),
                        label: Text('Abrir Ficha'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TodayWorkout {
  final String time;
  final String studentName;
  final String type;
  final String plan;
  final String location;
  final bool confirmed;

  TodayWorkout({
    required this.time,
    required this.studentName,
    required this.type,
    required this.plan,
    required this.location,
    required this.confirmed,
  });
}
