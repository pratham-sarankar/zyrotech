// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/screens/config/common.dart';

import '../../Dark mode.dart';
import '../Order_Payment/Order gold.dart';

class sell_buy extends StatefulWidget {
  const sell_buy({super.key});

  @override
  State<sell_buy> createState() => _sell_buyState();
}

class _sell_buyState extends State<sell_buy> {
  ColorNotifire notifier = ColorNotifire();
  int index6 = 0;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: notifier.textColor,
          ),
        ),
        title: Center(
            child: Text("Buy gold",
                style: TextStyle(fontSize: 16, color: notifier.textColor))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/question-circle-outlined.png",
              width: 23,
              color: notifier.tabBarText2,
            ),
          ),
        ],
        backgroundColor: notifier.background,
      ),
      body: Column(
        children: [
          AppConstants.Height(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/gold_icon.png",
                width: 20,
                height: 20,
              ),
              AppConstants.Width(10),
              Column(
                children: [
                  Text(
                    "1 Gram =  87.65",
                    style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 16,
                        fontFamily: "Manrope-Medium"),
                  ),
                ],
              )
            ],
          ),
          AppConstants.Height(70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 75,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.background,
                              border: Border.all(
                                  color: notifier.getContainerBorder)),
                          child: TextField(
                            style: TextStyle(
                                fontSize: 40,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Bold"),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.only(
                                    bottom: 2, left: 8, top: 25)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: notifier.onboardBackgroundColor,
                            ),
                            child: Image.asset("assets/images/arrows-sort.png",
                                color: const Color(0xff6B39F4), scale: 2.7),
                          ),
                        )
                      ],
                    ),
                  ),
                  AppConstants.Height(10),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      "USD balance 14,456.00",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 16,
                          fontFamily: "Manrope-Bold"),
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppConstants.Height(70),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index6 = 0;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index6 == 0
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withOpacity(0.1),
                    ),
                    child: Center(
                        child: Text("0.10g",
                            style: TextStyle(
                                color: index6 == 0
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index6 = 1;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index6 == 1
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withOpacity(0.1),
                    ),
                    child: Center(
                        child: Text("0.50g",
                            style: TextStyle(
                                color: index6 == 1
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index6 = 2;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index6 == 2
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withOpacity(0.1),
                    ),
                    child: Center(
                        child: Text("5.00g",
                            style: TextStyle(
                                color: index6 == 2
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index6 = 3;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index6 == 3
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withOpacity(0.1),
                    ),
                    child: Center(
                        child: Text("10.00g",
                            style: TextStyle(
                                color: index6 == 3
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Order_gold() /*Activity_gold()*/,
                ));
          },
          child: Container(
            height: 56,
            // width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
                child: Text("Buy",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "̌Manrope-Bold"))),
          ),
        ),
      ),
    );
  }
}
