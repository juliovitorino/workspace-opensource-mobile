import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/styles.dart';
import 'package:treinadorpro/core/data/models/trainer_available_time_response_model.dart';

import '../../domain/entities/available_time.dart';

class ProWidgetFreeAvailableTime extends StatefulWidget {
  final TrainerAvailableTimeResponseModel trainerAvailableTimeResponseModel;

  const ProWidgetFreeAvailableTime(this.trainerAvailableTimeResponseModel, {super.key});

  @override
  State<ProWidgetFreeAvailableTime> createState() => _ProWidgetFreeAvailableTimeState();
}

class _ProWidgetFreeAvailableTimeState extends State<ProWidgetFreeAvailableTime> {
  final List<String> days = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];

  int selectedDay = 0;

  List<String>? _getFilteredTimes(int day) {
    if(day == 0) return widget.trainerAvailableTimeResponseModel.mondayAvailableTimes;
    if(day == 1) return widget.trainerAvailableTimeResponseModel.tuesdayAvailableTimes;
    if(day == 2) return widget.trainerAvailableTimeResponseModel.wednesdayAvailableTimes;
    if(day == 3) return widget.trainerAvailableTimeResponseModel.thursdayAvailableTimes;
    if(day == 4) return widget.trainerAvailableTimeResponseModel.fridayAvailableTimes;
    if(day == 5) return widget.trainerAvailableTimeResponseModel.saturdayAvailableTimes;
    if(day == 6) return widget.trainerAvailableTimeResponseModel.sundayAvailableTimes;
    return null;
  }

  int? _getFilteredTotal(int day) {
    if(day == 0) return widget.trainerAvailableTimeResponseModel.monTotal;
    if(day == 1) return widget.trainerAvailableTimeResponseModel.tueTotal;
    if(day == 2) return widget.trainerAvailableTimeResponseModel.wedTotal;
    if(day == 3) return widget.trainerAvailableTimeResponseModel.thuTotal;
    if(day == 4) return widget.trainerAvailableTimeResponseModel.friTotal;
    if(day == 5) return widget.trainerAvailableTimeResponseModel.satTotal;
    if(day == 6) return widget.trainerAvailableTimeResponseModel.sunTotal;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final filteredTimes = _getFilteredTimes(selectedDay);
    final filteredTotal = _getFilteredTotal(selectedDay);

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
          filteredTotal == 0 ? 'Não há horário disponível' : 'Encontrei ${filteredTotal} horários disponíveis:',
          style: kHeading,
        ),
        SizedBox(height: 8),

        // available times
        Column(
          children: List.generate(filteredTimes!.length, (index) {
            return ListTile(
              leading: Icon(Icons.access_time),
              title: Text(filteredTimes[index]),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            );
          }),
        ),

      ],
    );
  }
}
