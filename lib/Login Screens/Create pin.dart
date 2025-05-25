// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Proof residency.dart';

class Pin extends StatefulWidget {
  const Pin({super.key});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  ColorNotifire notifier = ColorNotifire();
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context);
    var height = MediaQuery.of(context).size.height;
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
            )),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppConstants.Height(10),
            indicator(value: 0.8),
            AppConstants.Height(30),
            Row(
              children: [
                Text(
                  "Create a PIN",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Manrope-Bold",
                    color: notifier.textColor,
                  ),
                ),
              ],
            ),
            AppConstants.Height(10),
            const Row(
              children: [
                Text(
                  "Set PIN code to your Financial card.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff64748B),
                    fontFamily: "Gilroy-Medium",
                  ),
                ),
              ],
            ),
            AppConstants.Height(20),
            // StatefulBuilder(
            //   builder: (context, setState)  {
            //     return OTPTextField(
            //         length: 5,
            //         width: width,
            //         textFieldAlignment: MainAxisAlignment.spaceAround,
            //         fieldWidth: 45,
            //         fieldStyle: FieldStyle.box,
            //         outlineBorderRadius: 15,
            //         obscureText: false,
            //         keyboardType: TextInputType.number,
            //         otpFieldStyle: OtpFieldStyle(backgroundColor: notifier.isDark?const Color(0xff1E293B):Color(0xffFFFFFF)),
            //         style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Colors.red),
            //         onChanged: (pin) {
            //           print("Changed: " + pin);
            //         },
            //         onCompleted: (pin) {
            //           print("Completed: " + pin);
            //         },
            //     );
            //   }
            // ),
            Center(
              child: Consumer<ColorNotifire>(
                builder: (context, value, child) {
                  return OTPTextField(
                      otpFieldStyle: OtpFieldStyle(
                        // borderColor: notifier.textField1,

                        backgroundColor: Colors.grey.withOpacity(0.3),
                      ),
                      controller: otpController,
                      length: 5,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      // fieldStyle: FieldStyle.box,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 5,
                      contentPadding: const EdgeInsets.all(15),
                      style: TextStyle(fontSize: 17, color: notifier.textColor),
                      onChanged: (pin) {},
                      onCompleted: (pin) {});
                },
              ),
            ),
            AppConstants.Height(60),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Proof(),
                  ),
                );
              },
              child: Container(
                height: height / 14,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff6B39F4),
                ),
                child: const Center(
                  child: Text(
                    "Create a PIN",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 17,
                      fontFamily: "Manrope-Bold",
                    ),
                  ),
                ),
              ),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Proof(),
                  ),
                );
              },
              child: Container(
                height: height / 14,
                // width: 327,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: const Center(
                  child: Text(
                    "Skip for Now",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff6B39F4),
                      fontFamily: "Manrope-Bold",
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
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
