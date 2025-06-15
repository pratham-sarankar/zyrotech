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
    try {
      final response = await _apiService.get('/api/profile/me');

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        throw ApiError.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromMap({'message': e.toString()});
    }
  }
}
