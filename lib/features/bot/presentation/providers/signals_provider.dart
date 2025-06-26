import 'package:crowwn/models/signal.dart';
import 'package:crowwn/repositories/signal_repository.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignalsProvider extends ChangeNotifier {
  final SignalRepository _signalRepository;

  SignalsProvider({
    required SignalRepository signalRepository,
  }) : _signalRepository = signalRepository;

  List<Signal> _signals = [];
  bool _isLoading = false;
  String? _error;
  String? _currentBotId;

  // Getters
  List<Signal> get signals => _signals;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get currentBotId => _currentBotId;

  /// Fetch signals for a specific bot
  Future<void> fetchSignalsByBotId(String botId) async {
    _isLoading = true;
    _error = null;
    _currentBotId = botId;
    notifyListeners();

    try {
      _signals = await _signalRepository.getSignalsByBotId(botId);
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to fetch signals: ${e.toString()}';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch all signals
  Future<void> fetchAllSignals() async {
    _isLoading = true;
    _error = null;
    _currentBotId = null;
    notifyListeners();

    try {
      _signals = await _signalRepository.getAllSignals();
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to fetch signals: ${e.toString()}';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Refresh signals (re-fetch current data)
  Future<void> refreshSignals() async {
    if (_currentBotId != null) {
      await fetchSignalsByBotId(_currentBotId!);
    } else {
      await fetchAllSignals();
    }
  }

  /// Clear any error messages
  void clearError() {
    _error = null;
    notifyListeners();
  }

  /// Get signals filtered by direction
  List<Signal> getSignalsByDirection(String direction) {
    return _signals.where((signal) => signal.direction == direction).toList();
  }

  /// Get profitable signals
  List<Signal> get profitableSignals {
    return _signals.where((signal) => signal.profitLoss > 0).toList();
  }

  /// Get losing signals
  List<Signal> get losingSignals {
    return _signals.where((signal) => signal.profitLoss < 0).toList();
  }

  /// Calculate total PnL
  double get totalPnL {
    return _signals.fold(0.0, (sum, signal) => sum + signal.profitLoss);
  }

  /// Calculate win rate
  double get winRate {
    if (_signals.isEmpty) return 0.0;
    final wins = _signals.where((signal) => signal.profitLoss > 0).length;
    return (wins / _signals.length) * 100;
  }

  /// Calculate average ROI
  double get averageROI {
    if (_signals.isEmpty) return 0.0;
    final totalROI =
        _signals.fold(0.0, (sum, signal) => sum + signal.profitLossR);
    return totalROI / _signals.length;
  }
}
