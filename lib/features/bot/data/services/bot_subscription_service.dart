// Dart imports:
import 'dart:convert';

// Project imports:
import '../../../../services/api_service.dart';
import '../../../../utils/api_error.dart';
import '../models/bot_subscription_status.dart';

class BotSubscriptionService {
  final ApiService _apiService;

  BotSubscriptionService({
    required ApiService apiService,
  }) : _apiService = apiService;

  /// Check subscription status for a specific bot
  Future<BotSubscriptionStatus> checkSubscriptionStatus(String botId) async {
    try {
      final response = await _apiService.get('/api/subscriptions/check/$botId');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return BotSubscriptionStatus.fromJson(data['data']);
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
          'Failed to check subscription status: ${e.toString()}');
    }
  }

  /// Subscribe to a bot
  Future<BotSubscriptionStatus> subscribeToBot(String botId) async {
    try {
      final response = await _apiService.post(
        '/api/subscriptions',
        body: jsonEncode({'botId': botId}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return checkSubscriptionStatus(botId);
        } else {
          throw ApiError.fromMap(data);
        }
      } else {
        final errorData = jsonDecode(response.body);
        throw ApiError.fromMap(errorData);
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString('Failed to subscribe to bot: ${e.toString()}');
    }
  }

  /// Cancel subscription to a bot
  Future<BotSubscriptionStatus> cancelSubscription(
      String subscriptionId) async {
    try {
      final response = await _apiService.put(
        '/api/subscriptions/$subscriptionId/cancel',
        body: '{}', // Empty body as per API specification
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return BotSubscriptionStatus.fromJson(data['data']);
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
          'Failed to cancel subscription: ${e.toString()}');
    }
  }

  /// Toggle subscription (subscribe if not subscribed, cancel if subscribed)
  Future<BotSubscriptionStatus> toggleSubscription(String botId) async {
    try {
      // First check current status
      final currentStatus = await checkSubscriptionStatus(botId);

      if (currentStatus.isSubscribed) {
        return await cancelSubscription(currentStatus.subscription!.id);
      } else {
        final response = await subscribeToBot(botId);
        return response;
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError.fromString(
          'Failed to toggle subscription: ${e.toString()}');
    }
  }
}
