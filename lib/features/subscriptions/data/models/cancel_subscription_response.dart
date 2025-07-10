class CancelSubscriptionResponse {
  final String userId;
  final String botId;
  final String status;
  final DateTime subscribedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime cancelledAt;
  final String id;

  CancelSubscriptionResponse({
    required this.userId,
    required this.botId,
    required this.status,
    required this.subscribedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.cancelledAt,
    required this.id,
  });

  factory CancelSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    try {
      return CancelSubscriptionResponse(
        userId: json['userId'] as String,
        botId: json['botId'] as String,
        status: json['status'] as String,
        subscribedAt: DateTime.parse(json['subscribedAt'] as String),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        cancelledAt: DateTime.parse(json['cancelledAt'] as String),
        id: json['id'] as String,
      );
    } catch (e) {
      throw Exception('Failed to parse cancel subscription response: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'botId': botId,
      'status': status,
      'subscribedAt': subscribedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'cancelledAt': cancelledAt.toIso8601String(),
      'id': id,
    };
  }
}
