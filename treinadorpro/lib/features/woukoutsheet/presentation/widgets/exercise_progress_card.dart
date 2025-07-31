import 'package:flutter/material.dart';

class ExerciseProgressCard extends StatelessWidget {
  final int completed;
  final int total;
  final int trainingTime;

  const ExerciseProgressCard({
    super.key,
    required this.completed,
    required this.total,
    required this.trainingTime,
  });

  @override
  Widget build(BuildContext context) {
    double _percent = total > 0 ? completed / total : 0;
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time, size: 24),
                const SizedBox(width: 8),
                const Text(
                  'Tempo Estimado',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text('$trainingTime min'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.fitness_center, size: 24),
                const SizedBox(width: 8),
                const Text(
                  'Exercícios',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text('$completed / $total'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.percent, size: 24),
                const SizedBox(width: 8),
                const Text(
                  'Execução',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text('${(_percent*100).toStringAsFixed(0)}%', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: _percent,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }
}
