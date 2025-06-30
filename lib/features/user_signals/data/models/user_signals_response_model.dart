import 'package:crowwn/models/signal.dart';
import 'package:crowwn/features/user_signals/domain/models/user_signals_response.dart';

class UserSignalsResponseModel extends UserSignalsResponse {
  UserSignalsResponseModel({
    required super.signals,
    required super.activeBotsCount,
    super.performanceOverview,
    required super.pagination,
  });

  factory UserSignalsResponseModel.fromMap(Map<String, dynamic> map) {
    return UserSignalsResponseModel(
      signals: (map['data'] as List?)
              ?.map<Signal>((signal) => Signal.fromMap(signal))
              .toList() ??
          [],
      activeBotsCount: map['activeBotsCount'] as int? ?? 0,
      performanceOverview: map['performanceOverview'] != null
          ? PerformanceOverview.fromMap(map['performanceOverview'])
          : null,
      pagination: PaginationInfo.fromMap(map['pagination'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': signals.map((signal) => signal.toMap()).toList(),
      'activeBotsCount': activeBotsCount,
      'performanceOverview': performanceOverview?.toMap(),
      'pagination': pagination.toMap(),
    };
  }
}
