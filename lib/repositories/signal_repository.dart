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
    String? direction,
    String? today,
    String? yesterday,
    String? thisWeek,
    String? thisMonth,
    String? startDate,
    String? endDate,
    String? date,
  }) async {
    try {
      final queryParams = <String, String>{
        'botId': botId,
        'page': page.toString(),
        'limit': limit.toString(),
      };

      // Add optional parameters
      if (direction != null) queryParams['direction'] = direction;
      if (today != null) queryParams['today'] = today;
      if (yesterday != null) queryParams['yesterday'] = yesterday;
      if (thisWeek != null) queryParams['thisWeek'] = thisWeek;
      if (thisMonth != null) queryParams['thisMonth'] = thisMonth;
      if (startDate != null) queryParams['startDate'] = startDate;
      if (endDate != null) queryParams['endDate'] = endDate;
      if (date != null) queryParams['date'] = date;

      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&');

      final response = await _apiService.get('/api/signals?$queryString');

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
    String? direction,
    String? today,
    String? yesterday,
    String? thisWeek,
    String? thisMonth,
    String? startDate,
    String? endDate,
    String? date,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'limit': limit.toString(),
      };

      // Add optional parameters
      if (direction != null) queryParams['direction'] = direction;
      if (today != null) queryParams['today'] = today;
      if (yesterday != null) queryParams['yesterday'] = yesterday;
      if (thisWeek != null) queryParams['thisWeek'] = thisWeek;
      if (thisMonth != null) queryParams['thisMonth'] = thisMonth;
      if (startDate != null) queryParams['startDate'] = startDate;
      if (endDate != null) queryParams['endDate'] = endDate;
      if (date != null) queryParams['date'] = date;

      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&');

      final response = await _apiService.get('/api/signals?$queryString');

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
