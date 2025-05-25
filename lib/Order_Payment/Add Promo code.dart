// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';
import 'Confirm Order.dart';

class Promo_code extends StatefulWidget {
  const Promo_code({super.key});

  @override
  State<Promo_code> createState() => _Promo_codeState();
}

class _Promo_codeState extends State<Promo_code> {
  int code = 0;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 3,
              color: notifier.textColor,
            )),
        title: Text(
          "Promo Code",
          style: TextStyle(
              fontFamily: "Manrope-Bold",
              fontSize: 16,
              color: notifier.textColor),
        ),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                setState(() {
                  code = 0;
                });
              },
              child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: notifier.onboardBackgroundColor,
                      border: Border.all(
                          color: code == 0
                              ? const Color(0xff6B39F4)
                              : notifier.background)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Input Code",
                        hintStyle: TextStyle(
                            fontSize: 16, color: notifier.textFieldHintText),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide.none)),
                  )),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Confirm_order(),
                    ));
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff6B39F4)),
                child: const Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Manrope-Bold"),
                  ),
                ),
              ),
            ),
            AppConstants.Height(20),
            Text(
              "Promo Available",
              style: TextStyle(
                  fontSize: 17,
                  color: notifier.textColor,
                  fontFamily: "Manrope-Bold"),
            ),
            AppConstants.Height(20),
            Container(
              padding: const EdgeInsets.all(15),
              height: height / 7.5,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: notifier.divider, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/cashback.png",
                    scale: 2.7,
                  ),
                  SizedBox(width: width / 35),
                  Container(
                    width: 1,
                    height: 80,
                    color: notifier.getContainerBorder,
                    child: const VerticalDivider(),
                  ),
                  SizedBox(width: width / 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cashback',
                        style: TextStyle(
                            color: notifier.textColor,
                            fontFamily: "Manrope-Bold",
                            fontSize: 14,),
                      ),
                      Text(
                        'Up to 50%',
                        style: TextStyle(
                            color: notifier.textColor,
                            fontFamily: "Manrope-Bold",
                            fontSize: 18,),
                      ),
                      const Text(
                        'Valid until Oct 31,2022',
                        style: TextStyle(
                            color: Color(0xff94A3B8),
                            fontFamily: "Manrope-Medium",
                            fontSize: 12,),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'Details',
                    style: TextStyle(
                        color: Color(0xff6B39F4),
                        fontFamily: "Manrope-Bold",
                        fontSize: 12,),
                  ),
                ],
              ),
            ),
            AppConstants.Height(15),
            Container(
              padding: const EdgeInsets.all(15),
              height: height / 7.5,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: notifier.divider, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/cashback.png",
                    scale: 2.7,
                  ),
                  SizedBox(width: width / 35),
                  Container(
                    width: 1,
                    height: 80,
                    color: notifier.getContainerBorder,
                    child: const VerticalDivider(),
                  ),
                  SizedBox(width: width / 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cashback',
                        style: TextStyle(
                            color: notifier.textColor,
                            fontFamily: "Manrope-Bold",
                            fontSize: 14),
                      ),
                      Text(
                        'Up to 12%',
                        style: TextStyle(
                            color: notifier.textColor,
                            fontFamily: "Manrope-Bold",
                            fontSize: 18),
                      ),
                      const Text(
                        'End in 12 hours',
                        style: TextStyle(
                            color: Color(0xff94A3B8),
                            fontFamily: "Manrope-Medium",
                            fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'Details',
                    style: TextStyle(
                        color: Color(0xff6B39F4),
                        fontFamily: "Manrope-Bold",
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
