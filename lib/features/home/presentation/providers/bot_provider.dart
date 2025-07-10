import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:crowwn/services/api_service.dart';

class BotProvider extends ChangeNotifier {
  final ApiService _apiService;

  BotProvider(this._apiService);

  List<BotModel> _bots = [];
  bool _isLoading = false;
  String? _error;

  List<BotModel> get bots => _bots;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchBotsByGroup(String groupId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.get('/api/bots?groupId=$groupId');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          final botsList = data['data'] as List;
          _bots =
              botsList.map((botJson) => BotModel.fromJson(botJson)).toList();
        } else {
          _error = data['message'] ?? 'Failed to fetch bots';
        }
      } else {
        _error = 'Failed to fetch bots: ${response.statusCode}';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearBots() {
    _bots = [];
    _error = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  List<BotModel> getBotsByGroup(String groupName) {
    return _bots.where((bot) => bot.group.name == groupName).toList();
  }
}
