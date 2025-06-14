import '../../domain/enums/kyc_status.dart';

class KYCResponse {
  final String status;
  final Map<String, dynamic> data;

  KYCResponse({
    required this.status,
    required this.data,
  });

  factory KYCResponse.fromJson(Map<String, dynamic> json) {
    return KYCResponse(
      status: json['status'] ?? '',
      data: json['data'] ?? {},
    );
  }

  KYCStatus get kycStatus {
    if (status != 'success') {
      return KYCStatus.notFound;
    }

    final kycData = data;
    if (kycData.isEmpty) {
      return KYCStatus.notFound;
    }

    final kycStatusValue = kycData['status'] as String?;
    if (kycStatusValue == null) {
      return KYCStatus.notFound;
    }

    switch (kycStatusValue) {
      case 'in_progress':
        return KYCStatus.inProgress;
      case 'completed':
        return KYCStatus.completed;
      case 'rejected':
        return KYCStatus.rejected;
      case 'pending':
        return KYCStatus.pending;
      default:
        return KYCStatus.notFound;
    }
  }

  bool get isBasicDetailsVerified => data['basicDetails']?['isVerified'] ?? false;
  bool get isRiskProfilingVerified => data['riskProfiling']?['isVerified'] ?? false;
  bool get isCapitalManagementVerified => data['capitalManagement']?['isVerified'] ?? false;
  bool get isExperienceVerified => data['experience']?['isVerified'] ?? false;

  String get basicDetailsStatus => data['basicDetails']?['verificationStatus'] ?? 'pending';
  String get riskProfilingStatus => data['riskProfiling']?['verificationStatus'] ?? 'pending';
  String get capitalManagementStatus => data['capitalManagement']?['verificationStatus'] ?? 'pending';
  String get experienceStatus => data['experience']?['verificationStatus'] ?? 'pending';
} 