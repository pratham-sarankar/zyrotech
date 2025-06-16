// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// Package imports:
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/config/common.dart';
import '../../../dark_mode.dart';
import '../../../utils/toast_utils.dart';
import 'providers/profile_provider.dart';
import '../data/models/profile_model.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  ColorNotifire notifier = ColorNotifire();
  Country? selectedCountry;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();

    selectedCountry = Country(
      phoneCode: '91',
      countryCode: 'IN',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'India',
      example: '9876543210',
      displayName: 'India (IN) [+91]',
      displayNameNoCountryCode: 'India (IN)',
      e164Key: '91-IN-0',
    );
  }

  void _updateFormFields(ProfileModel? profile) {
    if (profile != null) {
      _nameController.text = profile.fullName;
      _emailController.text = profile.email;
      _phoneController.text = profile.phoneNumber;
    }
  }

  Future<void> _saveChanges() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final success = await context.read<ProfileProvider>().updateProfile(
          fullName: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
        );

    if (success && mounted) {
      ToastUtils.showSuccess(
        context: context,
        message: 'Profile updated successfully',
      );
      setState(() {
        _isEditing = false;
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        final profile = profileProvider.profile;
        final isLoading = profileProvider.isLoading;
        final error = profileProvider.error;

        // Update form fields when profile changes and not in editing mode
        if (profile != null && !_isEditing) {
          _updateFormFields(profile);
        }

        // Show error in overlay if there is one
        if (error != null && mounted) {
          Future.microtask(() {
            ToastUtils.showError(
              context: context,
              message: error,
            );
            profileProvider.clearError();
          });
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: notifier.background,
          appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                "assets/images/arrow-narrow-left (1).png",
                scale: 3,
                color: notifier.textColor,
              ),
            ),
            title: Text(
              "Personal Data",
              style: TextStyle(
                fontFamily: "Manrope-Bold",
                color: notifier.textColor,
                fontSize: 16,
              ),
            ),
            actions: [
              // Image.asset(
              //   "assets/images/edit.png",
              //   scale: 3,
              //   color: const Color(0xff6B39F4),
              // ),
              // const SizedBox(width: 10),
            ],
            backgroundColor: notifier.background,
            elevation: 0,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppConstants.Height(40),
                    // Center(
                    //   child: Stack(
                    //     alignment: AlignmentDirectional.bottomEnd,
                    //     children: [
                    //       Container(
                    //         height: 120,
                    //         width: 120,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           border: Border.all(
                    //             color: const Color(0xff6B39F4),
                    //             width: 2,
                    //           ),
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color: Colors.black.withValues(alpha: 0.1),
                    //               blurRadius: 10,
                    //               spreadRadius: 2,
                    //             ),
                    //           ],
                    //           image: const DecorationImage(
                    //             image: AssetImage("assets/images/profile.png"),
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 36,
                    //         width: 36,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: const Color(0xff6B39F4),
                    //           border: Border.all(
                    //             color: notifier.isDark
                    //                 ? const Color(0xff0F172A)
                    //                 : Colors.white,
                    //             width: 2,
                    //           ),
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color: Colors.black.withValues(alpha: 0.1),
                    //               blurRadius: 5,
                    //               spreadRadius: 1,
                    //             ),
                    //           ],
                    //         ),
                    //         child: const Center(
                    //           child: Icon(
                    //             Icons.edit,
                    //             color: Colors.white,
                    //             size: 18,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    AppConstants.Height(20),
                    Text(
                      "Full name",
                      style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        fontSize: 16,
                        color: notifier.textColor.withValues(alpha: 0.7),
                      ),
                    ),
                    AppConstants.Height(10),
                    isLoading
                        ? Shimmer.fromColors(
                            baseColor:
                                Colors.grey[300]!.withValues(alpha: 0.25),
                            highlightColor:
                                Colors.grey[100]!.withValues(alpha: 0.25),
                            child: Container(
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.isDark
                                  ? Colors.grey.withValues(alpha: 0.1)
                                  : Colors.grey.withValues(alpha: 0.05),
                              border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.2),
                              ),
                            ),
                            child: TextFormField(
                              controller: _nameController,
                              validator: _validateName,
                              style: TextStyle(
                                color: notifier.textColor,
                                fontSize: 16,
                                fontFamily: "Manrope-Regular",
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter your full name",
                                hintStyle: TextStyle(
                                  color:
                                      notifier.textColor.withValues(alpha: 0.5),
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                    AppConstants.Height(20),
                    Text(
                      "Phone number",
                      style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        fontSize: 16,
                        color: notifier.textColor.withValues(alpha: 0.7),
                      ),
                    ),
                    AppConstants.Height(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: isLoading
                              ? null
                              : () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    countryListTheme: CountryListThemeData(
                                      borderRadius: BorderRadius.circular(15),
                                      inputDecoration: InputDecoration(
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                            color: notifier.textColor),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: notifier.isDark
                                            ? Colors.grey.withValues(alpha: 0.1)
                                            : Colors.grey
                                                .withValues(alpha: 0.05),
                                      ),
                                      backgroundColor: notifier.background,
                                      textStyle:
                                          TextStyle(color: notifier.textColor),
                                    ),
                                    onSelect: (Country country) {
                                      setState(() {
                                        selectedCountry = country;
                                      });
                                    },
                                  );
                                },
                          child: Container(
                            height: 56,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.isDark
                                  ? Colors.grey.withValues(alpha: 0.1)
                                  : Colors.grey.withValues(alpha: 0.05),
                              border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.2),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (selectedCountry != null)
                                    Text(
                                      selectedCountry!.flagEmoji,
                                      style: const TextStyle(fontSize: 20),
                                    )
                                  else
                                    const Text(
                                      "🇺🇸",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  const SizedBox(width: 5),
                                  Text(
                                    selectedCountry?.phoneCode ?? "+1",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Regular",
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: notifier.textColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Width(10),
                        Expanded(
                          child: isLoading
                              ? Shimmer.fromColors(
                                  baseColor:
                                      Colors.grey[300]!.withValues(alpha: 0.25),
                                  highlightColor:
                                      Colors.grey[100]!.withValues(alpha: 0.25),
                                  child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifier.isDark
                                        ? Colors.grey.withValues(alpha: 0.1)
                                        : Colors.grey.withValues(alpha: 0.05),
                                    border: Border.all(
                                      color: Colors.grey.withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: _phoneController,
                                    validator: _validatePhone,
                                    style: TextStyle(
                                      color: notifier.textColor,
                                      fontSize: 16,
                                      fontFamily: "Manrope-Regular",
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(
                                        color: notifier.textColor
                                            .withValues(alpha: 0.5),
                                        fontSize: 14,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    AppConstants.Height(20),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        fontSize: 16,
                        color: notifier.textColor.withValues(alpha: 0.7),
                      ),
                    ),
                    AppConstants.Height(10),
                    isLoading
                        ? Shimmer.fromColors(
                            baseColor:
                                Colors.grey[300]!.withValues(alpha: 0.25),
                            highlightColor:
                                Colors.grey[100]!.withValues(alpha: 0.25),
                            child: Container(
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.isDark
                                  ? Colors.grey.withValues(alpha: 0.1)
                                  : Colors.grey.withValues(alpha: 0.05),
                              border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.2),
                              ),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              validator: _validateEmail,
                              style: TextStyle(
                                color: notifier.textColor,
                                fontSize: 16,
                                fontFamily: "Manrope-Regular",
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(
                                  color:
                                      notifier.textColor.withValues(alpha: 0.5),
                                  fontSize: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ),
                          ),
                    AppConstants.Height(40),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              height: 56,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff6B39F4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff6B39F4).withValues(alpha: 0.3),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: isLoading ? null : _saveChanges,
                  child: Center(
                    child: Text(
                      isLoading ? "Loading..." : "Save Changes",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Manrope-Bold",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
