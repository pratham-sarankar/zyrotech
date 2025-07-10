import 'package:flutter/material.dart';

class BotPerformanceOverview {
  final int totalTrades;
  final double totalReturn;
  final double winRate;
  final double profitFactor;

  BotPerformanceOverview({
    required this.totalTrades,
    required this.totalReturn,
    required this.winRate,
    required this.profitFactor,
  });

  factory BotPerformanceOverview.fromJson(Map<String, dynamic> json) {
    try {
      return BotPerformanceOverview(
        totalTrades: json['totalTrades'] as int,
        totalReturn: (json['totalReturn'] as num).toDouble(),
        winRate: (json['winRate'] as num).toDouble(),
        profitFactor: (json['profitFactor'] as num).toDouble(),
      );
    } catch (e) {
      throw Exception('Failed to parse bot performance overview: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'totalTrades': totalTrades,
      'totalReturn': totalReturn,
      'winRate': winRate,
      'profitFactor': profitFactor,
    };
  }

  // Helper methods for UI formatting
  String get formattedTotalReturn {
    final prefix = totalReturn >= 0 ? '+' : '';
    return '$prefix${totalReturn.toStringAsFixed(2)}%';
  }

  String get formattedWinRate {
    return '${winRate.toStringAsFixed(1)}%';
  }

  String get formattedProfitFactor {
    return profitFactor.toStringAsFixed(2);
  }

  // Helper methods for determining colors
  Color get totalReturnColor {
    return totalReturn >= 0 ? Colors.green : Colors.red;
  }

  Color get winRateColor {
    if (winRate >= 70) return Colors.green;
    if (winRate >= 50) return Colors.orange;
    return Colors.red;
  }

  Color get profitFactorColor {
    if (profitFactor >= 1.5) return Colors.green;
    if (profitFactor >= 1.0) return Colors.orange;
    return Colors.red;
  }

  IconData get totalReturnIcon {
    return totalReturn >= 0 ? Icons.trending_up : Icons.trending_down;
  }

  IconData get winRateIcon {
    if (winRate >= 70) return Icons.analytics;
    if (winRate >= 50) return Icons.analytics_outlined;
    return Icons.analytics_outlined;
  }

  IconData get profitFactorIcon {
    if (profitFactor >= 1.5) return Icons.security;
    if (profitFactor >= 1.0) return Icons.security_outlined;
    return Icons.warning;
  }
}
