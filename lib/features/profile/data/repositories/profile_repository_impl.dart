import 'dart:convert';

import 'package:crowwn/services/api_service.dart';
import 'package:crowwn/utils/api_error.dart';
import '../models/profile_model.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiService _apiService;

  ProfileRepositoryImpl(this._apiService);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await _apiService.get('/api/profile/me');

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }
} 