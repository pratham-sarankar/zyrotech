// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/config/common.dart';
import '../../dark_mode.dart';

class Personal_data extends StatefulWidget {
  const Personal_data({super.key});

  @override
  State<Personal_data> createState() => _Personal_dataState();
}

class _Personal_dataState extends State<Personal_data> {
  ColorNotifire notifier = ColorNotifire();
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: notifier.textColor,
          ),
        ),
        title: Center(
          child: Text(
            "Personal Data",
            style: TextStyle(
              fontFamily: "Manrope-Bold",
              color: notifier.textColor,
              fontSize: 16,
            ),
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/edit.png",
            scale: 3,
            color: const Color(0xff6B39F4),
          ),
          SizedBox(width: 10),
        ],
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(40),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xff6B39F4),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff6B39F4),
                        border: Border.all(
                          color: notifier.isDark
                              ? const Color(0xff0F172A)
                              : Colors.white,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(40),
              Text(
                "Full name",
                style: TextStyle(
                  fontFamily: "Manrope-Bold",
                  fontSize: 16,
                  color: notifier.textColor.withValues(alpha: 0.7),
                ),
              ),
              AppConstants.Height(10),
              Container(
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
                child: TextField(
                  style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 16,
                    fontFamily: "Manrope-Regular",
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter your full name",
                    hintStyle: TextStyle(
                      color: notifier.textColor.withValues(alpha: 0.5),
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        countryListTheme: CountryListThemeData(
                          borderRadius: BorderRadius.circular(15),
                          inputDecoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: notifier.textColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: notifier.isDark
                                ? Colors.grey.withValues(alpha: 0.1)
                                : Colors.grey.withValues(alpha: 0.05),
                          ),
                          backgroundColor: notifier.background,
                          textStyle: TextStyle(color: notifier.textColor),
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
                    child: Container(
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
                      child: TextField(
                        style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 16,
                          fontFamily: "Manrope-Regular",
                        ),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: notifier.textColor.withValues(alpha: 0.5),
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
              Container(
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
                child: TextField(
                  style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 16,
                    fontFamily: "Manrope-Regular",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(
                      color: notifier.textColor.withValues(alpha: 0.5),
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              AppConstants.Height(40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 56,
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
              onTap: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  "Save Changes",
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
  }
}
