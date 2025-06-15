// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:crowwn/services/api_service.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/features/profile/data/models/profile_model.dart';
import 'package:crowwn/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiService _apiService;

  ProfileRepositoryImpl(this._apiService);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await _apiService.get('/api/profile/me');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProfileModel.fromJson(data);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
  }) async {
    final response = await _apiService.put(
      '/api/profile',
      body: jsonEncode({
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProfileModel.fromJson(data['data']['user']);
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }
}
