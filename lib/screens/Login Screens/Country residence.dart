// ignore_for_file: file_names

// Flutter imports:
import 'package:crowwn/features/onboarding/presentation/kyc/kyc_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../Dark mode.dart';
import '../config/common.dart';

class CountrySelection extends StatefulWidget {
  const CountrySelection({super.key});

  @override
  State<CountrySelection> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  Country? selectedCountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 91,
    geographic: true,
    level: 1,
    name: 'India',
    example: '9123456789',
    displayName: 'India (IN) [+91]',
    displayNameNoCountryCode: 'India (IN)',
    e164Key: '91-IN-0',
  );
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
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
              ],
            ),
            AppConstants.Height(50),
            Text(
              "Select your country",
              style: TextStyle(
                fontSize: 26,
                color: notifier.textColor,
                fontFamily: "Manrope-Bold",
              ),
            ),
            AppConstants.Height(20),
            Container(
              decoration: BoxDecoration(
                color: notifier.textField,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                  );
                },
                leading: selectedCountry != null
                    ? CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Text(
                          selectedCountry!.flagEmoji,
                          style: const TextStyle(fontSize: 25),
                        ),
                      )
                    : const Icon(Icons.flag, color: Colors.grey),
                title: Text(
                  selectedCountry?.name ?? 'Select Country',
                  style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 18,
                  ),
                ),
                trailing: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ),
            ),
            // const Spacer(),
            // const ListTile(
            //   leading: Icon(
            //     Icons.lock_outline,
            //     color: Colors.grey,
            //   ),
            //   title: Text(
            //     "This info is used only for identity verification and is transmitted securely using 128-bit encryption.",
            //     style: TextStyle(
            //       color: Colors.grey,
            //       fontSize: 19,
            //       fontFamily: "Manrope-Regular",
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
        child: InkWell(
          onTap: () {
            if (selectedCountry != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KYCOnboarding(),
                ),
              );
            }
          },
          child: Container(
            height: 55,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedCountry != null
                  ? const Color(0xff6B39F4)
                  : Colors.grey,
            ),
            child: const Center(
              child: Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
