// Package imports:
import 'package:intl/intl.dart';

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
  final double? profitLoss;
  final double? profitLossR;
  final int trailCount;

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
    this.profitLoss,
    this.profitLossR,
    required this.trailCount,
  });

  factory Signal.fromMap(Map<String, dynamic> map) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    return Signal(
      tradeId: map['trade_id'] as int,
      direction: map['direction'] as String,
      signalTime: dateFormat.parse(map['signal_time'] as String),
      entryTime: dateFormat.parse(map['entry_time'] as String),
      entryPrice: (map['entry_price'] as num).toDouble(),
      stoploss: (map['stoploss'] as num).toDouble(),
      target1r: (map['target_1r'] as num).toDouble(),
      target2r: (map['target_2r'] as num).toDouble(),
      exitTime: dateFormat.parse(map['exit_time'] as String),
      exitPrice: (map['exit_price'] as num).toDouble(),
      exitReason: map['exit_reason'] as String?,
      profitLoss: map['profit_loss'] != null
          ? (map['profit_loss'] as num).toDouble()
          : null,
      profitLossR: map['profit_loss_r'] != null
          ? (map['profit_loss_r'] as num).toDouble()
          : null,
      trailCount: map['trail_count'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    return {
      'trade_id': tradeId,
      'direction': direction,
      'signal_time': dateFormat.format(signalTime),
      'entry_time': dateFormat.format(entryTime),
      'entry_price': entryPrice,
      'stoploss': stoploss,
      'target_1r': target1r,
      'target_2r': target2r,
      'exit_time': dateFormat.format(exitTime),
      'exit_price': exitPrice,
      'exit_reason': exitReason,
      'profit_loss': profitLoss,
      'profit_loss_r': profitLossR,
      'trail_count': trailCount,
    };
  }

  bool get isClosed => true;

  bool get isSell => direction == "SHORT";
  double get profitAndLoss {
    if (isSell) {
      return entryPrice - exitPrice;
    } else {
      return exitPrice - entryPrice;
    }
  }
}
