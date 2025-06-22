// Package imports:
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Project imports:
import '../features/brokers/domain/models/binance_credentials.dart';
import '../features/brokers/domain/models/delta_credentials.dart';

class AuthStorageService {
  static const String _tokenKey = 'auth_token';
  static const String _binanceCredentialsKey = 'binance_credentials';
  static const String _deltaCredentialsKey = 'delta_credentials';

  // Get the stored auth token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Check if user is logged in by verifying token existence
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // Store the auth token
  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Clear the auth token (logout)
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // Store Binance API credentials
  Future<void> setBinanceCredentials(BinanceCredentials credentials) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _binanceCredentialsKey, jsonEncode(credentials.toJson()));
  }

  // Get stored Binance API credentials
  Future<BinanceCredentials?> getBinanceCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final credentialsJson = prefs.getString(_binanceCredentialsKey);
    if (credentialsJson != null) {
      try {
        final credentialsMap =
            jsonDecode(credentialsJson) as Map<String, dynamic>;
        return BinanceCredentials.fromJson(credentialsMap);
      } catch (e) {
        // If parsing fails, clear the corrupted data
        await clearBinanceCredentials();
        return null;
      }
    }
    return null;
  }

  // Check if Binance credentials exist
  Future<bool> hasBinanceCredentials() async {
    final credentials = await getBinanceCredentials();
    return credentials != null;
  }

  // Clear Binance API credentials
  Future<void> clearBinanceCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_binanceCredentialsKey);
  }

  // Store Delta API credentials
  Future<void> setDeltaCredentials(DeltaCredentials credentials) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _deltaCredentialsKey, jsonEncode(credentials.toJson()));
  }

  // Get stored Delta API credentials
  Future<DeltaCredentials?> getDeltaCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final credentialsJson = prefs.getString(_deltaCredentialsKey);
    if (credentialsJson != null) {
      try {
        final credentialsMap =
            jsonDecode(credentialsJson) as Map<String, dynamic>;
        return DeltaCredentials.fromJson(credentialsMap);
      } catch (e) {
        // If parsing fails, clear the corrupted data
        await clearDeltaCredentials();
        return null;
      }
    }
    return null;
  }

  // Check if Delta credentials exist
  Future<bool> hasDeltaCredentials() async {
    final credentials = await getDeltaCredentials();
    return credentials != null;
  }

  // Clear Delta API credentials
  Future<void> clearDeltaCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_deltaCredentialsKey);
  }
}
