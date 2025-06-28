// Dart imports:
import 'dart:convert';

// Package imports:

// Project imports:
import 'package:crowwn/models/signal.dart';
import 'package:crowwn/services/api_service.dart';
import 'package:crowwn/utils/api_error.dart';

class SignalRepository {
  final ApiService _apiService;

  SignalRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  Future<SignalsResponse> getSignalsByBotId(
    String botId, {
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiService.get(
        '/api/signals?botId=$botId&page=$page&limit=$limit',
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        if (result['status'] == 'success') {
          return SignalsResponse.fromMap(result);
        } else {
          throw ApiError.fromMap(result);
        }
      } else {
        final errorData = jsonDecode(response.body);
        throw ApiError.fromMap(errorData);
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString('Failed to fetch signals: ${e.toString()}');
    }
  }

  Future<SignalsResponse> getAllSignals({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiService.get(
        '/api/signals?page=$page&limit=$limit',
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        if (result['status'] == 'success') {
          return SignalsResponse.fromMap(result);
        } else {
          throw ApiError.fromMap(result);
        }
      } else {
        final errorData = jsonDecode(response.body);
        throw ApiError.fromMap(errorData);
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString('Failed to fetch signals: ${e.toString()}');
    }
  }
}
