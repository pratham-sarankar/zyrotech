import 'package:crowwn/features/user_signals/domain/models/user_signals_response.dart';

abstract class UserSignalsRepository {
  Future<UserSignalsResponse> getUserSignals({
    required String status,
    int page = 1,
    int limit = 20,
    String? direction,
    String? today,
    String? yesterday,
    String? thisWeek,
    String? thisMonth,
    String? startDate,
    String? endDate,
    String? date,
  });
}
