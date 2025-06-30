import 'package:crowwn/models/signal.dart';

class UserSignalsResponse {
  final List<Signal> signals;
  final int activeBotsCount;
  final PerformanceOverview? performanceOverview;
  final PaginationInfo pagination;

  UserSignalsResponse({
    required this.signals,
    required this.activeBotsCount,
    this.performanceOverview,
    required this.pagination,
  });
}
