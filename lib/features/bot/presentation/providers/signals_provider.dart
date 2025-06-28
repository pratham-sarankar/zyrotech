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
  bool _isLoadingMore = false;
  String? _error;
  String? _currentBotId;

  // Pagination state
  int _currentPage = 1;
  int _totalPages = 1;
  int _totalSignals = 0;
  bool _hasNextPage = false;
  bool _hasPrevPage = false;
  static const int _pageSize = 20;

  // Getters
  List<Signal> get signals => _signals;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get error => _error;
  String? get currentBotId => _currentBotId;

  // Pagination getters
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  int get totalSignals => _totalSignals;
  bool get hasNextPage => _hasNextPage;
  bool get hasPrevPage => _hasPrevPage;
  bool get canLoadMore => _hasNextPage && !_isLoadingMore;

  /// Fetch signals for a specific bot (first page)
  Future<void> fetchSignalsByBotId(String botId) async {
    _isLoading = true;
    _error = null;
    _currentBotId = botId;
    _currentPage = 1;
    _signals.clear();
    notifyListeners();

    try {
      final response = await _signalRepository.getSignalsByBotId(
        botId,
        page: _currentPage,
        limit: _pageSize,
      );

      _signals = response.signals;
      _updatePaginationState(response.pagination);
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

  /// Load more signals for the current bot
  Future<void> loadMoreSignals() async {
    if (!_hasNextPage || _isLoadingMore || _currentBotId == null) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final response = await _signalRepository.getSignalsByBotId(
        _currentBotId!,
        page: _currentPage + 1,
        limit: _pageSize,
      );

      _signals.addAll(response.signals);
      _currentPage++;
      _updatePaginationState(response.pagination);
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to load more signals: ${e.toString()}';
      }
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  /// Fetch all signals (first page)
  Future<void> fetchAllSignals() async {
    _isLoading = true;
    _error = null;
    _currentBotId = null;
    _currentPage = 1;
    _signals.clear();
    notifyListeners();

    try {
      final response = await _signalRepository.getAllSignals(
        page: _currentPage,
        limit: _pageSize,
      );

      _signals = response.signals;
      _updatePaginationState(response.pagination);
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

  /// Load more signals for all signals
  Future<void> loadMoreAllSignals() async {
    if (!_hasNextPage || _isLoadingMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final response = await _signalRepository.getAllSignals(
        page: _currentPage + 1,
        limit: _pageSize,
      );

      _signals.addAll(response.signals);
      _currentPage++;
      _updatePaginationState(response.pagination);
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to load more signals: ${e.toString()}';
      }
    } finally {
      _isLoadingMore = false;
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

  /// Update pagination state from response
  void _updatePaginationState(PaginationInfo pagination) {
    _currentPage = pagination.currentPage;
    _totalPages = pagination.totalPages;
    _totalSignals = pagination.totalSignals;
    _hasNextPage = pagination.hasNextPage;
    _hasPrevPage = pagination.hasPrevPage;
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
