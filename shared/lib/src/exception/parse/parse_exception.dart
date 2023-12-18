import '../../../shared.dart';

class ParseException extends AppException {
  const ParseException(this.kind, this.rootException)
      : super(AppExceptionType.parse);

  final ParseExceptionKind kind;
  final Object? rootException;

  factory ParseException.invalidSourceFormat() => const ParseException(
        ParseExceptionKind.invalidSourceFormat,
        null,
      );

  @override
  String toString() {
    return 'ParseException: {kind: $kind, rootException: $rootException}';
  }
}

enum ParseExceptionKind {
  invalidSourceFormat,
}
