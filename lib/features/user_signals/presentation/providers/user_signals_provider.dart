import 'package:crowwn/features/user_signals/domain/repositories/user_signals_repository.dart';
import 'package:crowwn/models/signal.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserSignalsProvider extends ChangeNotifier {
  final UserSignalsRepository _userSignalsRepository;

  UserSignalsProvider({
    required UserSignalsRepository userSignalsRepository,
  }) : _userSignalsRepository = userSignalsRepository;

  // State for both tabs
  Map<String, List<dynamic>> _signals = {'opened': [], 'closed': []};
  Map<String, bool> _isLoading = {'opened': false, 'closed': false};
  Map<String, bool> _isLoadingMore = {'opened': false, 'closed': false};
  Map<String, String?> _error = {'opened': null, 'closed': null};
  Map<String, PerformanceOverview?> _performanceOverview = {
    'opened': null,
    'closed': null
  };
  Map<String, int> _activeBotsCount = {'opened': 0, 'closed': 0};

  // Pagination state for both tabs
  Map<String, int> _currentPage = {'opened': 1, 'closed': 1};
  Map<String, int> _totalPages = {'opened': 1, 'closed': 1};
  Map<String, int> _totalSignals = {'opened': 0, 'closed': 0};
  Map<String, bool> _hasNextPage = {'opened': false, 'closed': false};
  Map<String, bool> _hasPrevPage = {'opened': false, 'closed': false};
  static const int _pageSize = 20;

  // Filter state (shared between tabs)
  String? _direction;
  String? _today;
  String? _yesterday;
  String? _thisWeek;
  String? _thisMonth;
  String? _startDate;
  String? _endDate;
  String? _date;

  // Getters
  List<dynamic> getSignals(String status) => _signals[status] ?? [];
  bool isLoading(String status) => _isLoading[status] ?? false;
  bool isLoadingMore(String status) => _isLoadingMore[status] ?? false;
  String? getError(String status) => _error[status];
  PerformanceOverview? getPerformanceOverview(String status) =>
      _performanceOverview[status];
  int getActiveBotsCount(String status) => _activeBotsCount[status] ?? 0;

  // Pagination getters
  int getCurrentPage(String status) => _currentPage[status] ?? 1;
  int getTotalPages(String status) => _totalPages[status] ?? 1;
  int getTotalSignals(String status) => _totalSignals[status] ?? 0;
  bool hasNextPage(String status) => _hasNextPage[status] ?? false;
  bool hasPrevPage(String status) => _hasPrevPage[status] ?? false;
  bool canLoadMore(String status) =>
      hasNextPage(status) && !isLoadingMore(status);

  // Filter getters
  String? get direction => _direction;
  String? get today => _today;
  String? get yesterday => _yesterday;
  String? get thisWeek => _thisWeek;
  String? get thisMonth => _thisMonth;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get date => _date;

  /// Set date filter
  void setDateFilter({
    String? direction,
    String? today,
    String? yesterday,
    String? thisWeek,
    String? thisMonth,
    String? startDate,
    String? endDate,
    String? date,
  }) {
    _direction = direction;
    _today = today;
    _yesterday = yesterday;
    _thisWeek = thisWeek;
    _thisMonth = thisMonth;
    _startDate = startDate;
    _endDate = endDate;
    _date = date;
    notifyListeners();
  }

  /// Set boolean date filters with proper API values
  void setBooleanDateFilters({
    bool? today,
    bool? yesterday,
    bool? thisWeek,
    bool? thisMonth,
  }) {
    _today = today == true ? 'yes' : null;
    _yesterday = yesterday == true ? 'yes' : null;
    _thisWeek = thisWeek == true ? 'yes' : null;
    _thisMonth = thisMonth == true ? 'yes' : null;
    notifyListeners();
  }

  /// Clear all filters
  void clearFilters() {
    _direction = null;
    _today = null;
    _yesterday = null;
    _thisWeek = null;
    _thisMonth = null;
    _startDate = null;
    _endDate = null;
    _date = null;
    notifyListeners();
  }

  /// Check if any filters are active
  bool get hasActiveFilters {
    return _direction != null ||
        _today != null ||
        _yesterday != null ||
        _thisWeek != null ||
        _thisMonth != null ||
        _startDate != null ||
        _endDate != null ||
        _date != null;
  }

  /// Fetch signals for a specific status (opened/closed)
  Future<void> fetchUserSignals(String status) async {
    _isLoading[status] = true;
    _error[status] = null;
    _currentPage[status] = 1;
    _signals[status] = [];
    _performanceOverview[status] = null;
    notifyListeners();

    try {
      final response = await _userSignalsRepository.getUserSignals(
        status: status,
        page: _currentPage[status]!,
        limit: _pageSize,
        direction: _direction,
        today: _today,
        yesterday: _yesterday,
        thisWeek: _thisWeek,
        thisMonth: _thisMonth,
        startDate: _startDate,
        endDate: _endDate,
        date: _date,
      );

      _signals[status] = response.signals;
      _performanceOverview[status] = response.performanceOverview;
      _activeBotsCount[status] = response.activeBotsCount;
      _updatePaginationState(status, response.pagination);
    } catch (e) {
      if (e is ApiError) {
        _error[status] = e.message;
      } else {
        _error[status] = 'Failed to fetch signals: ${e.toString()}';
      }
    } finally {
      _isLoading[status] = false;
      notifyListeners();
    }
  }

  /// Load more signals for a specific status
  Future<void> loadMoreUserSignals(String status) async {
    if (!hasNextPage(status) || isLoadingMore(status)) return;

    _isLoadingMore[status] = true;
    notifyListeners();

    try {
      final response = await _userSignalsRepository.getUserSignals(
        status: status,
        page: _currentPage[status]! + 1,
        limit: _pageSize,
        direction: _direction,
        today: _today,
        yesterday: _yesterday,
        thisWeek: _thisWeek,
        thisMonth: _thisMonth,
        startDate: _startDate,
        endDate: _endDate,
        date: _date,
      );

      _signals[status]!.addAll(response.signals);
      _currentPage[status] = _currentPage[status]! + 1;
      _updatePaginationState(status, response.pagination);
    } catch (e) {
      if (e is ApiError) {
        _error[status] = e.message;
      } else {
        _error[status] = 'Failed to load more signals: ${e.toString()}';
      }
    } finally {
      _isLoadingMore[status] = false;
      notifyListeners();
    }
  }

  /// Refresh signals for a specific status
  Future<void> refreshUserSignals(String status) async {
    await fetchUserSignals(status);
  }

  /// Clear any error messages for a specific status
  void clearError(String status) {
    _error[status] = null;
    notifyListeners();
  }

  /// Update pagination state from response
  void _updatePaginationState(String status, dynamic pagination) {
    _currentPage[status] = pagination.currentPage;
    _totalPages[status] = pagination.totalPages;
    _totalSignals[status] = pagination.totalSignals;
    _hasNextPage[status] = pagination.hasNextPage;
    _hasPrevPage[status] = pagination.hasPrevPage;
  }

  /// Get signals filtered by direction for a specific status
  List<dynamic> getSignalsByDirection(String status, String direction) {
    final signals = getSignals(status);
    return signals.where((signal) => signal.direction == direction).toList();
  }

  /// Get profitable signals for a specific status
  List<dynamic> getProfitableSignals(String status) {
    final signals = getSignals(status);
    return signals.where((signal) => signal.profitLoss > 0).toList();
  }

  /// Get losing signals for a specific status
  List<dynamic> getLosingSignals(String status) {
    final signals = getSignals(status);
    return signals.where((signal) => signal.profitLoss < 0).toList();
  }

  /// Calculate total PnL for a specific status
  double getTotalPnL(String status) {
    final signals = getSignals(status);
    return signals.fold(0.0, (sum, signal) => sum + signal.profitLoss);
  }

  /// Calculate win rate for a specific status
  double getWinRate(String status) {
    final signals = getSignals(status);
    if (signals.isEmpty) return 0.0;
    final wins = signals.where((signal) => signal.profitLoss > 0).length;
    return (wins / signals.length) * 100;
  }

  /// Calculate average ROI for a specific status
  double getAverageROI(String status) {
    final signals = getSignals(status);
    if (signals.isEmpty) return 0.0;
    final totalROI =
        signals.fold(0.0, (sum, signal) => sum + signal.profitLossR);
    return totalROI / signals.length;
  }
}
