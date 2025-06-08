import 'package:crowwn/screens/Home/bottom.dart';
import 'package:crowwn/screens/Login%20Screens/Create%20pin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Dark mode.dart';
import '../config/common.dart';
import '../Login Screens/login.dart';
import '../Login Screens/Select reason.dart';

class KYCOnboarding extends StatefulWidget {
  const KYCOnboarding({super.key});

  @override
  State<KYCOnboarding> createState() => _KYCOnboardingState();
}

class _KYCOnboardingState extends State<KYCOnboarding> {
  ColorNotifire notifier = ColorNotifire();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isSkipped = false;

  // Form controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _selectedGender;
  bool _isPEP = false;
  bool _isOutsideIndia = false;

  // New variables
  String? _selectedMonthlyIncome;
  String? _selectedCryptoPercentage;
  String? _selectedExperience;
  String? _selectedReaction;
  String? _selectedTimeframe;
  bool? _isAwareOfRegulation;
  bool? _isAwareOfRisks;
  String? _selectedInitialCapital;
  String? _selectedTradePreference;
  bool? _wantsRiskLimit;
  bool? _autoDisableOnStopLoss;
  final TextEditingController _riskLimitController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _fullNameController.dispose();
    _dobController.dispose();
    _panController.dispose();
    _aadhaarController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _riskLimitController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
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
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          _buildBasicInfoScreen(),
          _buildRiskProfilingScreen(),
          _buildCapitalManagementScreen(),
        ],
      ),
    );
  }

  Widget _buildBasicInfoScreen() {
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
            controller: _fullNameController,
            label: "Full Name (as per PAN/Aadhaar)",
            hint: "Enter your full name",
          ),
          AppConstants.Height(16),
          _buildTextField(
            controller: _dobController,
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
                  _dobController.text =
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
            controller: _panController,
            label: "PAN Number",
            hint: "Enter your PAN number",
          ),
          AppConstants.Height(16),
          _buildTextField(
            controller: _aadhaarController,
            label: "Aadhaar Number (Optional)",
            hint: "Enter your Aadhaar number",
          ),
          AppConstants.Height(24),
          _buildContinueButton(),
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
    final isSelected = _selectedGender == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = value;
        });
      },
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

  Widget _buildContinueButton() {
    return GestureDetector(
      onTap: _nextPage,
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
        child: const Center(
          child: Text(
            "Continue",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Manrope-SemiBold",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRiskProfilingScreen() {
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
            _selectedMonthlyIncome,
            (value) => setState(() => _selectedMonthlyIncome = value),
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "What percentage of your wealth are you investing in crypto?",
            ["Less than 10%", "10–25%", "More than 25%"],
            _selectedCryptoPercentage,
            (value) => setState(() => _selectedCryptoPercentage = value),
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "How would you rate your experience in crypto trading?",
            ["Beginner", "Intermediate", "Expert"],
            _selectedExperience,
            (value) => setState(() => _selectedExperience = value),
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "If your portfolio dropped 30% in one week, what would you do?",
            ["Panic and exit", "Hold and wait", "Invest more"],
            _selectedReaction,
            (value) => setState(() => _selectedReaction = value),
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
            _selectedTimeframe,
            (value) => setState(() => _selectedTimeframe = value),
          ),
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Are you aware that crypto markets are unregulated in India?",
            _isAwareOfRegulation,
            (value) => setState(() => _isAwareOfRegulation = value),
          ),
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Do you understand that automated trades may cause losses and are irreversible?",
            _isAwareOfRisks,
            (value) => setState(() => _isAwareOfRisks = value),
          ),
          AppConstants.Height(24),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildQuestionSection(
    String question,
    List<String> options,
    String? selectedValue,
    Function(String) onSelect,
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
    Function(bool) onChanged,
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

  Widget _buildCapitalManagementScreen() {
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
            _selectedInitialCapital,
            (value) => setState(() => _selectedInitialCapital = value),
          ),
          AppConstants.Height(16),
          _buildQuestionSection(
            "Would you prefer small, frequent trades or high-confidence trades with fewer entries?",
            ["Small frequent", "Moderate", "Rare but high-impact"],
            _selectedTradePreference,
            (value) => setState(() => _selectedTradePreference = value),
          ),
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Would you like to set a capital-based monthly risk limit?",
            _wantsRiskLimit,
            (value) => setState(() => _wantsRiskLimit = value),
          ),
          if (_wantsRiskLimit == true) ...[
            AppConstants.Height(16),
            _buildTextField(
              controller: _riskLimitController,
              label: "Risk Limit Percentage",
              hint: "Enter percentage (e.g., 5)",
              keyboardType: TextInputType.number,
            ),
          ],
          AppConstants.Height(16),
          _buildYesNoQuestion(
            "Should the system auto-disable if 2 stop-losses hit in a row?",
            _autoDisableOnStopLoss,
            (value) => setState(() => _autoDisableOnStopLoss = value),
          ),
          AppConstants.Height(24),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: () {
        // Handle form submission
        if (_isSkipped) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Pin(),
            ),
          );
        } else {
          // Submit KYC data
          // TODO: Implement KYC data submission
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Reason(),
            ),
          );
        }
      },
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
          child: Text(
            _isSkipped ? "Continue" : "Submit KYC",
            style: const TextStyle(
              fontSize: 16,
              fontFamily: "Manrope-SemiBold",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
