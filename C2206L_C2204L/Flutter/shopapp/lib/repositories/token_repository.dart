
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository {
  static const String _tokenKey = 'token';
  static const String _refreshTokenKey = 'refreshToken';

  // Save tokens to local storage
  Future<void> saveTokens({required String token, required String refreshToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  // Retrieve tokens from local storage
  Future<Map<String, String>> getTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(_tokenKey) ?? '';
    String? refreshToken = prefs.getString(_refreshTokenKey) ?? '';
    return {
      'token': token,
      'refreshToken': refreshToken
    };
  }
  // Clear tokens from local storage
  Future<void> clearTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}