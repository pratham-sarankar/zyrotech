// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:crowwn/models/signal.dart';

class Bot {
  final String name;
  final String description;
  final String winRate;
  final String profit;
  final String pair;
  final String strategy;
  final String riskLevel;
  final Color profitColor;
  final List<Signal> signals;

  Bot({
    required this.name,
    required this.description,
    required this.winRate,
    required this.profit,
    required this.pair,
    required this.strategy,
    required this.riskLevel,
    required this.profitColor,
    required this.signals,
  });
}
