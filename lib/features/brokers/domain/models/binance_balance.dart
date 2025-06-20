class BinanceBalance {
  final double btcBalance;
  final double btcLocked;

  BinanceBalance({
    required this.btcBalance,
    required this.btcLocked,
  });

  factory BinanceBalance.fromJson(Map<String, dynamic> json) {
    return BinanceBalance(
      btcBalance: (json['btc_balance'] as num).toDouble(),
      btcLocked: (json['btc_locked'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'btc_balance': btcBalance,
      'btc_locked': btcLocked,
    };
  }
}
