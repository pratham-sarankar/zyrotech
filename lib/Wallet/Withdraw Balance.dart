// ignore_for_file: file_names

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Withdraw select bank.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  ColorNotifire notifier = ColorNotifire();
  int index2 = 0;

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
        title: Text("Withdraw",
            style: TextStyle(fontSize: 16, color: notifier.textColor)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/question-circle-outlined.png",
              width: 23,
            ),
          ),
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            AppConstants.Height(60),
            Center(
              child: Container(
                height: 65,
                // width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifier.background,
                    border: Border.all(color: notifier.getContainerBorder)),
                child: Center(
                  child: TextField(
                    style: TextStyle(
                        fontSize: 35,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold"),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 2, left: 8, top: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ),
            AppConstants.Height(9),
            const Text(
              "Withdraw fee 2.00",
              style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 12,
                  fontFamily: "Manrope-Bold"),
            ),
            AppConstants.Height(20),
            Container(
              height: 75,
              // width: 365,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: notifier.getContainerBorder, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: height / 14,
                          width: width / 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: notifier.onboardBackgroundColor),
                          child: Image.asset(
                            "assets/images/Barclays outlined.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Barclays",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text(
                                "**** **** **** 8907",
                                style: TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(top: 25, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Change",
                                style: TextStyle(
                                  color: Color(0xff6B39F4),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold",
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppConstants.Height(40),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index2 = 0;
                      });
                    },
                    child: Container(
                      height: height / 19,
                      width: width / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index2 == 0
                            ? const Color(0xff6B39F4)
                            : Colors.grey.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Text(
                          "25%",
                          style: TextStyle(
                            color: index2 == 0
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff94A3B8),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index2 = 1;
                      });
                    },
                    child: Container(
                      height: height / 19,
                      width: width / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index2 == 1
                            ? const Color(0xff6B39F4)
                            : Colors.grey.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Text(
                          "50%",
                          style: TextStyle(
                            color: index2 == 1
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff94A3B8),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index2 = 2;
                      });
                    },
                    child: Container(
                      height: height / 19,
                      width: width / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index2 == 2
                            ? const Color(0xff6B39F4)
                            : Colors.grey.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Text(
                          "75%",
                          style: TextStyle(
                            color: index2 == 2
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff94A3B8),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index2 = 3;
                      });
                    },
                    child: Container(
                      height: height / 19,
                      width: width / 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index2 == 3
                            ? const Color(0xff6B39F4)
                            : Colors.grey.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Text(
                          "100%",
                          style: TextStyle(
                            color: index2 == 3
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff94A3B8),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Withdraw_select(),
              ),
            );
          },
          child: Container(
            height: 56,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
              child: Text(
                "Withdraw Preview",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "̌Manrope-Bold",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
