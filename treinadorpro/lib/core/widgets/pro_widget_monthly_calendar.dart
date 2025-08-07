import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProWidgetMonthlyCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final Function(DateTime) onDateUnselected;

  const ProWidgetMonthlyCalendar({
    Key? key,
    required this.onDateSelected,
    required this.onDateUnselected,
  }) : super(key: key);

  @override
  State<ProWidgetMonthlyCalendar> createState() => _ProWidgetMonthlyCalendarState();
}

class _ProWidgetMonthlyCalendarState extends State<ProWidgetMonthlyCalendar> {
  DateTime _currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
  final Set<DateTime> _selectedDates = {};

  List<Widget> _buildDaysOfWeek() {
    final List<String> weekdays = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];
    return weekdays
        .map((day) => Center(child: Text(day, style: const TextStyle(fontWeight: FontWeight.bold))))
        .toList();
  }

  List<DateTime> _getDaysInMonth(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final firstWeekday = firstDayOfMonth.weekday % 7; // 0 = Sunday
    final totalDays = lastDayOfMonth.day;

    final days = <DateTime>[];

    // Dias do mês anterior (para preencher a primeira semana)
    for (int i = 0; i < firstWeekday; i++) {
      days.add(firstDayOfMonth.subtract(Duration(days: firstWeekday - i)));
    }

    // Dias do mês atual
    for (int i = 1; i <= totalDays; i++) {
      days.add(DateTime(month.year, month.month, i));
    }

    // Completa a última linha da grade com dias do mês seguinte
    while (days.length % 7 != 0) {
      days.add(days.last.add(const Duration(days: 1)));
    }

    return days;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isSelected(DateTime day) {
    return _selectedDates.any((d) => _isSameDay(d, day));
  }

  void _onDayTapped(DateTime day) {
    setState(() {
      if (_isSelected(day)) {
        _selectedDates.removeWhere((d) => _isSameDay(d, day));
        widget.onDateUnselected(day);
      } else {
        _selectedDates.add(day);
        widget.onDateSelected(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _getDaysInMonth(_currentMonth);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Header com navegação
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
                  });
                },
              ),
              Text(
                DateFormat.yMMMM().format(_currentMonth),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Dias da semana
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: _buildDaysOfWeek(),
          ),

          const Divider(),

          // Dias do mês
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: days.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              final day = days[index];
              final isInCurrentMonth = day.month == _currentMonth.month;
              final selected = _isSelected(day);

              return GestureDetector(
                onTap: isInCurrentMonth ? () => _onDayTapped(day) : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: selected ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isInCurrentMonth
                          ? (selected ? Colors.white : Colors.black)
                          : Colors.grey,
                      fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
