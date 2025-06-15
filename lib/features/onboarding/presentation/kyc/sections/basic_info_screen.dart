// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/utils/snackbar_utils.dart';
import '../../../../../screens/config/common.dart';
import '../../providers/kyc_provider.dart';

class BasicInfoScreen extends StatefulWidget {
  final VoidCallback onContinue;
  final TextEditingController fullNameController;
  final TextEditingController dobController;
  final TextEditingController panController;
  final TextEditingController aadhaarController;
  final String? selectedGender;
  final Function(String?) onGenderSelected;

  const BasicInfoScreen({
    super.key,
    required this.onContinue,
    required this.fullNameController,
    required this.dobController,
    required this.panController,
    required this.aadhaarController,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  ColorNotifire notifier = ColorNotifire();
  bool _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (widget.fullNameController.text.isEmpty ||
        widget.dobController.text.isEmpty ||
        widget.selectedGender == null ||
        widget.panController.text.isEmpty) {
      SnackbarUtils.showAlert(
        context: context,
        message: "Please fill in all required fields",
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // Parse the date from DD/MM/YYYY format to DateTime
      final dateParts = widget.dobController.text.split('/');
      final dob = DateTime(
        int.parse(dateParts[2]), // year
        int.parse(dateParts[1]), // month
        int.parse(dateParts[0]), // day
      );

      await context.read<KYCProvider>().submitBasicDetails(
            fullName: widget.fullNameController.text,
            dob: dob,
            gender: widget.selectedGender!,
            pan: widget.panController.text,
            aadharNumber: widget.aadhaarController.text.isEmpty
                ? null
                : widget.aadhaarController.text,
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
            "Basic Information",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Manrope-Bold",
              color: notifier.textColor,
            ),
          ),
          AppConstants.Height(16),
          const Text(
            "Please provide your basic identification details for KYC verification",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff64748B),
              fontFamily: "Manrope-Medium",
            ),
          ),
          AppConstants.Height(24),
          _buildTextField(
            controller: widget.fullNameController,
            label: "Full Name (as per PAN/Aadhaar)",
            hint: "Enter your full name",
          ),
          AppConstants.Height(16),
          _buildTextField(
            controller: widget.dobController,
            label: "Date of Birth",
            hint: "DD/MM/YYYY",
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: const Color(0xff6B39F4),
                        onPrimary: Colors.white,
                        surface: notifier.background,
                        onSurface: notifier.textColor,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (picked != null) {
                setState(() {
                  widget.dobController.text =
                      "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                });
              }
            },
            readOnly: true,
          ),
          AppConstants.Height(16),
          _buildGenderSelector(),
          AppConstants.Height(16),
          _buildTextField(
            controller: widget.panController,
            label: "PAN Number",
            hint: "Enter your PAN number",
          ),
          AppConstants.Height(16),
          _buildTextField(
            controller: widget.aadhaarController,
            label: "Aadhaar Number (Optional)",
            hint: "Enter your Aadhaar number",
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
                    color: const Color(0xff6B39F4).withValues(alpha: 0.3),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    VoidCallback? onTap,
    TextInputType? keyboardType,
    bool readOnly = false,
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
            onTap: onTap,
            keyboardType: keyboardType,
            style: TextStyle(color: notifier.textColor),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: notifier.textFieldHintText),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            readOnly: readOnly,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Manrope-SemiBold",
            color: notifier.textColor,
          ),
        ),
        AppConstants.Height(8),
        Row(
          children: [
            Expanded(
              child: _buildGenderOption("Male", "male"),
            ),
            AppConstants.Width(16),
            Expanded(
              child: _buildGenderOption("Female", "female"),
            ),
            AppConstants.Width(16),
            Expanded(
              child: _buildGenderOption("Other", "other"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(String label, String value) {
    final isSelected = widget.selectedGender == value;
    return GestureDetector(
      onTap: () => widget.onGenderSelected(value),
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
