// Dart imports:
import 'dart:convert';
import 'package:http/http.dart' as http;

// Project imports:
import '../features/brokers/domain/models/binance_balance.dart';
import '../features/brokers/domain/models/binance_credentials.dart';
import '../utils/api_error.dart';
import 'api_service.dart';

class BinanceService {
  final ApiService _apiService;

  BinanceService({
    required ApiService apiService,
  }) : _apiService = apiService;

  /// Check Binance balance using stored credentials
  Future<BinanceBalance> checkBalance(BinanceCredentials credentials) async {
    try {
      final response = await _apiService.post(
        '/api/broker/check-balance',
        body: jsonEncode(credentials.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return BinanceBalance.fromJson(data['data']);
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
          'Failed to check Binance balance: ${e.toString()}');
    }
  }

  /// Test API credentials by making a balance check
  Future<bool> testCredentials(BinanceCredentials credentials) async {
    try {
      await checkBalance(credentials);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Fetch latest price for a symbol from Binance public API
  Future<double> getLatestPrice(String symbol) async {
    final url =
        Uri.parse('https://api.binance.com/api/v3/ticker/price?symbol=$symbol');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return double.parse(data['price']);
    } else {
      throw Exception('Failed to fetch price for $symbol');
    }
  }
}
