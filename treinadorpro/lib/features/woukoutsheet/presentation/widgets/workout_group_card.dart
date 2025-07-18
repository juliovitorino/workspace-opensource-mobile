import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

class WorkoutGroupCard extends StatefulWidget {
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
  State<WorkoutGroupCard> createState() => _WorkoutGroupCardState();
}

class _WorkoutGroupCardState extends State<WorkoutGroupCard> {
  bool _isShowDeleteIcon = false;
  bool _isShowExercisesIcon = true;
  bool _isShowDeleteGroupIcon = true;

  @override
  Widget build(BuildContext context) {
    int totalCombined = widget.exercises.fold<int>(
      0,
          (sum, item) =>
      sum +
          (int.tryParse(item.restTime ?? '0') ?? 0) +
          (int.tryParse(item.executionTime ?? '0') ?? 0),
    );

    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                // Workgoup name
                Expanded(
                  child: Text(
                    widget.groupName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      // Total qty exercises
                      // const SizedBox(width: 8),
                      Icon(Icons.fitness_center),
                      Text(
                        '${widget.exercises.length}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                    ),
                    Row(
                      children: [

                        // total time exercises
                        // const SizedBox(width: 8),
                        Icon(Icons.access_time),
                        Text(
                          '$totalCombined min',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),





                // delete icon
                const SizedBox(width: 8),
                if(_isShowDeleteGroupIcon)
                  IconButton(
                    onPressed: () => setState(() {
                      _isShowDeleteIcon = !_isShowDeleteIcon;
                    }),
                    icon: Icon(Icons.delete),
                  ),

                // view icon
                _isShowExercisesIcon
                    ? IconButton(
                        onPressed: () => setState(() {_isShowExercisesIcon = false; _isShowDeleteGroupIcon = false;}),
                        icon: Icon(Icons.arrow_upward),
                      )
                    : IconButton(
                        onPressed: () => setState(() {_isShowExercisesIcon = true;_isShowDeleteGroupIcon = true;}),
                        icon: Icon(Icons.arrow_downward),
                      ),
              ],
            ),
            SizedBox(height: 12),
            if (_isShowExercisesIcon)
              ...widget.exercises.map(
                (e) => ListTile(
                  leading: _isShowDeleteIcon
                      ? IconButton(
                          onPressed: () => widget.onDelete?.call(e),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        )
                      : null,
                  title: Text(
                    e.customExercise ?? e.exercise?.namePt ?? 'Exercício',
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${e.qtySeries}x${e.qtyReps} • Executar em ${e.executionTime}m • descanso: ${e.restTime}m',
                      ),
                      SizedBox(height: 8),
                      Chip(label: Text(e.executionMethod.toString())),
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
