import 'bot_subscription.dart';

class BotSubscriptionStatus {
  final String botId;
  final bool isSubscribed;
  final BotSubscription? subscription;

  BotSubscriptionStatus({
    required this.botId,
    required this.isSubscribed,
    this.subscription,
  });

  factory BotSubscriptionStatus.fromJson(Map<String, dynamic> json) {
    return BotSubscriptionStatus(
      botId: json['botId'] as String,
      isSubscribed: json['isSubscribed'] ?? false,
      subscription: json['subscription'] != null
          ? BotSubscription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'botId': botId,
      'isSubscribed': isSubscribed,
      'subscription': subscription?.toJson(),
    };
  }
}
