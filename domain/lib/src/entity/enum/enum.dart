import 'package:shared/shared.dart';

enum InitialAppRoute {
  login,
  main,
}

enum Gender {
  male(ServerRequestResponseConstants.male),
  female(ServerRequestResponseConstants.female),
  other(ServerRequestResponseConstants.other),
  unknown(ServerRequestResponseConstants.unknown);

  const Gender(this.serverValue);
  final int serverValue;

  static const defaultValue = unknown;
}

enum LanguageCode {
  en(
    localeCode: LocaleConstants.en,
    serverValue: ServerRequestResponseConstants.en,
    countryCode: LocaleConstants.countryCodeEN,
  ),
  vi(
    localeCode: LocaleConstants.vi,
    serverValue: ServerRequestResponseConstants.vi,
    countryCode: LocaleConstants.countryCodeVI,
  );

  const LanguageCode({
    required this.localeCode,
    required this.serverValue,
    required this.countryCode,
  });
  final String localeCode;
  final String serverValue;
  final String countryCode;

  static const defaultValue = vi;
}

enum NotificationType {
  unknown,
  newPost,
  liked;

  static const defaultValue = unknown;
}

enum BottomTab { home, match, leagues, live }
