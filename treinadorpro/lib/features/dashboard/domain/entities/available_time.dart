class AvailableTime {
  final int? id;
  final int personalUserId;
  final int daysOfWeek;
  final String dayTime;
  final bool? available;
  final String? status;

  const AvailableTime({
    this.id,
    required this.personalUserId,
    required this.daysOfWeek,
    required this.dayTime,
    this.available,
    this.status,
  });

  static int MONDAY = 0;
  static int TUEDAY = 1;
  static int WEDNESDAY = 2;
  static int THURSDAY = 3;
  static int FRIDAY = 4;
  static int SATURDAY = 5;
  static int SUNDAY = 6;

  static List<AvailableTime> times = [
    AvailableTime(personalUserId: 1,daysOfWeek: MONDAY, dayTime: "08:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: MONDAY, dayTime: "09:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: TUEDAY, dayTime: "11:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: TUEDAY, dayTime: "14:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: TUEDAY, dayTime: "15:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: TUEDAY, dayTime: "16:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: TUEDAY, dayTime: "19:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: WEDNESDAY, dayTime: "10:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: THURSDAY, dayTime: "10:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: THURSDAY, dayTime: "11:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: FRIDAY, dayTime: "09:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: FRIDAY, dayTime: "11:00", available: true),
    AvailableTime(personalUserId: 1,daysOfWeek: SATURDAY, dayTime: "09:00", available: true),
  ];
}
