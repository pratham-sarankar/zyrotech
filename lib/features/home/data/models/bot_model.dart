// Project imports:
import 'package:crowwn/utils/api_error.dart';

class BotModel {
  final String id;
  final String name;
  final String html;
  final DateTime createdAt;
  final DateTime updatedAt;

  BotModel({
    required this.id,
    required this.name,
    required this.html,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BotModel.fromJson(Map<String, dynamic> json) {
    try {
      return BotModel(
        id: json['id'] as String,
        name: json['name'] as String,
        html: json['html'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
    } catch (e) {
      throw ApiError.fromString(
        'Failed to parse bot data',
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'html': html,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
