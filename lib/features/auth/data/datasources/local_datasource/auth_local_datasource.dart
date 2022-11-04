abstract class AuthLocalDataSource {
  Future<bool> saveToken(String token);

  String? getToken();

  Future<void> deleteToken();
}
