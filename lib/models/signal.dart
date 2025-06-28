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

  SignalsResponse({
    required this.signals,
    required this.pagination,
  });

  factory SignalsResponse.fromMap(Map<String, dynamic> map) {
    return SignalsResponse(
      signals: (map['data'] as List?)
              ?.map<Signal>((signal) => Signal.fromMap(signal))
              .toList() ??
          [],
      pagination: PaginationInfo.fromMap(map['pagination'] ?? {}),
    );
  }
}
