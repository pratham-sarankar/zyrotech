// Package imports:

class Signal {
  final int tradeId;
  final String direction;
  final DateTime signalTime;
  final DateTime entryTime;
  final double entryPrice;
  final double stoploss;
  final double target1r;
  final double target2r;
  final DateTime exitTime;
  final double exitPrice;
  final String? exitReason;
  final double profitLoss;
  final double profitLossR;
  final int trailCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final BotInfo? bot;

  Signal({
    required this.tradeId,
    required this.direction,
    required this.signalTime,
    required this.entryTime,
    required this.entryPrice,
    required this.stoploss,
    required this.target1r,
    required this.target2r,
    required this.exitTime,
    required this.exitPrice,
    this.exitReason,
    required this.profitLoss,
    required this.profitLossR,
    required this.trailCount,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.bot,
  });

  factory Signal.fromMap(Map<String, dynamic> map) {
    return Signal(
      tradeId: map['tradeId'] as int? ?? 0,
      direction: map['direction'] as String? ?? 'LONG',
      signalTime: _parseDateTime(map['signalTime']),
      entryTime: _parseDateTime(map['entryTime']),
      entryPrice: (map['entryPrice'] as num?)?.toDouble() ?? 0.0,
      stoploss: (map['stoploss'] as num?)?.toDouble() ?? 0.0,
      target1r: (map['target1r'] as num?)?.toDouble() ?? 0.0,
      target2r: (map['target2r'] as num?)?.toDouble() ?? 0.0,
      exitTime: _parseDateTime(map['exitTime']),
      exitPrice: (map['exitPrice'] as num?)?.toDouble() ?? 0.0,
      exitReason: map['exitReason'] as String?,
      profitLoss: (map['profitLoss'] as num?)?.toDouble() ?? 0.0,
      profitLossR: (map['profitLossR'] as num?)?.toDouble() ?? 0.0,
      trailCount: map['trailCount'] as int? ?? 0,
      createdAt: _parseDateTime(map['createdAt']),
      updatedAt: _parseDateTime(map['updatedAt']),
      id: map['id'] as String? ?? '',
      bot: map['bot'] != null ? BotInfo.fromMap(map['bot']) : null,
    );
  }

  static DateTime _parseDateTime(dynamic dateValue) {
    if (dateValue == null) return DateTime.now();

    if (dateValue is String) {
      try {
        return DateTime.parse(dateValue);
      } catch (e) {
        return DateTime.now();
      }
    }

    return DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'tradeId': tradeId,
      'direction': direction,
      'signalTime': signalTime.toIso8601String(),
      'entryTime': entryTime.toIso8601String(),
      'entryPrice': entryPrice,
      'stoploss': stoploss,
      'target1r': target1r,
      'target2r': target2r,
      'exitTime': exitTime.toIso8601String(),
      'exitPrice': exitPrice,
      'exitReason': exitReason,
      'profitLoss': profitLoss,
      'profitLossR': profitLossR,
      'trailCount': trailCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'id': id,
      'bot': bot?.toMap(),
    };
  }

  bool get isClosed => true;

  bool get isSell => direction == "SHORT";

  double get profitAndLoss => profitLoss;
}

class BotInfo {
  final String id;
  final String name;

  BotInfo({
    required this.id,
    required this.name,
  });

  factory BotInfo.fromMap(Map<String, dynamic> map) {
    return BotInfo(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class PerformanceOverview {
  final int totalSignals;
  final int totalLongSignals;
  final int totalShortSignals;
  final double highestProfit;
  final double highestLoss;
  final double totalPnL;
  final int consecutiveWins;
  final int consecutiveLosses;

  PerformanceOverview({
    required this.totalSignals,
    required this.totalLongSignals,
    required this.totalShortSignals,
    required this.highestProfit,
    required this.highestLoss,
    required this.totalPnL,
    required this.consecutiveWins,
    required this.consecutiveLosses,
  });

  factory PerformanceOverview.fromMap(Map<String, dynamic> map) {
    return PerformanceOverview(
      totalSignals: map['totalSignals'] as int? ?? 0,
      totalLongSignals: map['totalLongSignals'] as int? ?? 0,
      totalShortSignals: map['totalShortSignals'] as int? ?? 0,
      highestProfit: (map['highestProfit'] as num?)?.toDouble() ?? 0.0,
      highestLoss: (map['highestLoss'] as num?)?.toDouble() ?? 0.0,
      totalPnL: (map['totalPnL'] as num?)?.toDouble() ?? 0.0,
      consecutiveWins: map['consecutiveWins'] as int? ?? 0,
      consecutiveLosses: map['consecutiveLosses'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalSignals': totalSignals,
      'totalLongSignals': totalLongSignals,
      'totalShortSignals': totalShortSignals,
      'highestProfit': highestProfit,
      'highestLoss': highestLoss,
      'totalPnL': totalPnL,
      'consecutiveWins': consecutiveWins,
      'consecutiveLosses': consecutiveLosses,
    };
  }

  /// Calculate win rate percentage
  /// Note: This is a simplified calculation. The API provides consecutive wins/losses
  /// but not total wins/losses. For accurate win rate, you'd need to calculate from signals.
  double get winRate {
    if (totalSignals == 0) return 0.0;
    // For now, we'll use a simple estimation based on consecutive wins
    // In a real implementation, you'd calculate this from the actual signals
    final estimatedWins = (consecutiveWins * 2).clamp(0, totalSignals);
    return (estimatedWins / totalSignals) * 100;
  }

  /// Calculate loss rate percentage
  /// Note: This is a simplified calculation. The API provides consecutive wins/losses
  /// but not total wins/losses. For accurate loss rate, you'd need to calculate from signals.
  double get lossRate {
    if (totalSignals == 0) return 0.0;
    // For now, we'll use a simple estimation based on consecutive losses
    // In a real implementation, you'd calculate this from the actual signals
    final estimatedLosses = (consecutiveLosses * 2).clamp(0, totalSignals);
    return (estimatedLosses / totalSignals) * 100;
  }

  /// Get the overall performance color
  bool get isProfitable => totalPnL > 0;
}

class PaginationInfo {
  final int currentPage;
  final int totalPages;
  final int totalSignals;
  final bool hasNextPage;
  final bool hasPrevPage;

  PaginationInfo({
    required this.currentPage,
    required this.totalPages,
    required this.totalSignals,
    required this.hasNextPage,
    required this.hasPrevPage,
  });

  factory PaginationInfo.fromMap(Map<String, dynamic> map) {
    return PaginationInfo(
      currentPage: map['currentPage'] as int? ?? 1,
      totalPages: map['totalPages'] as int? ?? 1,
      totalSignals: map['totalSignals'] as int? ?? 0,
      hasNextPage: map['hasNextPage'] as bool? ?? false,
      hasPrevPage: map['hasPrevPage'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentPage': currentPage,
      'totalPages': totalPages,
      'totalSignals': totalSignals,
      'hasNextPage': hasNextPage,
      'hasPrevPage': hasPrevPage,
    };
  }
}

class SignalsResponse {
  final List<Signal> signals;
  final PaginationInfo pagination;
  final PerformanceOverview? performanceOverview;

  SignalsResponse({
    required this.signals,
    required this.pagination,
    this.performanceOverview,
  });

  factory SignalsResponse.fromMap(Map<String, dynamic> map) {
    return SignalsResponse(
      signals: (map['data'] as List?)
              ?.map<Signal>((signal) => Signal.fromMap(signal))
              .toList() ??
          [],
      pagination: PaginationInfo.fromMap(map['pagination'] ?? {}),
      performanceOverview: map['performanceOverview'] != null
          ? PerformanceOverview.fromMap(map['performanceOverview'])
          : null,
    );
  }
}
