import 'package:intl/intl.dart';

import '../data/models/contract_response_model.dart';

String getCorrectTime(ContractResponseModel contract) {
  Map<int, String?> mapDOW = {
    1: contract.monday,
    2: contract.tuesday,
    3: contract.wednesday,
    4: contract.thursday,
    5: contract.friday,
    6: contract.saturday,
    7: contract.sunday,
  };
  DateTime now = DateTime.now();
  int dayOfWeek = now.weekday;
  return mapDOW[dayOfWeek] ?? 'Unavailable time';
}

String getDateTimeToDate(DateTime dt) {
  return dt.toString().split(' ')[0];
}

String getDateTimeToDT(DateTime dt) {
  final date = dt.toString().split(' ');
  final time = date[1].split('.');
  return '${date[0]} ${time[0]}';
}

String getFormattedDate(String locale) {
  DateTime now = DateTime.now();
  return DateFormat.yMMMMEEEEd(locale).format(now);
}

String getDateFormatted(DateTime dt, String locale) {
  return DateFormat.yMMMMEEEEd(locale).format(dt);
}

String getDayOfWeekName(String locale, DateTime dt) {
  DateTime now = DateTime.now();
  return DateFormat.EEEE(locale).format(dt);
}

String dateDifference(DateTime start, DateTime end) {
  final duration = end.difference(start).abs();

  final days = duration.inDays;
  final hours = duration.inHours % 24;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;

  final parts = <String>[];

  if (days > 0) parts.add('$days ${days == 1 ? 'dia' : 'dias'}');
  if (hours > 0) parts.add('$hours ${hours == 1 ? 'hora' : 'horas'}');
  if (minutes > 0) parts.add('$minutes ${minutes == 1 ? 'minuto' : 'minutos'}');
  if (seconds > 0) parts.add('$seconds ${seconds == 1 ? 'seg' : 'seg'}');

  if (parts.isEmpty) return '0 segundos';

  if (parts.length == 1) return parts.first;

  final last = parts.removeLast();
  return '${parts.join(', ')} e $last';
}

DateTime getFirstDayAtMidnight(DateTime date) {
  return DateTime(date.year, date.month, 1);
}

DateTime getEndOfMonth(DateTime date) {
  DateTime firstDayNextMonth = DateTime(date.year, date.month + 1, 1);

  DateTime lastDay = firstDayNextMonth.subtract(Duration(days: 1));

  return DateTime(
    lastDay.year,
    lastDay.month,
    lastDay.day,
    23,
    59,
    59,
    999,
  );
}

DateTime addDaysToDate(DateTime startDate, int days) {
  return startDate.add(Duration(days: days));
}