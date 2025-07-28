import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';

class WorkoutGroupCard extends StatefulWidget {
  final String groupName;
  final List<UserWorkoutPlanModel> exercises;
  final void Function(UserWorkoutPlanModel exercise)? onDelete;
  final void Function(List<UserWorkoutPlanModel> exerciseList)? onAddExerciseList;
  final void Function(List<UserWorkoutPlanModel> exerciseList)? onDeleteExerciseList;
  final bool? deleteButtonVisible;
  final bool? trainingButtonVisible;

  const WorkoutGroupCard({
    super.key,
    required this.groupName,
    required this.exercises,
    this.onDelete,
    this.onAddExerciseList,
    this.onDeleteExerciseList,
    this.deleteButtonVisible = true,
    this.trainingButtonVisible = false
  });

  @override
  State<WorkoutGroupCard> createState() => _WorkoutGroupCardState();
}

class _WorkoutGroupCardState extends State<WorkoutGroupCard> {
  bool _isShowDeleteIcon = false;
  bool _isShowExercisesIcon = true;
  bool _isShowDeleteGroupIcon = true;
  bool _applyGreenColor = false;

  Color? _trainingColor = Colors.grey[200];

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
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: _trainingColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // workgroup name and expanded button
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

                // view icon
                _isShowExercisesIcon
                    ? IconButton(
                        onPressed: () => setState(() {
                          _isShowExercisesIcon = false;
                          _isShowDeleteGroupIcon = false;
                        }),
                        icon: Icon(Icons.arrow_upward),
                      )
                    : IconButton(
                        onPressed: () => setState(() {
                          _isShowExercisesIcon = true;
                          _isShowDeleteGroupIcon = true;
                        }),
                        icon: Icon(Icons.arrow_downward),
                      ),

                // training button
                if(widget.trainingButtonVisible!)
                  IconButton(
                    onPressed: () => setState(() {
                      _applyGreenColor = !_applyGreenColor;
                      if(_applyGreenColor){
                        _trainingColor = Colors.green[200];
                        widget.onAddExerciseList?.call(widget.exercises);
                      } else {
                        _trainingColor = Colors.grey[200];
                        widget.onDeleteExerciseList?.call(widget.exercises);
                      }

                    }),
                    icon: Icon(Icons.check),
                  ),

              ],
            ),

            // Fitness, estimated time and delete button
            Row(
              children: [
                Icon(Icons.fitness_center),
                Text(
                  '${widget.exercises.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 8),
                Icon(Icons.access_time),
                Text(
                  '$totalCombined min',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 8),
                if (_isShowDeleteGroupIcon && widget.deleteButtonVisible!)
                  IconButton(
                    onPressed: () => setState(() {
                      _isShowDeleteIcon = !_isShowDeleteIcon;
                    }),
                    icon: Icon(Icons.delete),
                  ),
              ],
            ),


            // Exercise List
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${e.qtySeries}x${e.qtyReps} • Tempo: ${e.executionTime}m • descanso: ${e.restTime}m',
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
