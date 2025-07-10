import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/features/subscriptions/data/models/subscription_bot_model.dart';

class SubscriptionModel {
  final String id;
  final String userId;
  final String status;
  final DateTime subscribedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? cancelledAt;
  final SubscriptionBotModel bot;

  SubscriptionModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.subscribedAt,
    required this.createdAt,
    required this.updatedAt,
    this.cancelledAt,
    required this.bot,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    try {
      return SubscriptionModel(
        id: json['id'] as String,
        userId: json['userId'] as String,
        status: json['status'] as String,
        subscribedAt: DateTime.parse(json['subscribedAt'] as String),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        cancelledAt: json['cancelledAt'] != null
            ? DateTime.parse(json['cancelledAt'] as String)
            : null,
        bot: SubscriptionBotModel.fromJson(json['bot'] as Map<String, dynamic>),
      );
    } catch (e) {
      throw ApiError.fromString('Failed to parse subscription data: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status,
      'subscribedAt': subscribedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'cancelledAt': cancelledAt?.toIso8601String(),
      'bot': bot.toJson(),
    };
  }
}
