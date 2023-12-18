class ServerTimeoutConstants {
  const ServerTimeoutConstants._();
  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
  static const sendTimeout = Duration(seconds: 30);
  static const cachingTimeout = Duration(seconds: 5 * 60);
}
