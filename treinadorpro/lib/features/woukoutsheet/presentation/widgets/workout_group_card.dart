import 'package:flutter/material.dart';
import 'package:treinadorpro/core/data/models/user_workout_plan_model.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';

class WorkoutGroupCard extends StatefulWidget {
  final String groupName;
  final List<UserWorkoutPlanModel> exercises;
  final void Function(UserWorkoutPlanModel exercise)? onDelete;
  final void Function(List<UserWorkoutPlanModel> exerciseList)? onAddExerciseList;
  final void Function(List<UserWorkoutPlanModel> exerciseList)? onDeleteExerciseList;
  final void Function(String)? onAddOrderMap;
  final void Function(String)? onDeleteOrderMap;

  final bool? deleteButtonVisible;
  final bool? trainingButtonVisible;
  final bool? showExercises;
  final int? order;

  const WorkoutGroupCard({
    super.key,
    required this.groupName,
    required this.exercises,
    this.onDelete,
    this.onAddExerciseList,
    this.onDeleteExerciseList,
    this.deleteButtonVisible = true,
    this.trainingButtonVisible = false,
    this.showExercises = true,
    this.order = 0,
    this.onAddOrderMap,
    this.onDeleteOrderMap,
  });

  @override
  State<WorkoutGroupCard> createState() => _WorkoutGroupCardState();
}

class _WorkoutGroupCardState extends State<WorkoutGroupCard> {
  bool _isShowDeleteIcon = false;
  bool _isShowDeleteGroupIcon = true;
  bool _applyGreenColor = false;

  late bool _isShowExercisesIcon;

  Color? _trainingColor = Colors.grey[200];

  @override
  void initState(){
    super.initState();
    _isShowExercisesIcon = widget.showExercises!;
  }

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

                // order
                if(widget.order != null && widget.order! > 0)
                  ProWidgetTag(text: widget.order.toString(), borderColor: Colors.redAccent, backgroundColor: Colors.yellow),

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
                        widget.onAddOrderMap?.call(widget.groupName);
                      } else {
                        _trainingColor = Colors.grey[200];
                        widget.onDeleteExerciseList?.call(widget.exercises);
                        widget.onDeleteOrderMap?.call(widget.groupName);
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
