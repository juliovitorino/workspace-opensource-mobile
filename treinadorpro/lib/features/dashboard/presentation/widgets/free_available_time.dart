import 'package:flutter/material.dart';

class FreeAvailableTime extends StatefulWidget {
  @override
  State<FreeAvailableTime> createState() => _FreeAvailableTimeState();
}

class _FreeAvailableTimeState extends State<FreeAvailableTime> {
  final List<String> days = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];
  final List<String> hours = [
    '06:00', '07:00', '08:00', '09:00', '10:00',
    '11:00', '12:00', '13:00', '14:00', '15:00',
    '16:00', '17:00', '18:00', '19:00', '20:00'
  ];

  int selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text('Selecione um dia da semana:',
            style: TextStyle(fontWeight: FontWeight.bold)),
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
        Text('Horários disponíveis:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Column(
          children: List.generate(hours.length, (index) {
            return ListTile(
              leading: Icon(Icons.access_time),
              title: Text(hours[index]),
              trailing: Icon(Icons.check_circle, color: Colors.green),
              onTap: () {
                // lógica de ação no clique do horário
              },
            );
          }),
        )
      ],
    );
  }
}
