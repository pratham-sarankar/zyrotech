import 'dart:convert';

import '../../../../services/api_service.dart';
import '../../../../utils/api_error.dart';
import '../../domain/models/kyc_basic_details.dart';
import '../../domain/repositories/kyc_repository.dart';

class KYCRepositoryImpl implements KYCRepository {
  final ApiService _apiService;

  KYCRepositoryImpl(this._apiService);

  @override
  Future<Map<String, dynamic>> submitBasicDetails(
      KYCBasicDetails details) async {
    try {
      final response = await _apiService.post(
        '/api/kyc/basic-details',
        body: jsonEncode(details.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw ApiError.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromMap({'message': e.toString()});
    }
  }

  @override
  Future<Map<String, dynamic>> submitRiskProfiling(
      List<Map<String, String>> questionsAndAnswers) async {
    try {
      final response = await _apiService.post(
        '/api/kyc/risk-profiling',
        body: jsonEncode({'questionsAndAnswers': questionsAndAnswers}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw ApiError.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromMap({'message': e.toString()});
    }
  }

  @override
  Future<Map<String, dynamic>> submitCapitalManagement(
      List<Map<String, String>> questionsAndAnswers) async {
    try {
      final response = await _apiService.post(
        '/api/kyc/capital-management',
        body: jsonEncode({'questionsAndAnswers': questionsAndAnswers}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw ApiError.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromMap({'message': e.toString()});
    }
  }

  @override
  Future<Map<String, dynamic>> submitExperience(
      List<Map<String, String>> questionsAndAnswers) async {
    try {
      final response = await _apiService.post(
        '/api/kyc/experience',
        body: jsonEncode({'questionsAndAnswers': questionsAndAnswers}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw ApiError.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromMap({'message': e.toString()});
    }
  }
}
