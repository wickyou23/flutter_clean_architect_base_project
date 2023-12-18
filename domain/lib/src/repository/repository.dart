import '../../domain.dart';

abstract class Repository {
  bool get isLoggedIn;

  bool get isFirstLaunchApp;

  bool get isFirstLogin;

  bool get isDarkMode;

  LanguageCode get languageCode;

  Stream<bool> get onConnectivityChanged;

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<void> forgotPassword(String email);

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  });

  // User getUserPreference();

  Future<void> clearCurrentUserData();

  Future<bool> saveIsFirstLogin(bool isFirstLogin);

  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp);

  Future<bool> saveIsDarkMode(bool isDarkMode);

  Future<bool> saveLanguageCode(LanguageCode languageCode);

  Future<void> saveAccessToken(String accessToken);

  bool deleteImageUrl(int id);

  int deleteAllUsersAndImageUrls();
}
