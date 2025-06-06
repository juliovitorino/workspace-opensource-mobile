import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/styles.dart';

import '../../domain/entities/available_time.dart';

class ProWidgetFreeAvailableTime extends StatefulWidget {
  @override
  State<ProWidgetFreeAvailableTime> createState() => _ProWidgetFreeAvailableTimeState();
}

class _ProWidgetFreeAvailableTimeState extends State<ProWidgetFreeAvailableTime> {
  final List<String> days = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];

  int selectedDay = 0;

  List<AvailableTime> _getFilteredTimes(int day) {
    return AvailableTime.times
        .where((t) => t.daysOfWeek == day && (t.available ?? false))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTimes = _getFilteredTimes(selectedDay);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          'Selecione um dia da semana para ver agenda livre:',
          style: kHeading,
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              final isSelected = selectedDay == index;
              return GestureDetector(
                onTap: () => setState(() => selectedDay = index),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      days[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16),
        Text(
          filteredTimes.length == 0 ? 'Não há horário disponível' : 'Encontrei ${filteredTimes.length} horários disponíveis:',
          style: kHeading,
        ),
        SizedBox(height: 8),

        // available times
        Column(
          children: List.generate(filteredTimes.length, (index) {
            return ListTile(
              leading: Icon(Icons.access_time),
              title: Text(filteredTimes[index].dayTime),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            );
          }),
        ),

      ],
    );
  }
}
