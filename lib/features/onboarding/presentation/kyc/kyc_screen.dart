// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/onboarding/presentation/kyc/sections/experience_screen.dart';
import 'package:crowwn/screens/Home/bottom.dart';
import 'package:crowwn/screens/Login%20Screens/Verify%20success.dart';
import 'sections/basic_info_screen.dart';
import 'sections/capital_management_screen.dart';
import 'sections/risk_profiling_screen.dart';

class KYCOnboarding extends StatefulWidget {
  const KYCOnboarding({super.key});

  @override
  State<KYCOnboarding> createState() => _KYCOnboardingState();
}

class _KYCOnboardingState extends State<KYCOnboarding> {
  @override
  Widget build(BuildContext context) {
    return const _KYCOnboardingContent();
  }
}

class _KYCOnboardingContent extends StatefulWidget {
  const _KYCOnboardingContent();

  @override
  State<_KYCOnboardingContent> createState() => _KYCOnboardingContentState();
}

class _KYCOnboardingContentState extends State<_KYCOnboardingContent> {
  ColorNotifire notifier = ColorNotifire();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isSkipped = false;

  // Form controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _riskLimitController = TextEditingController();

  // Basic info state
  String? _selectedGender;

  // Risk profiling state
  String? _selectedMonthlyIncome;
  String? _selectedCryptoPercentage;
  String? _selectedExperience;
  String? _selectedReaction;
  String? _selectedTimeframe;
  bool? _isAwareOfRegulation;
  bool? _isAwareOfRisks;

  // Capital management state
  String? _selectedInitialCapital;
  String? _selectedTradePreference;
  bool? _wantsRiskLimit;
  bool? _autoDisableOnStopLoss;

  @override
  void dispose() {
    _pageController.dispose();
    _fullNameController.dispose();
    _dobController.dispose();
    _panController.dispose();
    _aadhaarController.dispose();
    _riskLimitController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipKYC() {
    setState(() {
      _isSkipped = true;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomBarScreen(),
      ),
    );
  }

  void _onExperienceSubmit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Success(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        actions: [
          Center(
            child: OutlinedButton(
              onPressed: _skipKYC,
              style: ButtonStyle(
                side: MaterialStatePropertyAll(
                  BorderSide(color: notifier.outlinedButtonColor),
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                ),
              ),
              child: Text(
                "Skip KYC",
                style: TextStyle(
                  fontSize: 16,
                  color: notifier.outlinedButtonColor,
                  fontFamily: "Manrope-SemiBold",
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          BasicInfoScreen(
            onContinue: _nextPage,
            fullNameController: _fullNameController,
            dobController: _dobController,
            panController: _panController,
            aadhaarController: _aadhaarController,
            selectedGender: _selectedGender,
            onGenderSelected: (value) =>
                setState(() => _selectedGender = value),
          ),
          RiskProfilingScreen(
            onContinue: _nextPage,
            selectedMonthlyIncome: _selectedMonthlyIncome,
            selectedCryptoPercentage: _selectedCryptoPercentage,
            selectedExperience: _selectedExperience,
            selectedReaction: _selectedReaction,
            selectedTimeframe: _selectedTimeframe,
            isAwareOfRegulation: _isAwareOfRegulation,
            isAwareOfRisks: _isAwareOfRisks,
            onMonthlyIncomeSelected: (value) =>
                setState(() => _selectedMonthlyIncome = value),
            onCryptoPercentageSelected: (value) =>
                setState(() => _selectedCryptoPercentage = value),
            onExperienceSelected: (value) =>
                setState(() => _selectedExperience = value),
            onReactionSelected: (value) =>
                setState(() => _selectedReaction = value),
            onTimeframeSelected: (value) =>
                setState(() => _selectedTimeframe = value),
            onRegulationAwarenessChanged: (value) =>
                setState(() => _isAwareOfRegulation = value),
            onRisksAwarenessChanged: (value) =>
                setState(() => _isAwareOfRisks = value),
          ),
          CapitalManagementScreen(
            onSubmit: _nextPage,
            selectedInitialCapital: _selectedInitialCapital,
            selectedTradePreference: _selectedTradePreference,
            wantsRiskLimit: _wantsRiskLimit,
            autoDisableOnStopLoss: _autoDisableOnStopLoss,
            riskLimitController: _riskLimitController,
            onInitialCapitalSelected: (value) =>
                setState(() => _selectedInitialCapital = value),
            onTradePreferenceSelected: (value) =>
                setState(() => _selectedTradePreference = value),
            onRiskLimitChanged: (value) =>
                setState(() => _wantsRiskLimit = value),
            onAutoDisableChanged: (value) =>
                setState(() => _autoDisableOnStopLoss = value),
          ),
          ExperienceScreen(
            onSubmit: _onExperienceSubmit,
          ),
        ],
      ),
    );
  }
}
