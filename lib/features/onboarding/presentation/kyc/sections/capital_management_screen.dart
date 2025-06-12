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

class CapitalManagementScreen extends StatefulWidget {
  final VoidCallback onSubmit;
  final String? selectedInitialCapital;
  final String? selectedTradePreference;
  final bool? wantsRiskLimit;
  final bool? autoDisableOnStopLoss;
  final TextEditingController riskLimitController;
  final Function(String?) onInitialCapitalSelected;
  final Function(String?) onTradePreferenceSelected;
  final Function(bool?) onRiskLimitChanged;
  final Function(bool?) onAutoDisableChanged;

  const CapitalManagementScreen({
    super.key,
    required this.onSubmit,
    required this.selectedInitialCapital,
    required this.selectedTradePreference,
    required this.wantsRiskLimit,
    required this.autoDisableOnStopLoss,
    required this.riskLimitController,
    required this.onInitialCapitalSelected,
    required this.onTradePreferenceSelected,
    required this.onRiskLimitChanged,
    required this.onAutoDisableChanged,
  });

  @override
  State<CapitalManagementScreen> createState() =>
      _CapitalManagementScreenState();
}

class _CapitalManagementScreenState extends State<CapitalManagementScreen> {
  ColorNotifire notifier = ColorNotifire();
  bool _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (widget.selectedInitialCapital == null ||
        widget.selectedTradePreference == null ||
        widget.wantsRiskLimit == null ||
        widget.autoDisableOnStopLoss == null ||
        (widget.wantsRiskLimit == true &&
            widget.riskLimitController.text.isEmpty)) {
      SnackbarUtils.showAlert(
        context: context,
        message: "Please answer all questions",
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await context.read<KYCProvider>().submitCapitalManagement(
            initialCapital: widget.selectedInitialCapital!,
            tradePreference: widget.selectedTradePreference!,
            wantsRiskLimit: widget.wantsRiskLimit!,
            riskLimitPercentage: widget.wantsRiskLimit == true
                ? widget.riskLimitController.text
                : null,
            autoDisableOnStopLoss: widget.autoDisableOnStopLoss!,
          );

      if (mounted) {
        widget.onSubmit();
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
            "Capital Management",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Manrope-Bold",
              color: notifier.textColor,
            ),
          ),
          AppConstants.Height(16),
          const Text(
            "Help us understand your investment preferences and risk management",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff64748B),
              fontFamily: "Manrope-Medium",
            ),
          ),
          AppConstants.Height(24),
          _buildQuestionSection(
            "How much capital do you plan to automate initially?",
            ["\$500–\$1,000", "\$1,001–\$2,000", "\$2,001–\$5,000", "\$5,000+"],
            widget.selectedInitialCapital,
            widget.onInitialCapitalSelected,
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "Would you prefer small, frequent trades or high-confidence trades with fewer entries?",
            ["Small frequent", "Moderate", "Rare but high-impact"],
            widget.selectedTradePreference,
            widget.onTradePreferenceSelected,
          ),
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Would you like to set a capital-based monthly risk limit?",
            widget.wantsRiskLimit,
            widget.onRiskLimitChanged,
          ),
          if (widget.wantsRiskLimit == true) ...[
            AppConstants.Height(16),
            _buildTextField(
              controller: widget.riskLimitController,
              label: "Risk Limit Percentage",
              hint: "Enter percentage (e.g., 5)",
              keyboardType: TextInputType.number,
            ),
          ],
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Should the system auto-disable if 2 stop-losses hit in a row?",
            widget.autoDisableOnStopLoss,
            widget.onAutoDisableChanged,
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
                        "Submit KYC",
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Manrope-SemiBold",
            color: notifier.textColor,
          ),
        ),
        AppConstants.Height(8),
        Container(
          decoration: BoxDecoration(
            color: notifier.textField,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(color: notifier.textColor),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: notifier.textFieldHintText),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
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
