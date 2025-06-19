// Project imports:
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:crowwn/utils/api_error.dart';

abstract class BotRepository {
  /// Fetches all available bots
  /// Returns a list of [BotModel] containing the bots data
  /// Throws [ApiError] if the request fails
  Future<List<BotModel>> getBots();
}
