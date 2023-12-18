import 'date_time_utils.dart';

extension StringExtensions on String {
  String plus(String other) {
    return this + other;
  }

  bool equalsIgnoreCase(String secondString) =>
      toLowerCase().contains(secondString.toLowerCase());

  DateTime toIOS8601DateTime() {
    return DateTime.fromMillisecondsSinceEpoch(
      DateTimeUtils.toISO8601Duration(this).inMilliseconds,
      isUtc: true,
    );
  }
}
