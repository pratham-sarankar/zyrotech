// ignore_for_file: file_names, non_constant_identifier_names

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/config/common.dart';
import '../../Dark mode.dart';

class Loan extends StatefulWidget {
  const Loan({super.key});

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  ColorNotifire notifier = ColorNotifire();
  double _Value = 0;
  int selectIndex = 0;
  @override

  // int Select1 = 0;

  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
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
        title: Text("Create Loan",
            style: TextStyle(fontSize: 16, color: notifier.textColor)),
        backgroundColor: notifier.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Row(
                children: [
                  const Text(
                    "Gold Quantity",
                    style: TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 14,
                        fontFamily: "Manrope-Bold"),
                  ),
                  AppConstants.Width(5),
                  Image.asset(
                    "assets/images/question-circle-outlined.png",
                    height: 19,
                    width: 19,
                  )
                ],
              ),
            ),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 56,
                // width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifier.background,
                    border: Border.all(color: notifier.getContainerBorder)),
                child: TextField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: "${_Value.toInt()} gr",
                      hintStyle: const TextStyle(
                          fontFamily: "Manrope-Bold",
                          fontSize: 24,
                          color: Color(0xff6B39F4))),
                ),
              ),
            ),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Slider(
                value: _Value,
                max: 100,
                divisions: 100,
                label: "${_Value.round().toString()} gr",
                thumbColor: const Color(0xff6B39F4),
                activeColor: const Color(0xff6B39F4),
                onChanged: (double value) {
                  setState(() {
                    _Value = value;
                  });
                },
              ),
            ),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 0),
              child: Row(
                children: [
                  const Text(
                    "Installment Tenure",
                    style: TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 14,
                        fontFamily: "Manrope-Bold"),
                  ),
                  AppConstants.Width(5),
                  Image.asset(
                    "assets/images/question-circle-outlined.png",
                    height: 19,
                    width: 19,
                  )
                ],
              ),
            ),
            AppConstants.Height(10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = 0;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectIndex == 0
                                ? notifier.background
                                : notifier.tabBar1,
                            border: Border.all(
                                color: selectIndex == 0
                                    ? const Color(0xff6b39f4)
                                    : Colors.blue.withValues(alpha: 0.1))),
                        child: Center(
                            child: Text("3 months",
                                style: TextStyle(
                                    color: selectIndex == 0
                                        ? const Color(0xff6B39F4)
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "Manrope-Bold"))),
                      ),
                    ),
                    AppConstants.Width(20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectIndex == 1
                                ? notifier.background
                                : notifier.tabBar1,
                            border: Border.all(
                                color: selectIndex == 1
                                    ? const Color(0xff6b39f4)
                                    : Colors.blue.withValues(alpha: 0.1))),
                        child: Center(
                            child: Text("6 months",
                                style: TextStyle(
                                    color: selectIndex == 1
                                        ? const Color(0xff6B39F4)
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "Manrope-Bold"))),
                      ),
                    ),
                    AppConstants.Width(20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = 2;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectIndex == 2
                                ? notifier.background
                                : notifier.tabBar1,
                            border: Border.all(
                                color: selectIndex == 2
                                    ? const Color(0xff6b39f4)
                                    : Colors.blue.withValues(alpha: 0.1))),
                        child: Center(
                            child: Text("9 months",
                                style: TextStyle(
                                    color: selectIndex == 2
                                        ? const Color(0xff6B39F4)
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "Manrope-Bold"))),
                      ),
                    ),
                    AppConstants.Width(20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = 3;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectIndex == 3
                                ? notifier.background
                                : notifier.tabBar1,
                            border: Border.all(
                                color: selectIndex == 3
                                    ? const Color(0xff6b39f4)
                                    : Colors.blue.withValues(alpha: 0.1))),
                        child: Center(
                            child: Text("12 months",
                                style: TextStyle(
                                    color: selectIndex == 3
                                        ? const Color(0xff6B39F4)
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "Manrope-Bold"))),
                      ),
                    ),
                    AppConstants.Width(20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = 4;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectIndex == 4
                                ? notifier.background
                                : notifier.tabBar1,
                            border: Border.all(
                                color: selectIndex == 4
                                    ? const Color(0xff6b39f4)
                                    : Colors.blue.withValues(alpha: 0.1))),
                        child: Center(
                            child: Text("16 months",
                                style: TextStyle(
                                    color: selectIndex == 4
                                        ? const Color(0xff6B39F4)
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "Manrope-Bold"))),
                      ),
                    ),
                    AppConstants.Width(20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = 5;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 89,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectIndex == 5
                                ? notifier.background
                                : notifier.tabBar1,
                            border: Border.all(
                                color: selectIndex == 5
                                    ? const Color(0xff6b39f4)
                                    : Colors.blue.withValues(alpha: 0.1))),
                        child: Center(
                            child: Text("24 months",
                                style: TextStyle(
                                    color: selectIndex == 5
                                        ? const Color(0xff6B39F4)
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "Manrope-Bold"))),
                      ),
                    ),
                    AppConstants.Width(20),
                  ],
                ),
              ),
            ),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Loan Simulation",
                style: TextStyle(
                    fontSize: 16,
                    color: notifier.textColor,
                    fontFamily: "Manrope-Bold"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Container(
                height: 220,
                // width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: notifier.getContainerBorder),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Total loan value",
                            style: TextStyle(
                                color: Color(0xff64748B),
                                fontFamily: "Manrope-Regular",
                                fontSize: 14),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$25,987.00",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontSize: 16,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(5),
                              const Text(
                                "Buy price 87.65/g",
                                style: TextStyle(
                                    color: Color(0xff94A3B8),
                                    fontSize: 12,
                                    fontFamily: "Manrope-Medium"),
                              )
                            ],
                          )
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        color: notifier.divider,
                        thickness: 1,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text(
                            "Monthly installment",
                            style: TextStyle(
                                color: Color(0xff64748B),
                                fontFamily: "Manrope-Regular",
                                fontSize: 14),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$1,454.00",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontSize: 16,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(5),
                              const Text(
                                "For the next  5 months",
                                style: TextStyle(
                                    color: Color(0xff94A3B8),
                                    fontSize: 12,
                                    fontFamily: "Manrope-Medium"),
                              )
                            ],
                          )
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        color: notifier.divider,
                        thickness: 1,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text(
                            "First payment",
                            style: TextStyle(
                                color: Color(0xff64748B),
                                fontFamily: "Manrope-Regular",
                                fontSize: 14),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                "\$5,678.98",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontSize: 16,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(5),
                              const Text(
                                "Due now",
                                style: TextStyle(
                                    color: Color(0xff94A3B8),
                                    fontSize: 12,
                                    fontFamily: "Manrope-Medium"),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppConstants.Height(20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 15, right: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 56,
            // width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
                child: Text("Review Loan",
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
