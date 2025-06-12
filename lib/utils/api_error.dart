class ApiError implements Exception {
  final String message;
  final String status;
  final String code;

  ApiError(this.message, this.status, this.code);

  factory ApiError.fromMap(Map<String, dynamic> map) {
    return ApiError(
      map['message'] ?? 'An error occurred',
      map['status'] ?? 'fail',
      map['code'] ?? 'unknown',
    );
  }

  factory ApiError.fromString(String message) {
    return ApiError(message, 'fail', 'unknown');
  }

  @override
  String toString() => message;
}
