import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crowwn/features/subscriptions/data/models/subscription_model.dart';
import 'package:crowwn/features/subscriptions/data/models/cancel_subscription_response.dart';
import 'package:crowwn/services/api_service.dart';

class SubscriptionsProvider extends ChangeNotifier {
  final ApiService _apiService;

  SubscriptionsProvider(this._apiService);

  List<SubscriptionModel> _subscriptions = [];
  bool _isLoading = false;
  String? _error;
  String? _currentStatus;

  List<SubscriptionModel> get subscriptions => _subscriptions;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get currentStatus => _currentStatus;

  Future<void> fetchSubscriptions({String? status}) async {
    try {
      _isLoading = true;
      _error = null;
      _currentStatus = status;
      notifyListeners();

      String endpoint = '/api/subscriptions';
      if (status != null && status != 'all') {
        endpoint += '?status=$status';
      }

      final response = await _apiService.get(endpoint);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          final subscriptionsList = data['data'] as List;
          _subscriptions = subscriptionsList
              .map((subJson) => SubscriptionModel.fromJson(subJson))
              .toList();
        } else {
          _error = data['message'] ?? 'Failed to fetch subscriptions';
        }
      } else {
        _error = 'Failed to fetch subscriptions: ${response.statusCode}';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> cancelSubscription(String subscriptionId) async {
    try {
      final response = await _apiService.put(
        '/api/subscriptions/$subscriptionId/cancel',
        body: '{}', // Empty body as per API specification
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          // Parse the cancel response
          final cancelResponse =
              CancelSubscriptionResponse.fromJson(data['data']);

          // Update the subscription status in the list
          final index =
              _subscriptions.indexWhere((sub) => sub.id == subscriptionId);
          if (index != -1) {
            // Update the existing subscription with new status and cancelledAt
            final existingSubscription = _subscriptions[index];
            final updatedSubscription = SubscriptionModel(
              id: cancelResponse.id,
              userId: cancelResponse.userId,
              status: cancelResponse.status,
              subscribedAt: cancelResponse.subscribedAt,
              createdAt: cancelResponse.createdAt,
              updatedAt: cancelResponse.updatedAt,
              cancelledAt: cancelResponse.cancelledAt,
              bot: existingSubscription.bot, // Keep the existing bot data
            );
            _subscriptions[index] = updatedSubscription;
            notifyListeners();
          }
          return true;
        } else {
          _error = data['message'] ?? 'Failed to cancel subscription';
          notifyListeners();
          return false;
        }
      } else if (response.statusCode == 404) {
        _error = 'Subscription not found or endpoint does not exist';
        notifyListeners();
        return false;
      } else if (response.statusCode == 400) {
        _error = 'Bad request: ${response.body}';
        notifyListeners();
        return false;
      } else if (response.statusCode == 401) {
        _error = 'Unauthorized: Please log in again';
        notifyListeners();
        return false;
      } else if (response.statusCode == 403) {
        _error =
            'Forbidden: You do not have permission to cancel this subscription';
        notifyListeners();
        return false;
      } else {
        _error =
            'Failed to cancel subscription: ${response.statusCode} - ${response.body}';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  List<SubscriptionModel> getSubscriptionsByStatus(String status) {
    if (status == 'all') {
      return _subscriptions;
    }
    return _subscriptions.where((sub) => sub.status == status).toList();
  }
}
