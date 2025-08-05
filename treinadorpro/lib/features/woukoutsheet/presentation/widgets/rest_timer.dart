import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treinadorpro/core/widgets/pro_widget_tag.dart';

class RestTimer extends StatefulWidget {
  const RestTimer({super.key});

  @override
  State<RestTimer> createState() => _RestTimerState();
}

class _RestTimerState extends State<RestTimer> {
  Timer? _timer;
  int _remainingSeconds = 60; // Tempo inicial em segundos (1 minuto)

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        _stopTimer();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _timer = null;
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(Icons.timer_outlined, size: 30),
        const Text('Descanso', style: TextStyle(fontSize: 18)),
        IconButton(icon: const Icon(Icons.play_arrow,size: 30,),  onPressed: (){
          _remainingSeconds = 60;
          _startTimer();
        }),
        ProWidgetTag(
          text: _formatTime(_remainingSeconds),
          borderColor: Colors.redAccent,
          backgroundColor: Colors.redAccent,
          fontSize: 20,
        ),
        IconButton(icon: const Icon(Icons.stop, size: 30,), onPressed: _stopTimer),
      ],
    );
  }
}
