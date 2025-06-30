import 'dart:convert';
import 'package:crowwn/services/api_service.dart';
import 'package:crowwn/features/user_signals/data/models/user_signals_response_model.dart';
import 'package:crowwn/utils/api_error.dart';

class UserSignalsService {
  final ApiService _apiService;

  UserSignalsService({
    required ApiService apiService,
  }) : _apiService = apiService;

  Future<UserSignalsResponseModel> getUserSignals({
    required String status,
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
        'status': status,
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

      final response = await _apiService.get('/api/signals/user?$queryString');

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        if (result['status'] == 'success') {
          return UserSignalsResponseModel.fromMap(result);
        } else {
          throw ApiError.fromMap(result);
        }
      } else {
        final errorData = jsonDecode(response.body);
        throw ApiError.fromMap(errorData);
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString(
          'Failed to fetch user signals: ${e.toString()}');
    }
  }
}
