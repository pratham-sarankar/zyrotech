import '../models/kyc_basic_details.dart';

abstract class KYCRepository {
  /// Submits basic KYC details to the server
  /// Returns a map containing the response data
  /// Throws [ApiError] if the request fails
  Future<Map<String, dynamic>> submitBasicDetails(KYCBasicDetails details);

  /// Submits risk profiling answers to the server
  /// Returns a map containing the response data
  /// Throws [ApiError] if the request fails
  Future<Map<String, dynamic>> submitRiskProfiling(
      List<Map<String, String>> questionsAndAnswers);

  /// Submits capital management preferences to the server
  /// Returns a map containing the response data
  /// Throws [ApiError] if the request fails
  Future<Map<String, dynamic>> submitCapitalManagement(
      List<Map<String, String>> questionsAndAnswers);

  /// Submits experience and investment preferences to the server
  /// Returns a map containing the response data
  /// Throws [ApiError] if the request fails
  Future<Map<String, dynamic>> submitExperience(
      List<Map<String, String>> questionsAndAnswers);
}
