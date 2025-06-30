import 'package:crowwn/features/user_signals/domain/models/user_signals_response.dart';
import 'package:crowwn/features/user_signals/domain/repositories/user_signals_repository.dart';
import 'package:crowwn/features/user_signals/data/services/user_signals_service.dart';

class UserSignalsRepositoryImpl implements UserSignalsRepository {
  final UserSignalsService _userSignalsService;

  UserSignalsRepositoryImpl({
    required UserSignalsService userSignalsService,
  }) : _userSignalsService = userSignalsService;

  @override
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
  }) async {
    return await _userSignalsService.getUserSignals(
      status: status,
      page: page,
      limit: limit,
      direction: direction,
      today: today,
      yesterday: yesterday,
      thisWeek: thisWeek,
      thisMonth: thisMonth,
      startDate: startDate,
      endDate: endDate,
      date: date,
    );
  }
}
