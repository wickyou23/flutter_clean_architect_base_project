part of '../app_colors.dart';

class CalendarColor {
  final Color weekdayColor;
  final Color dayColor;
  final Color titleColor;
  final Color backgroundColor;
  final Color disableDayColor;
  final Color todayTextColor;
  final Color todayBackgroundColor;
  final Color selectedTextColor;
  final Color selectedBackgroundColor;

  const CalendarColor({
    required this.weekdayColor,
    required this.dayColor,
    required this.titleColor,
    required this.backgroundColor,
    required this.disableDayColor,
    required this.todayTextColor,
    required this.todayBackgroundColor,
    required this.selectedBackgroundColor,
    required this.selectedTextColor,
  });

  static const lightTheme = CalendarColor(
    backgroundColor: Color(0xFFFFFFFF),
    weekdayColor: Color(0xFF484848),
    dayColor: Color(0xFF080808),
    disableDayColor: Color(0x4D000000),
    titleColor: Color(0xFF080808),
    todayTextColor: Color(0xFF2F80ED),
    todayBackgroundColor: Color(0xFFECF2FF),
    selectedBackgroundColor: Color(0xFF1294F2),
    selectedTextColor: Color(0xFFFFFFFF),
  );

  static const darkTheme = CalendarColor(
    backgroundColor: Color(0xFFFFFFFF),
    weekdayColor: Color(0xFF484848),
    dayColor: Color(0xFF080808),
    disableDayColor: Color(0x4D000000),
    titleColor: Color(0xFF080808),
    todayTextColor: Color(0xFF2F80ED),
    todayBackgroundColor: Color(0xFFECF2FF),
    selectedBackgroundColor: Color(0xFF1294F2),
    selectedTextColor: Color(0xFFFFFFFF),
  );
}
