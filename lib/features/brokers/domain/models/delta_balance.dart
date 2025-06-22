class DeltaBalance {
  final String asset;
  final double availableBalance;
  final int userId;

  DeltaBalance({
    required this.asset,
    required this.availableBalance,
    required this.userId,
  });

  factory DeltaBalance.fromJson(Map<String, dynamic> json) {
    return DeltaBalance(
      asset: json['asset'] as String,
      availableBalance: (json['available_balance'] as num).toDouble(),
      userId: json['user_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'available_balance': availableBalance,
      'user_id': userId,
    };
  }
}
