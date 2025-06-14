// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'auth_storage_service.dart';

class ApiService {
  final String baseUrl;
  final AuthStorageService _authStorage;

  ApiService({
    required this.baseUrl,
    required AuthStorageService authStorage,
  }) : _authStorage = authStorage;

  Future<Map<String, String>> _getHeaders() async {
    final token = await _authStorage.getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<http.Response> get(String endpoint) async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> post(String endpoint, {required String body}) async {
    final headers = await _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body,
    );
    return response;
  }

  Future<http.Response> put(String endpoint, {required String body}) async {
    final headers = await _getHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body,
    );
    return response;
  }

  Future<http.Response> delete(String endpoint) async {
    final headers = await _getHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return response;
  }

  /// Changes the user's password
  /// 
  /// [currentPassword] is the user's current password
  /// [newPassword] is the new password to set
  /// 
  /// Returns a [Future<http.Response>] with the API response
  /// Throws an [ApiError] if the request fails
  Future<http.Response> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final headers = await _getHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/api/profile/password'),
      headers: headers,
      body: jsonEncode({
        'password': currentPassword,
        'newPassword': newPassword,
      }),
    );
    return response;
  }
}
