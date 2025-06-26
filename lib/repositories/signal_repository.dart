// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:crowwn/models/signal.dart';
import 'package:crowwn/services/api_service.dart';
import 'package:crowwn/utils/api_error.dart';

class SignalRepository {
  final ApiService _apiService;

  SignalRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  Future<List<Signal>> getSignalsByBotId(String botId) async {
    try {
      final response = await _apiService.get('/api/signals?botId=$botId');

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        if (result['status'] == 'success') {
          final signals = result['data'] as List;
          return signals
              .map<Signal>((signal) => Signal.fromMap(signal))
              .toList();
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

  Future<List<Signal>> getAllSignals() async {
    try {
      final response = await _apiService.get('/api/signals');

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        if (result['status'] == 'success') {
          final signals = result['data'] as List;
          return signals
              .map<Signal>((signal) => Signal.fromMap(signal))
              .toList();
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
