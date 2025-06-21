import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../data/models/bot_subscription_status.dart';
import '../../data/services/bot_subscription_service.dart';
import '../../../../utils/api_error.dart';

class BotDetailsProvider extends ChangeNotifier {
  final BotSubscriptionService _subscriptionService;

  BotDetailsProvider({
    required BotSubscriptionService subscriptionService,
  }) : _subscriptionService = subscriptionService;

  BotSubscriptionStatus? _subscriptionStatus;
  bool _isLoading = false;
  bool _isToggling = false;
  String? _error;
  String? _currentBotId;

  // Getters
  BotSubscriptionStatus? get subscriptionStatus => _subscriptionStatus;
  bool get isLoading => _isLoading;
  bool get isToggling => _isToggling;
  String? get error => _error;
  bool get isSubscribed => _subscriptionStatus?.isSubscribed ?? false;
  String? get currentBotId => _currentBotId;

  /// Load subscription status for a specific bot
  Future<void> loadSubscriptionStatus(String botId) async {
    if (_currentBotId == botId && _subscriptionStatus != null) {
      return; // Already loaded for this bot
    }

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

  /// Clear any error messages
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
