class SignUpResponse {
  final String message;
  final String userId;

  SignUpResponse({
    required this.message,
    required this.userId,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'],
      userId: json['userId'],
    );
  }
}
