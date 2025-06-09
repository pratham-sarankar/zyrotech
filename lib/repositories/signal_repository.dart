// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:crowwn/models/signal.dart';
import 'package:crowwn/repositories/repository.dart';

class SignalRepository extends Repository {
  Future<List<Signal>> getSignalsByBotId(String id) async {
    final response =
        await http.get(Uri.parse("$baseURL/trade-log-json?mode=live"));
    final result = jsonDecode(response.body);
    if (result['status'] == 'success') {
      final signals = result['trades'];
      return signals.map<Signal>((signal) => Signal.fromMap(signal)).toList();
    } else {
      throw Exception('Error fetching the signals');
    }
  }
}
