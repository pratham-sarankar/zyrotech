class KYCBasicDetails {
  final String fullName;
  final DateTime dob;
  final String gender;
  final String pan;
  final String? aadharNumber;

  KYCBasicDetails({
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.pan,
    this.aadharNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'dob': dob.toIso8601String().split('T')[0], // Format as YYYY-MM-DD
      'gender': gender,
      'pan': pan,
      if (aadharNumber != null) 'aadharNumber': aadharNumber,
    };
  }

  factory KYCBasicDetails.fromJson(Map<String, dynamic> json) {
    return KYCBasicDetails(
      fullName: json['fullName'] as String,
      dob: DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String,
      pan: json['pan'] as String,
      aadharNumber: json['aadharNumber'] as String?,
    );
  }
}
