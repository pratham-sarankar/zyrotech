import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../data/models/bot_subscription_status.dart';
import '../../data/models/bot_performance_overview.dart';
import '../../data/services/bot_subscription_service.dart';
import '../../../../services/api_service.dart';
import '../../../../utils/api_error.dart';

class BotDetailsProvider extends ChangeNotifier {
  final BotSubscriptionService _subscriptionService;
  final ApiService _apiService;

  BotDetailsProvider({
    required BotSubscriptionService subscriptionService,
    required ApiService apiService,
  })  : _subscriptionService = subscriptionService,
        _apiService = apiService;

  BotSubscriptionStatus? _subscriptionStatus;
  BotPerformanceOverview? _performanceOverview;
  bool _isLoading = false;
  bool _isLoadingPerformance = false;
  bool _isToggling = false;
  String? _error;
  String? _performanceError;
  String? _currentBotId;

  // Getters
  BotSubscriptionStatus? get subscriptionStatus => _subscriptionStatus;
  BotPerformanceOverview? get performanceOverview => _performanceOverview;
  bool get isLoading => _isLoading;
  bool get isLoadingPerformance => _isLoadingPerformance;
  bool get isToggling => _isToggling;
  String? get error => _error;
  String? get performanceError => _performanceError;
  bool get isSubscribed => _subscriptionStatus?.isSubscribed ?? false;
  String? get currentBotId => _currentBotId;

  /// Load subscription status for a specific bot
  Future<void> loadSubscriptionStatus(String botId) async {
    // Always refresh the data to ensure we have the latest status
    _currentBotId = botId;
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _subscriptionStatus =
          await _subscriptionService.checkSubscriptionStatus(botId);
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to load subscription status: ${e.toString()}';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Load performance overview for a specific bot
  Future<void> loadPerformanceOverview(String botId) async {
    _isLoadingPerformance = true;
    _performanceError = null;
    notifyListeners();

    try {
      final response =
          await _apiService.get('/api/bots/$botId/performance-overview');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          _performanceOverview = BotPerformanceOverview.fromJson(data['data']);
        } else {
          _performanceError =
              data['message'] ?? 'Failed to load performance overview';
        }
      } else {
        _performanceError =
            'Failed to load performance overview: ${response.statusCode}';
      }
    } catch (e) {
      _performanceError =
          'Failed to load performance overview: ${e.toString()}';
    } finally {
      _isLoadingPerformance = false;
      notifyListeners();
    }
  }

  /// Toggle subscription (subscribe if not subscribed, cancel if subscribed)
  Future<bool> toggleSubscription(String botId) async {
    if (_isToggling) return false;

    _isToggling = true;
    _error = null;
    notifyListeners();

    try {
      _subscriptionStatus =
          await _subscriptionService.toggleSubscription(botId);
      return true;
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to toggle subscription: ${e.toString()}';
      }
      return false;
    } finally {
      _isToggling = false;
      notifyListeners();
    }
  }

  /// Subscribe to a bot
  Future<bool> subscribeToBot(String botId) async {
    if (_isToggling) return false;

    _isToggling = true;
    _error = null;
    notifyListeners();

    try {
      _subscriptionStatus = await _subscriptionService.subscribeToBot(botId);
      return true;
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to subscribe to bot: ${e.toString()}';
      }
      return false;
    } finally {
      _isToggling = false;
      notifyListeners();
    }
  }

  /// Cancel subscription to a bot
  Future<bool> cancelSubscription(String subscriptionId) async {
    if (_isToggling) return false;

    _isToggling = true;
    _error = null;
    notifyListeners();

    try {
      _subscriptionStatus =
          await _subscriptionService.cancelSubscription(subscriptionId);
      return true;
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to cancel subscription: ${e.toString()}';
      }
      return false;
    } finally {
      _isToggling = false;
      notifyListeners();
    }
  }

  /// Refresh subscription status
  Future<void> refreshSubscriptionStatus() async {
    if (_currentBotId == null) return;
    await loadSubscriptionStatus(_currentBotId!);
  }

  /// Load all bot details (subscription status and performance overview)
  Future<void> loadBotDetails(String botId) async {
    _currentBotId = botId;
    // Load both subscription status and performance overview in parallel
    await Future.wait([
      loadSubscriptionStatus(botId),
      loadPerformanceOverview(botId),
    ]);
  }

  /// Clear any error messages
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
