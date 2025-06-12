// ignore_for_file: file_names, non_constant_identifier_names

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

class ExperienceScreen extends StatefulWidget {
  final VoidCallback onSubmit;

  const ExperienceScreen({
    super.key,
    required this.onSubmit,
  });

  @override
  State<ExperienceScreen> createState() => _ReasonState();
}

class _ReasonState extends State<ExperienceScreen> {
  // Experience years selection
  Set<int> selectedExperienceYears = {};

  // Investment capacity selection
  Set<int> selectedInvestmentCapacity = {};

  // Interested coins selection
  Set<int> selectedCoins = {};

  bool _isSubmitting = false;

  List<String> experienceYears = [
    "1 year",
    "2 years",
    "3 years",
    "4 years",
    "5 years"
  ];

  List<String> investmentCapacity = [
    "\$100-500",
    "\$500-1000",
    "\$1000-10000",
    "\$10000+"
  ];

  List<String> interestedCoins = [
    "Bitcoin",
    "Ethereum",
    "Binance Coin",
    "Solana",
    "Cardano",
    "Polkadot",
    "Ripple",
    "Dogecoin"
  ];

  ColorNotifire notifier = ColorNotifire();

  Future<void> _handleSubmit() async {
    if (selectedExperienceYears.isEmpty ||
        selectedInvestmentCapacity.isEmpty ||
        selectedCoins.isEmpty) {
      SnackbarUtils.showAlert(
        context: context,
        message: "Please answer all questions",
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final experienceYear = experienceYears[selectedExperienceYears.first];
      final investmentCap =
          investmentCapacity[selectedInvestmentCapacity.first];
      final coins =
          selectedCoins.map((index) => interestedCoins[index]).toList();

      await context.read<KYCProvider>().submitExperience(
            experienceYears: experienceYear,
            investmentCapacity: investmentCap,
            interestedCoins: coins,
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
    final kycProvider = context.watch<KYCProvider>();

    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: notifier.textColor,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(10),
              indicator(value: 0.6),
              AppConstants.Height(20),
              Text(
                "What's your year of experience?",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Manrope-Bold",
                    color: notifier.textColor),
              ),
              AppConstants.Height(10),
              const Text(
                "Select your experience level in trading and investments",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff64748B),
                    fontFamily: "Manrope-Regular"),
              ),
              AppConstants.Height(30),
              _buildSelectionSection(
                "Years of Experience",
                experienceYears,
                (index) => selectedExperienceYears.contains(index),
                (index) {
                  setState(() {
                    // Clear previous selection and add new one
                    selectedExperienceYears.clear();
                    selectedExperienceYears.add(index);
                  });
                },
              ),
              AppConstants.Height(12),
              _buildSelectionSection(
                "Investment Capacity",
                investmentCapacity,
                (index) => selectedInvestmentCapacity.contains(index),
                (index) {
                  setState(() {
                    // Clear previous selection and add new one
                    selectedInvestmentCapacity.clear();
                    selectedInvestmentCapacity.add(index);
                  });
                },
              ),
              AppConstants.Height(12),
              _buildSelectionSection(
                "Interested Coins",
                interestedCoins,
                (index) => selectedCoins.contains(index),
                (index) {
                  setState(() {
                    if (selectedCoins.contains(index)) {
                      selectedCoins.remove(index);
                    } else {
                      selectedCoins.add(index);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              backgroundColor: const Color(0xff6B39F4),
            ),
            onPressed:
                kycProvider.isLoading || _isSubmitting ? null : _handleSubmit,
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
    );
  }

  Widget _buildSelectionSection(
    String title,
    List<String> items,
    bool Function(int) isSelected,
    Function(int) onTap,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: notifier.textField.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Manrope-Bold",
              color: notifier.textColor,
            ),
          ),
          AppConstants.Height(8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              items.length,
              (index) => GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isSelected(index)
                        ? const Color(0xffF8F5FF)
                        : notifier.textField,
                    border: Border.all(
                      color: isSelected(index)
                          ? const Color(0xff6B39F4)
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    items[index],
                    style: TextStyle(
                      fontFamily: "Manrope-SemiBold",
                      fontSize: 13,
                      color: isSelected(index)
                          ? const Color(0xff6B39F4)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget indicator({required double value}) {
    return LinearProgressIndicator(
      value: value,
      color: const Color(0xff6B39F4),
      backgroundColor: notifier.linerIndicator,
    );
  }
}
