// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:crowwn/services/api_service.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:crowwn/features/home/domain/repositories/bot_repository.dart';

class BotRepositoryImpl implements BotRepository {
  final ApiService _apiService;

  BotRepositoryImpl(this._apiService);

  @override
  Future<List<BotModel>> getBots() async {
    final response = await _apiService.get('/api/bots');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> botsData = data['data'] as List<dynamic>;
      return botsData.map((botJson) => BotModel.fromJson(botJson)).toList();
    } else {
      throw ApiError.fromMap(jsonDecode(response.body));
    }
  }
}
