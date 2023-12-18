// ignore_for_file: avoid_hard_coded_colors
import 'package:flutter/material.dart';

import '../../app.dart';

part 'app_colors/app_colors.calendar.dart';
part 'app_colors/app_colors.summary_box.dart';
part 'app_colors/app_colors.match_header_calendar_item.dart';
part 'app_colors/app_colors.tab_bar.dart';

class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryGradient,
    required this.whiteColor,
    required this.defaultBackgroundColor,
    required this.primaryTextColor,
    required this.buttonTextColor,
    required this.navigatorIconColor,
    required this.captionTextColor,
    required this.matchHeaderCalendarItem,
    required this.hashtagTextColor,
    required this.hashtagBackgroundColor,
    required this.articleDetailsSummaryBox,
    required this.lineColor,
    required this.calendar,
    required this.matchSubtitleColor,
    required this.tabbar,
  });

  static late AppColors current;
  static const Color appColor = Color(0xFF1A2C58);

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color whiteColor;
  final Color defaultBackgroundColor;

  final Color buttonTextColor;
  final Color navigatorIconColor;
  final Color captionTextColor;
  final Color lineColor;

  //hashtag
  final Color hashtagBackgroundColor;
  final Color hashtagTextColor;

  //SummaryBox
  final ArticleDetailsSummaryBoxColor articleDetailsSummaryBox;

  //Calendar
  final CalendarColor calendar;

  //MatchHeaderCalendarItem
  final MatchHeaderCalendarItemColor matchHeaderCalendarItem;

  //TabbarColor
  final TabbarColor tabbar;

  //Gradient
  final LinearGradient primaryGradient;

  //Match
  final Color matchSubtitleColor;

  static const defaultAppColor = AppColors(
    primaryColor: Color(0xFF150000),
    secondaryColor: Color.fromARGB(255, 62, 62, 70),
    primaryGradient:
        LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
    whiteColor: Colors.white,
    defaultBackgroundColor: Color(0xFFF7F6F9),
    primaryTextColor: Color(0xFF1A2C58),
    buttonTextColor: Color(0xFF0083C7),
    navigatorIconColor: Color(0xFF515A6F),
    captionTextColor: Colors.grey,
    hashtagBackgroundColor: Color(0xFFE6E6E6),
    hashtagTextColor: Color(0xFF484848),
    lineColor: Color(0xFFE6E6E6),
    matchSubtitleColor: Color(0xFF4E4B66),
    calendar: CalendarColor.lightTheme,
    articleDetailsSummaryBox: ArticleDetailsSummaryBoxColor.lightTheme,
    matchHeaderCalendarItem: MatchHeaderCalendarItemColor.lightTheme,
    tabbar: TabbarColor.lightTheme,
  );

  static const darkThemeColor = AppColors(
    primaryColor: Color(0xFF150000),
    secondaryColor: Color.fromARGB(255, 166, 168, 254),
    primaryGradient:
        LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
    whiteColor: Colors.black,
    defaultBackgroundColor: Color(0xFFF7F6F9),
    primaryTextColor: Color(0xFF1A2C58),
    buttonTextColor: Color(0xFF0083C7),
    navigatorIconColor: Color(0xFF515A6F),
    captionTextColor: Colors.grey,
    hashtagBackgroundColor: Color(0xFFE6E6E6),
    hashtagTextColor: Color(0xFF484848),
    lineColor: Color(0xFFE6E6E6),
    matchSubtitleColor: Color(0xFF4E4B66),
    calendar: CalendarColor.darkTheme,
    articleDetailsSummaryBox: ArticleDetailsSummaryBoxColor.darkTheme,
    matchHeaderCalendarItem: MatchHeaderCalendarItemColor.darkTheme,
    tabbar: TabbarColor.darkTheme,
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }
}
