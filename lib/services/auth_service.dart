// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:crowwn/features/settings/change-password/data/models/change_password_response.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crowwn/models/responses/sign_up_response.dart';
import '../utils/api_error.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  Future<SignUpResponse> signUp(
      String fullName, String email, String password) async {
    final response = await _apiService.post(
      '/api/auth/signup',
      body: jsonEncode({
        'fullName': fullName,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignUpResponse.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  Future<Map<String, dynamic>> sendEmailOtp(String email) async {
    final response = await _apiService.post(
      '/api/auth/send-email-otp',
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  Future<Map<String, dynamic>> verifyEmailOtp(String email, String otp) async {
    final response = await _apiService.post(
      '/api/auth/verify-email-otp',
      body: jsonEncode({'email': email, 'otp': otp}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _apiService.post(
      '/api/auth/login',
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  Future<Map<String, dynamic>> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'profile',
        ],
      );
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        throw ApiError.fromString('Sign in cancelled by user');
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final response = await _apiService.post(
        '/api/auth/google',
        body: jsonEncode({'idToken': googleSignInAuthentication.idToken}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ApiError.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString('Failed to login with Google');
    }
  }

  Future<Map<String, dynamic>> sendPhoneOtp(String phoneNumber) async {
    final response = await _apiService.post(
      '/api/profile/phone',
      body: jsonEncode({'phoneNumber': phoneNumber}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  Future<Map<String, dynamic>> createPin(String pin) async {
    final response = await _apiService.post(
      '/api/profile/pin',
      body: jsonEncode({'pin': pin}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final response = await _apiService.post(
      '/api/auth/forgot-password',
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  /// Changes the user's password
  ///
  /// [currentPassword] is the user's current password
  /// [newPassword] is the new password to set
  ///
  /// Returns a [Future<http.Response>] with the API response
  /// Throws an [ApiError] if the request fails
  Future<ChangePasswordResponse> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await _apiService.put(
      '/api/profile/password',
      body: jsonEncode({
        'password': currentPassword,
        'newPassword': newPassword,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ChangePasswordResponse.fromJson(jsonDecode(response.body));
    }
    throw ApiError.fromMap(jsonDecode(response.body));
  }

  /// Logs out the user by:
  /// 1. Clearing SharedPreferences
  /// 2. Signing out from Google
  ///
  /// Throws an [ApiError] if the logout process fails
  Future<void> logout() async {
    try {
      // Clear SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Sign out from Google
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString('Failed to logout: ${e.toString()}');
    }
  }
}
