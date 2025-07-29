import 'dart:async';
import 'package:flutter/material.dart';

class ExerciseExecutionPage extends StatefulWidget {
  final String exerciseName;

  const ExerciseExecutionPage({super.key, required this.exerciseName});

  @override
  State<ExerciseExecutionPage> createState() => _ExerciseExecutionPageState();
}

class _ExerciseExecutionPageState extends State<ExerciseExecutionPage> {
  final List<SetData> sets = List.generate(3, (_) => SetData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.exerciseName)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sets.length,
        itemBuilder: (context, index) {
          final set = sets[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Série ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: "Peso (kg)"),
                          onChanged: (value) => set.weight = double.tryParse(value) ?? 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text("Tempo: ${formatTime(set.elapsedSeconds)}", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.play_arrow),
                        label: const Text("Iniciar Série"),
                        onPressed: set.completed || set.isRunning
                            ? null
                            : () => startTimer(set),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.check),
                        label: const Text("Finalizar Série"),
                        onPressed: set.isRunning
                            ? () => stopTimer(set)
                            : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (set.completed)
                    const Text("✅ Série concluída", style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.check_circle),
          label: const Text("Finalizar Exercício"),
          onPressed: () {
            final allDone = sets.every((s) => s.completed);
            if (!allDone) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Todas as séries devem ser concluídas")),
              );
              return;
            }
            // TODO: Salvar no backend ou banco local
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Exercício finalizado!")),
            );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void startTimer(SetData set) {
    set.elapsedSeconds = 0;
    set.isRunning = true;
    set.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        set.elapsedSeconds++;
      });
    });
  }

  void stopTimer(SetData set) {
    set.timer?.cancel();
    set.isRunning = false;
    set.completed = true;
    setState(() {});
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}

class SetData {
  double weight = 0;
  int elapsedSeconds = 0;
  bool completed = false;
  bool isRunning = false;
  Timer? timer;
}
