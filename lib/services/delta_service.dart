// Dart imports:
import 'dart:convert';

// Project imports:
import '../features/brokers/domain/models/delta_balance.dart';
import '../features/brokers/domain/models/delta_credentials.dart';
import '../utils/api_error.dart';
import 'api_service.dart';

class DeltaService {
  final ApiService _apiService;

  DeltaService({
    required ApiService apiService,
  }) : _apiService = apiService;

  /// Check Delta balance using stored credentials
  Future<DeltaBalance> checkBalance(DeltaCredentials credentials) async {
    try {
      final response = await _apiService.post(
        '/api/broker/asset-delta-balance',
        body: jsonEncode(credentials.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return DeltaBalance.fromJson(data['data']);
        } else {
          throw ApiError.fromMap(data);
        }
      } else {
        final errorData = jsonDecode(response.body);
        throw ApiError.fromMap(errorData);
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString(
          'Failed to check Delta balance: ${e.toString()}');
    }
  }

  /// Test API credentials by making a balance check
  Future<bool> testCredentials(DeltaCredentials credentials) async {
    try {
      await checkBalance(credentials);
      return true;
    } catch (e) {
      return false;
    }
  }
}
