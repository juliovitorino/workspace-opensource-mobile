import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

class WorkoutGroupCard extends StatelessWidget {
  final String groupName;
  final List<UserWorkoutPlanModel> exercises;
  final void Function(UserWorkoutPlanModel exercise)? onDelete;

  const WorkoutGroupCard({
    super.key,
    required this.groupName,
    required this.exercises,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            ...exercises.map(
              (e) => ListTile(
                leading: IconButton(
                  onPressed: () => onDelete?.call(e),
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
                title: Text(
                  e.customExercise ?? e.exercise?.namePt ?? 'Exercício',
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${e.qtySeries}x${e.qtyReps} • Executar em ${e.executionTime}m • descanso: ${e.restTime}m',
                    ),
                    SizedBox(height: 8,),
                    Chip(label: Text(e.executionMethod.toString()))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
