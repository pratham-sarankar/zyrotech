// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import '../../Dark mode.dart';
import '../config/common.dart';
import 'Sign phone.dart';
import '../../services/auth_service.dart';

class EmailVerification extends StatefulWidget {
  final String email;
  const EmailVerification({super.key, required this.email});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  ColorNotifire notifier = ColorNotifire();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sendEmailOtp();
  }

  void _sendEmailOtp() async {
    try {
      final authService = AuthService();
      final response = await authService.sendEmailOtp(widget.email);
      print(response['message']);
    } catch (e) {
      print(e.toString());
    }
  }

  void _verifyOtp(String otp) async {
    try {
      final authService = AuthService();
      final response = await authService.verifyEmailOtp(widget.email, otp);
      print(response['message']);
      // Handle successful verification, e.g., navigate to the next screen
    } catch (e) {
      print(e.toString());
      // Handle verification failure
    }
  }

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
            child: Icon(Icons.close, color: notifier.textColor, size: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              "Email Verification",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Manrope-SemiBold",
                  color: notifier.textColor),
            ),
            AppConstants.Height(10),
            const Text(
              "We've sent a verification code to your email address.\nPlease enter the 6-digit code below.",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff64748B),
                  fontFamily: "Manrope-Medium"),
            ),
            AppConstants.Height(30),
            OTPTextField(
                length: 6,
                width: width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 10,
                otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Colors.grey.withOpacity(0.3)),
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                onChanged: (pin) {
                  // Handle OTP change
                },
                onCompleted: (pin) {
                  _verifyOtp(pin);
                }),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Didn't receive the code?",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Manrope-SemiBold",
                        color: notifier.textColor),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle resend code
                    },
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff6B39F4),
                          fontFamily: "Manrope-SemiBold"),
                    ),
                  ),
                ],
              ),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const phone(),
                    ));
              },
              child: Container(
                height: height / 11,
                decoration: BoxDecoration(
                    color: const Color(0xff6B39F4),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: Text(
                  "Verify Email",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Manrope-Bold"),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
