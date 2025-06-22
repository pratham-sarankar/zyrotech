class DeltaCredentials {
  final String apiKey;
  final String apiSecret;

  DeltaCredentials({
    required this.apiKey,
    required this.apiSecret,
  });

  Map<String, dynamic> toJson() {
    return {
      'api_key': apiKey,
      'api_secret': apiSecret,
    };
  }

  factory DeltaCredentials.fromJson(Map<String, dynamic> json) {
    return DeltaCredentials(
      apiKey: json['api_key'] as String,
      apiSecret: json['api_secret'] as String,
    );
  }
}
