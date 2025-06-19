// ignore_for_file: file_names

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Login%20Screens/Verify%20success.dart';
import '../../dark_mode.dart';
import '../../services/auth_service.dart';
import '../config/common.dart';

class Pin extends StatefulWidget {
  const Pin({super.key});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  ColorNotifire notifier = ColorNotifire();
  OtpFieldController otpController = OtpFieldController();
  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = context.read<AuthService>();
  }

  void _createPin(String pin) async {
    try {
      final response = await _authService.createPin(pin);
      print(response['message']);
    } catch (e) {
      print(e.toString());
      // Handle error
    }
  }

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
            Center(
              child: Consumer<ColorNotifire>(
                builder: (context, value, child) {
                  return OTPTextField(
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: Colors.grey.withValues(alpha: 0.3),
                      ),
                      controller: otpController,
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 5,
                      contentPadding: const EdgeInsets.all(15),
                      style: TextStyle(fontSize: 17, color: notifier.textColor),
                      onChanged: (pin) {},
                      onCompleted: (pin) {
                        _createPin(pin);
                      });
                },
              ),
            ),
            AppConstants.Height(60),
            GestureDetector(
              onTap: () {},
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
                    builder: (context) => Success(),
                  ),
                );
              },
              child: Container(
                height: height / 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withValues(alpha: 0.2),
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
