// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/Login%20Screens/Create%20pin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/Login%20Screens/verification%20code.dart';
import '../Dark mode.dart';
import '../config/common.dart';
import 'package:country_picker/country_picker.dart';

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  ColorNotifire notifier = ColorNotifire();
  String selectedCountryCode = '+91'; // Default to India
  String selectedCountryFlag = '🇮🇳';

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close,color:notifier.textColor,size: 25,)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(70),
            Text(
              "Almost Done!",
              style: TextStyle(fontSize: 24, fontFamily: "Manrope-SemiBold",color: notifier.textColor),
            ),
            AppConstants.Height(20),
            const Text(
              "Enter your phone number and we'll text you a \n code to activate your account.",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff64748B),
                  fontFamily: "Manrope-Medium"),
            ),
            AppConstants.Height(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() {
                          selectedCountryCode = '+${country.phoneCode}';
                          selectedCountryFlag = country.flagEmoji;
                        });
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: notifier.textField,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(selectedCountryFlag, style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 5),
                        Text(selectedCountryCode, style: TextStyle(fontSize: 17, color: notifier.textColor)),
                      ],
                    ),
                  ),
                ),
                Expanded(child: AppConstants.Width(20)),
                Container(
                  height: 56,
                  width: 226,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifier.textField,
                  ),
                  child: TextField(
                    style: TextStyle(color: notifier.textColor),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Color(0xff64748B)),
                    ),
                  ),
                ),
              ],
            ),
            AppConstants.Height(30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Pin (),));
              },
              child: Container(
                height: height/11,
                decoration: BoxDecoration(color: const Color(0xff6B39F4),borderRadius: BorderRadius.circular(15)),
                child:const Center(child: Text("Continue",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Manrope-Bold"))) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
