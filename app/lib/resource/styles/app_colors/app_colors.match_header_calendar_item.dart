part of '../app_colors.dart';

class MatchHeaderCalendarItemColor {
  final Color selectedBorderItemColor;
  final Color selectedBackgroundItemColor;

  const MatchHeaderCalendarItemColor({
    required this.selectedBorderItemColor,
    required this.selectedBackgroundItemColor,
  });

  static const lightTheme = MatchHeaderCalendarItemColor(
    selectedBackgroundItemColor: Color(0xFFE5F6FF),
    selectedBorderItemColor: Color(0xFF0083C7),
  );

  static const darkTheme = MatchHeaderCalendarItemColor(
    selectedBackgroundItemColor: Color(0xFFE5F6FF),
    selectedBorderItemColor: Color(0xFF0083C7),
  );
}
