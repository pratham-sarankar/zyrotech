// ignore_for_file: file_names

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/config/common.dart';
import '../../Dark mode.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({super.key});

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  bool isSwitch_1 = false;
  bool isSwitch_2 = false;
  bool isSwitch_3 = false;
  bool isSwitch_4 = false;
  bool isSwitch_5 = false;
  bool isSwitch_6 = false;

  onChange1(bool value1) {
    setState(() {
      isSwitch_1 = value1;
    });
  }

  onChange2(bool value2) {
    setState(() {
      isSwitch_2 = value2;
    });
  }

  onChange3(bool value3) {
    setState(() {
      isSwitch_3 = value3;
    });
  }

  onChange4(bool value4) {
    setState(() {
      isSwitch_4 = value4;
    });
  }

  onChange5(bool value5) {
    setState(() {
      isSwitch_5 = value5;
    });
  }

  onChange6(bool value6) {
    setState(() {
      isSwitch_6 = value6;
    });
  }

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              widgetData("News", isSwitch_1, onChange1,
                  "Receive notification for news", "assets/images/News.png"),
              widgetData(
                  "Promotion",
                  isSwitch_2,
                  onChange2,
                  "Receive notification for promotion",
                  "assets/images/ticket-discount.png"),
              widgetData(
                  "Community",
                  isSwitch_3,
                  onChange3,
                  "Receive notification for community",
                  "assets/images/Person.png"),
              widgetData(
                  "Telegram",
                  isSwitch_4,
                  onChange4,
                  "Get notified from Telegram chat",
                  "assets/images/Telegram.png"),
              widgetData("Email", isSwitch_5, onChange5,
                  "Get notified from Email ", "assets/images/mail_.png"),
              widgetData("Whatsapp", isSwitch_6, onChange6,
                  "Get notified from Whatsapp", "assets/images/Whatsapp.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetData(String text, bool isSwitch, Function onChangedMethod,
      String text1, String image) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: notifier.getContainerBorder)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: notifier.tabBar2),
                  child: Image.asset(
                    image,
                    scale: 2.7,
                    color: const Color(0xff94A3B8),
                  )),
              AppConstants.Width(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.Height(20),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope_bold",
                      fontSize: 14,
                      letterSpacing: 0.3,
                      color: notifier.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  AppConstants.Height(5),
                  Text(
                    text1,
                    style: const TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 12,
                        fontFamily: "Manrope-Regular"),
                  )
                ],
              ),
              const Spacer(),
              CupertinoSwitch(
                activeColor: const Color(0xff6B39F4),
                thumbColor: Colors.white,
                value: isSwitch,
                onChanged: (value) {
                  onChangedMethod(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
