import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProWidgetBookingViewCalendar extends StatefulWidget {
  final List<DateTime> highlightedDates;
  final void Function(DateTime date)? onDatePressed;

  const ProWidgetBookingViewCalendar({
    super.key,
    required this.highlightedDates,
    this.onDatePressed,
  });

  @override
  State<ProWidgetBookingViewCalendar> createState() => _ProWidgetBookingViewCalendarState();
}

class _ProWidgetBookingViewCalendarState extends State<ProWidgetBookingViewCalendar> {
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
  }

  void _goToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final year = _currentMonth.year;
    final month = _currentMonth.month;
    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth = DateTime(year, month + 1, 0);
    final startWeekday = firstDayOfMonth.weekday % 7;
    final daysInMonth = lastDayOfMonth.day;

    final List<Widget> dayButtons = [];

    // Espaços antes do primeiro dia
    for (int i = 0; i < startWeekday; i++) {
      dayButtons.add(const SizedBox.shrink());
    }

    // Dias do mês
    for (int day = 1; day <= daysInMonth; day++) {
      final currentDate = DateTime(year, month, day);
      final isHighlighted = widget.highlightedDates.any(
            (d) => _isSameDay(d, currentDate),
      );

      dayButtons.add(
        GestureDetector(
          onTap: () => widget.onDatePressed?.call(currentDate),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.blue : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            width: 40,
            height: 40,
            child: Text(
              day.toString(),
              style: TextStyle(
                color: isHighlighted ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: const Icon(Icons.chevron_left), onPressed: _goToPreviousMonth),
            Text(
              DateFormat.yMMMM('pt_BR').format(_currentMonth),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(icon: const Icon(Icons.chevron_right), onPressed: _goToNextMonth),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('D'), Text('S'), Text('T'), Text('Q'), Text('Q'), Text('S'), Text('S'),
          ],
        ),
        const SizedBox(height: 4),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: dayButtons,
        ),
      ],
    );
  }
}
