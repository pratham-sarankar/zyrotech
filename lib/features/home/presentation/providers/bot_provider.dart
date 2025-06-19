import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/features/home/domain/repositories/bot_repository.dart';

class BotProvider extends ChangeNotifier {
  final BotRepository _repository;
  List<BotModel> _bots = [];
  bool _isLoading = false;
  String? _error;

  BotProvider(this._repository);

  List<BotModel> get bots => _bots;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchBots({bool force = false}) async {
    if (_bots.isNotEmpty && !force)
      return; // Return cached bots if available and not forcing refresh

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _bots = await _repository.getBots();
    } on ApiError catch (e) {
      _error = e.message;
    } catch (e) {
      _error = 'An unexpected error occurred';
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
}
