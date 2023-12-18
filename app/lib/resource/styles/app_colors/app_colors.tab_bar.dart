part of '../app_colors.dart';

class TabbarColor {
  final Color activedColor;
  final Color textColor;

  const TabbarColor({
    required this.activedColor,
    required this.textColor,
  });

  static const lightTheme = TabbarColor(
    activedColor: Color(0xFF0083C7),
    textColor: Color(0xFF515A6F),
  );

  static const darkTheme = TabbarColor(
    activedColor: Color(0xFF0083C7),
    textColor: Color(0xFF515A6F),
  );
}
