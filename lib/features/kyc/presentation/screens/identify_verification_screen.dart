import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:developer' as developer;

import '../../../../dark_mode.dart';
import '../../../../services/api_service.dart';
import '../../../../utils/api_error.dart';
import '../../../../utils/snackbar_utils.dart';
import '../../data/models/kyc_response.dart';
import '../../domain/enums/kyc_status.dart';
import '../constants/kyc_constants.dart';
import '../widgets/verification_step_card.dart';
import '../widgets/requirement_card.dart';
import '../widgets/next_step_item.dart';
import '../../../../features/onboarding/presentation/kyc/kyc_screen.dart';

class IdentifyVerificationScreen extends StatefulWidget {
  const IdentifyVerificationScreen({super.key});

  @override
  State<IdentifyVerificationScreen> createState() => _IdentifyVerificationScreenState();
}

class _IdentifyVerificationScreenState extends State<IdentifyVerificationScreen> {
  ColorNotifire notifier = ColorNotifire();
  KYCStatus kycStatus = KYCStatus.notFound;
  bool isLoading = true;
  String? errorMessage;
  late final ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = context.read<ApiService>();
    _fetchKYCStatus();
  }

  Future<void> _fetchKYCStatus() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await _apiService.get('/api/kyc/status');
      developer.log('KYC Status Response: ${response.body}', name: 'KYC');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        developer.log('KYC Status Data: $data', name: 'KYC');
        
        final kycResponse = KYCResponse.fromJson(data);
        developer.log('Parsed KYC Status: ${kycResponse.kycStatus}', name: 'KYC');
        
        setState(() {
          kycStatus = kycResponse.kycStatus;
          isLoading = false;
        });
      } else {
        final errorData = json.decode(response.body);
        developer.log('KYC API Error: ${errorData['message']}', name: 'KYC', error: errorData);
        throw ApiError.fromMap(errorData);
      }
    } catch (e) {
      if (e is ApiError && e.code != 'kyc-not-found') {
        developer.log('KYC API Error: ${e.message}', name: 'KYC', error: e);
        setState(() {
          errorMessage = e.message;
          isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
              behavior: SnackBarBehavior.fixed,
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      } else {
        setState(() {
          kycStatus = KYCStatus.notFound;
          isLoading = false;
        });
      }
    }
  }

  Widget _buildStatusScreen() {
    switch (kycStatus) {
      case KYCStatus.inProgress:
        return _buildInProgressScreen();
      case KYCStatus.completed:
        return _buildCompletedScreen();
      case KYCStatus.rejected:
        return _buildRejectedScreen();
      case KYCStatus.notFound:
      case KYCStatus.pending:
        return _buildVerificationScreen();
    }
  }

  Widget _buildHeader({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 24,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Manrope-Bold",
                    color: notifier.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope-Regular",
                    color: notifier.textColor.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInProgressScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: "Verification in Progress",
            subtitle: "We're reviewing your documents",
            icon: Icons.hourglass_empty,
            color: Colors.orange,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verification Status",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Manrope-Bold",
                    color: notifier.textColor,
                  ),
                ),
                const SizedBox(height: 16),
                ...KYCConstants.verificationSteps.entries.map((step) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: VerificationStepCard(
                    title: step.value['title'],
                    description: step.value['description'],
                    status: 'pending',
                    icon: step.value['icon'],
                    textColor: notifier.textColor,
                  ),
                )),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "What's Next?",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      NextStepItem(
                        icon: Icons.notifications_outlined,
                        title: "Wait for Review",
                        description: "We'll notify you once the verification is complete",
                        textColor: notifier.textColor,
                      ),
                      const SizedBox(height: 8),
                      NextStepItem(
                        icon: Icons.timer_outlined,
                        title: "Processing Time",
                        description: "This usually takes 1-2 business days",
                        textColor: notifier.textColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: "Verification Completed",
            subtitle: "Your account is fully verified",
            icon: Icons.verified_user,
            color: Colors.green,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.green.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Verification Successful",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Manrope-Bold",
                                color: notifier.textColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "You now have full access to all platform features",
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Manrope-Regular",
                                color: notifier.textColor.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Verification Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Manrope-Bold",
                    color: notifier.textColor,
                  ),
                ),
                const SizedBox(height: 16),
                ...KYCConstants.verificationSteps.entries.map((step) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: VerificationStepCard(
                    title: step.value['title'],
                    description: step.value['description'],
                    status: 'completed',
                    icon: step.value['icon'],
                    textColor: notifier.textColor,
                  ),
                )),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.lightbulb_outline,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "What's Next?",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      NextStepItem(
                        icon: Icons.account_balance,
                        title: "Start Trading",
                        description: "Access all trading features and markets",
                        textColor: notifier.textColor,
                      ),
                      const SizedBox(height: 8),
                      NextStepItem(
                        icon: Icons.auto_graph,
                        title: "Set Up Automation",
                        description: "Configure your trading strategies",
                        textColor: notifier.textColor,
                      ),
                      const SizedBox(height: 8),
                      NextStepItem(
                        icon: Icons.security,
                        title: "Enable 2FA",
                        description: "Add an extra layer of security to your account",
                        textColor: notifier.textColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRejectedScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: "Verification Rejected",
            subtitle: "We need additional information",
            icon: Icons.cancel_outlined,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Verification Failed",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Bold",
                                    color: notifier.textColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Your verification was not approved",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Manrope-Regular",
                                    color: notifier.textColor.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      NextStepItem(
                        icon: Icons.document_scanner_outlined,
                        title: "Document Quality",
                        description: "Ensure your documents are clear, unexpired, and not damaged",
                        iconColor: Colors.red,
                        textColor: notifier.textColor,
                      ),
                      const SizedBox(height: 12),
                      NextStepItem(
                        icon: Icons.face_outlined,
                        title: "Photo Verification",
                        description: "Make sure your selfie matches your ID and is well-lit",
                        iconColor: Colors.red,
                        textColor: notifier.textColor,
                      ),
                      const SizedBox(height: 12),
                      NextStepItem(
                        icon: Icons.description_outlined,
                        title: "Information Accuracy",
                        description: "Verify all personal details match your official documents",
                        iconColor: Colors.red,
                        textColor: notifier.textColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.lightbulb_outline,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Next Steps",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      NextStepItem(
                        icon: Icons.refresh,
                        title: "Review Requirements",
                        description: "Check the verification requirements carefully",
                        textColor: notifier.textColor,
                      ),
                      const SizedBox(height: 8),
                      NextStepItem(
                        icon: Icons.upload_file,
                        title: "Prepare Documents",
                        description: "Gather clear, valid documents for resubmission",
                        textColor: notifier.textColor,
                      ),
                      const SizedBox(height: 8),
                      NextStepItem(
                        icon: Icons.support_agent,
                        title: "Contact Support",
                        description: "Get help from our support team if needed",
                        textColor: notifier.textColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
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
                      backgroundColor: KYCConstants.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Try Again",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Manrope-Bold",
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.refresh,
                          size: 20,
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
    );
  }

  Widget _buildVerificationScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: "Identity Verification",
            subtitle: "Complete verification to access all features",
            icon: Icons.verified_user_outlined,
            color: KYCConstants.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Required Documents",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            size: 12,
                            color: Colors.amber.shade800,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Secure",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Manrope-Medium",
                              color: Colors.amber.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...KYCConstants.requiredDocuments.entries.map((doc) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: RequirementCard(
                    title: doc.value['title'],
                    description: doc.value['description'],
                    subDescription: doc.value['subDescription'],
                    icon: doc.value['icon'],
                    textColor: notifier.textColor,
                  ),
                )),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.amber.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.amber.shade800,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Your information is encrypted and securely stored",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Manrope-Regular",
                            color: Colors.amber.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
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
                      backgroundColor: KYCConstants.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Start Verification",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Manrope-Bold",
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward,
                          size: 16,
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
    );
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
        backgroundColor: KYCConstants.primaryColor,
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: "Manrope-Regular",
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchKYCStatus,
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                )
              : _buildStatusScreen(),
    );
  }
} 