abstract class AuthOfflineDataSource {
  Future<void> cacheToken(String token);

  Future<String?> getToken();

  Future<void> deleteToken();
}
