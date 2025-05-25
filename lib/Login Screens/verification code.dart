// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Password update.dart';
import '../config/common.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  ColorNotifire notifier = ColorNotifire();
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
            const SizedBox(height: 40,),
            Text(
              "Authentication Code",
              style: TextStyle(fontSize: 24, fontFamily: "Manrope-SemiBold",color: notifier.textColor),
            ),
            AppConstants.Height(10),
            const Text(
              "Enter 5-digit code we just texted to your\n phone number, +1 8976889043",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff64748B),
                  fontFamily: "Manrope-Medium"),
            ),
            AppConstants.Height(30),
            OTPTextField(
                length: 5,
                width: width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 10,
                obscureText: true,
                otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.grey.withOpacity(0.3)),
                style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                onChanged: (pin) {
                },
                onCompleted: (pin) {
                }),
            // Center(
            //   child: CustomOTPTextField(
            //     deviceWidth: MediaQuery.of(context).size.width,
            //      textEditingController: textEditingController,
            //     boxSize: MediaQuery.of(context).size.width / 6.5,
            //     inputBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(15),
            //       borderSide: BorderSide(color: notifier.textField, width: 1.5),
            //     ),
            //     cursorColor: notifier.textColor,
            //     otpLength: 5,
            //     textStyle: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.w400,
            //       fontFamily: "Manrope_bold",
            //       color: notifier.textColor,
            //       letterSpacing: 0.3,
            //     ),
            //     spaceBetweenTextFields: 10,
            //     cursorHeight: 20,
            //   ),
            // ),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Use different phone number",
                    style: TextStyle(fontSize: 14, fontFamily: "Manrope-SemiBold",color: notifier.textColor),
                  ),
                ],
              ),
            ),
            AppConstants.Height(20),
            GestureDetector(
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Password(),));
               },
               child: Container(
                 height: height/11,
                 decoration: BoxDecoration(color: const Color(0xff6B39F4),borderRadius: BorderRadius.circular(15)),
                 child:const Center(child: Text("Continue",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Manrope-Bold"))) ,
               ),
             ),
            // CommonButton(
            //   tap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Password(),));},
            //   color: Color(0xff6B39F4),
            //   text: "Continue",
            //   textcolor: Colors.white, fontsize: 17,
            // ),
            AppConstants.Height(10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Password(),));
              },
              child: Container(
                height: height/11,
                decoration: BoxDecoration(color: notifier.tabBar2,borderRadius: BorderRadius.circular(15)),
                child:const Center(child: Text("Resend Code",style: TextStyle(fontSize: 16,color: Color(0xff6B39F4),fontFamily: "Manrope-Bold"))) ,
              ),
            ),
            // Container(
            //   height: 56,
            //   width: 327,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.grey[100],
            //   ),
            //   child: Center(
            //       child: Text("",
            //           style: TextStyle(fontSize: 16, color: Color(0xff6B39F4),fontFamily: "Manrope-Bold"))),
            // )
          ],
        ),
      ),
    );
  }
}
