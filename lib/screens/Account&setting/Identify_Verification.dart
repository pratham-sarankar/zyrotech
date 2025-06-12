// Flutter imports:
import 'package:crowwn/features/onboarding/kyc/kyc_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../Dark mode.dart';
import '../config/common.dart';

enum VerificationStatus { incomplete, pending, rejected, completed }

class Identify_Verification extends StatefulWidget {
  const Identify_Verification({super.key});

  @override
  State<Identify_Verification> createState() => _Identify_VerificationState();
}

class _Identify_VerificationState extends State<Identify_Verification> {
  ColorNotifire notifier = ColorNotifire();
  // TODO: Replace with actual verification status from your backend
  VerificationStatus personalStatus = VerificationStatus.incomplete;
  VerificationStatus kycStatus = VerificationStatus.incomplete;

  String _getStatusText(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.incomplete:
        return "Incomplete";
      case VerificationStatus.pending:
        return "Incomplete";
      case VerificationStatus.rejected:
        return "Rejected";
      case VerificationStatus.completed:
        return "Completed";
    }
  }

  Color _getStatusColor(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.incomplete:
        return Colors.grey;
      case VerificationStatus.pending:
        return Colors.grey;
      case VerificationStatus.rejected:
        return Colors.red;
      case VerificationStatus.completed:
        return Colors.green;
    }
  }

  IconData _getStatusIcon(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.incomplete:
        return Icons.pending;
      case VerificationStatus.pending:
        return Icons.pending;
      case VerificationStatus.rejected:
        return Icons.cancel;
      case VerificationStatus.completed:
        return Icons.verified_user;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff6B39F4),
        elevation: 0,
        title: const Text(
          "Identify Verification",
          style: TextStyle(
            fontFamily: "Manrope-Bold",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff6B39F4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Verification Status",
                      style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    AppConstants.Height(15),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(personalStatus)
                                            .withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        _getStatusIcon(personalStatus),
                                        color: _getStatusColor(personalStatus),
                                        size: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Flexible(
                                      child: Text(
                                        "Personal ${_getStatusText(personalStatus)}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Manrope-Bold",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Flexible(
                                  child: Text(
                                    _getStatusText(personalStatus) ==
                                            "Completed"
                                        ? "Your personal information has been verified"
                                        : "Please complete your personal information",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                      fontFamily: "Manrope-Regular",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(kycStatus)
                                            .withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        _getStatusIcon(kycStatus),
                                        color: _getStatusColor(kycStatus),
                                        size: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Flexible(
                                      child: Text(
                                        "KYC ${_getStatusText(kycStatus)}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Manrope-Bold",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Flexible(
                                  child: Text(
                                    _getStatusText(kycStatus) == "Completed"
                                        ? "Your KYC verification is complete"
                                        : "Please complete your KYC verification",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                      fontFamily: "Manrope-Regular",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "KYC Requirements",
                        style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.pending, color: Colors.grey, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              "KYC Incomplete",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: "Manrope-SemiBold",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppConstants.Height(20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: notifier.background,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: notifier.getContainerBorder),
                    ),
                    child: Column(
                      children: [
                        _buildRequirementItem(
                          icon: Icons.person_outline,
                          title: "Basic Information",
                          description:
                              "Full name, date of birth, gender, PAN/Aadhaar",
                          isCompleted: false,
                        ),
                        const Divider(height: 30),
                        _buildRequirementItem(
                          icon: Icons.assessment_outlined,
                          title: "Risk Profiling",
                          description:
                              "Income, investment preferences, risk tolerance",
                          isCompleted: false,
                        ),
                        const Divider(height: 30),
                        _buildRequirementItem(
                          icon: Icons.account_balance_wallet_outlined,
                          title: "Capital Management",
                          description:
                              "Investment amount, trading preferences, risk limits",
                          isCompleted: false,
                        ),
                      ],
                    ),
                  ),
                  AppConstants.Height(30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KYCOnboarding(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6B39F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.verified_user_outlined,
                              color: Colors.white),
                          const SizedBox(width: 8),
                          const Text(
                            "Complete KYC",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Manrope-Bold",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequirementItem({
    required IconData icon,
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: isCompleted ? Colors.green : Colors.grey,
            size: 24,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "Manrope-Bold",
                  fontSize: 16,
                  color: notifier.textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontFamily: "Manrope-Regular",
                  fontSize: 14,
                  color: notifier.textColor.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
        Icon(
          isCompleted ? Icons.check_circle : Icons.circle_outlined,
          color: isCompleted ? Colors.green : Colors.grey,
          size: 24,
        ),
      ],
    );
  }
}
