// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/screens/config/common.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/utils/snackbar_utils.dart';
import '../../providers/kyc_provider.dart';

class RiskProfilingScreen extends StatefulWidget {
  final VoidCallback onContinue;
  final String? selectedMonthlyIncome;
  final String? selectedCryptoPercentage;
  final String? selectedExperience;
  final String? selectedReaction;
  final String? selectedTimeframe;
  final bool? isAwareOfRegulation;
  final bool? isAwareOfRisks;
  final Function(String?) onMonthlyIncomeSelected;
  final Function(String?) onCryptoPercentageSelected;
  final Function(String?) onExperienceSelected;
  final Function(String?) onReactionSelected;
  final Function(String?) onTimeframeSelected;
  final Function(bool?) onRegulationAwarenessChanged;
  final Function(bool?) onRisksAwarenessChanged;

  const RiskProfilingScreen({
    super.key,
    required this.onContinue,
    required this.selectedMonthlyIncome,
    required this.selectedCryptoPercentage,
    required this.selectedExperience,
    required this.selectedReaction,
    required this.selectedTimeframe,
    required this.isAwareOfRegulation,
    required this.isAwareOfRisks,
    required this.onMonthlyIncomeSelected,
    required this.onCryptoPercentageSelected,
    required this.onExperienceSelected,
    required this.onReactionSelected,
    required this.onTimeframeSelected,
    required this.onRegulationAwarenessChanged,
    required this.onRisksAwarenessChanged,
  });

  @override
  State<RiskProfilingScreen> createState() => _RiskProfilingScreenState();
}

class _RiskProfilingScreenState extends State<RiskProfilingScreen> {
  ColorNotifire notifier = ColorNotifire();
  bool _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (widget.selectedMonthlyIncome == null ||
        widget.selectedCryptoPercentage == null ||
        widget.selectedExperience == null ||
        widget.selectedReaction == null ||
        widget.selectedTimeframe == null ||
        widget.isAwareOfRegulation == null ||
        widget.isAwareOfRisks == null) {
      SnackbarUtils.showAlert(
        context: context,
        message: "Please answer all questions",
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await context.read<KYCProvider>().submitRiskProfiling(
            monthlyIncome: widget.selectedMonthlyIncome!,
            cryptoPercentage: widget.selectedCryptoPercentage!,
            experience: widget.selectedExperience!,
            reaction: widget.selectedReaction!,
            timeframe: widget.selectedTimeframe!,
            isAwareOfRegulation: widget.isAwareOfRegulation!,
            isAwareOfRisks: widget.isAwareOfRisks!,
          );

      if (mounted) {
        widget.onContinue();
      }
    } on ApiError catch (e) {
      if (mounted) {
        SnackbarUtils.showError(
          context: context,
          message: e.message,
        );
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showError(
          context: context,
          message: "An unknown error occurred. Please try again later.",
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    final kycProvider = context.watch<KYCProvider>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Risk Profiling",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Manrope-Bold",
              color: notifier.textColor,
            ),
          ),
          AppConstants.Height(16),
          const Text(
            "Help us understand your investment preferences and risk tolerance",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff64748B),
              fontFamily: "Manrope-Medium",
            ),
          ),
          AppConstants.Height(24),
          _buildQuestionSection(
            "What is your total monthly income?",
            [
              "Less than ₹50,000",
              "₹50,000–1,00,000",
              "₹1,00,001–2,00,000",
              "Above ₹2,00,000"
            ],
            widget.selectedMonthlyIncome,
            widget.onMonthlyIncomeSelected,
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "What percentage of your wealth are you investing in crypto?",
            ["Less than 10%", "10–25%", "More than 25%"],
            widget.selectedCryptoPercentage,
            widget.onCryptoPercentageSelected,
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "How would you rate your experience in crypto trading?",
            ["Beginner", "Intermediate", "Expert"],
            widget.selectedExperience,
            widget.onExperienceSelected,
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "If your portfolio dropped 30% in one week, what would you do?",
            ["Panic and exit", "Hold and wait", "Invest more"],
            widget.selectedReaction,
            widget.onReactionSelected,
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "How long can you stay invested without needing your capital?",
            [
              "Less than 6 months",
              "6–12 months",
              "1–3 years",
              "More than 3 years"
            ],
            widget.selectedTimeframe,
            widget.onTimeframeSelected,
          ),
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Are you aware that crypto markets are unregulated in India?",
            widget.isAwareOfRegulation,
            widget.onRegulationAwarenessChanged,
          ),
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Do you understand that automated trades may cause losses and are irreversible?",
            widget.isAwareOfRisks,
            widget.onRisksAwarenessChanged,
          ),
          AppConstants.Height(24),
          GestureDetector(
            onTap:
                kycProvider.isLoading || _isSubmitting ? null : _handleSubmit,
            child: Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff6B39F4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff6B39F4).withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: (kycProvider.isLoading || _isSubmitting)
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Manrope-SemiBold",
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionSection(
    String question,
    List<String> options,
    String? selectedValue,
    Function(String?) onSelect,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Manrope-SemiBold",
            color: notifier.textColor,
          ),
        ),
        AppConstants.Height(12),
        ...options.map((option) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _buildOptionTile(
                  option, selectedValue == option, () => onSelect(option)),
            )),
      ],
    );
  }

  Widget _buildOptionTile(String option, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF8F5FF) : notifier.textField,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xff6B39F4) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xff6B39F4) : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: Color(0xff6B39F4),
                      ),
                    )
                  : null,
            ),
            AppConstants.Width(12),
            Expanded(
              child: Text(
                option,
                style: TextStyle(
                  color:
                      isSelected ? const Color(0xff6B39F4) : notifier.textColor,
                  fontFamily: "Manrope-Medium",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYesNoQuestion(
    String question,
    bool? value,
    Function(bool?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Manrope-SemiBold",
            color: notifier.textColor,
          ),
        ),
        AppConstants.Height(12),
        Row(
          children: [
            Expanded(
              child: _buildYesNoOption(
                  "Yes", value == true, () => onChanged(true)),
            ),
            AppConstants.Width(16),
            Expanded(
              child: _buildYesNoOption(
                  "No", value == false, () => onChanged(false)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildYesNoOption(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF8F5FF) : notifier.textField,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xff6B39F4) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xff6B39F4) : notifier.textColor,
              fontFamily: "Manrope-SemiBold",
            ),
          ),
        ),
      ),
    );
  }
}
