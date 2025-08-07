import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinadorpro/core/widgets/pro_widget_monthly_calendar.dart';

class ScheduleTrainingSession extends StatefulWidget {
  const ScheduleTrainingSession({super.key});

  @override
  State<ScheduleTrainingSession> createState() => _ScheduleTrainingSessionState();
}

class _ScheduleTrainingSessionState extends State<ScheduleTrainingSession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AGENDAR TREINO'),
      ),
      body: ProWidgetMonthlyCalendar(
        onDateSelected: (date) => print('date selected = $date'),
        onDateUnselected: (date) => print('date unselected = $date'),
      ),
    );
  }
}
