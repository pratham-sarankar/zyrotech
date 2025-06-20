class BinanceCredentials {
  final String apiKey;
  final String apiSecret;

  BinanceCredentials({
    required this.apiKey,
    required this.apiSecret,
  });

  Map<String, dynamic> toJson() {
    return {
      'api_key': apiKey,
      'api_secret': apiSecret,
    };
  }

  factory BinanceCredentials.fromJson(Map<String, dynamic> json) {
    return BinanceCredentials(
      apiKey: json['api_key'] as String,
      apiSecret: json['api_secret'] as String,
    );
  }
}
