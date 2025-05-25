// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';

class Exchange_stock extends StatefulWidget {
  const Exchange_stock({super.key});

  @override
  State<Exchange_stock> createState() => _Exchange_stockState();
}

class _Exchange_stockState extends State<Exchange_stock> {
  ColorNotifire notifier = ColorNotifire();
  int tap1 = 0;
  bool upDown1 = false;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
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
            child: Text("Exchange",
                style: TextStyle(fontSize: 16, color: notifier.textColor))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/question-circle-outlined.png",
              width: 23,
              color: notifier.textFieldHintText,
            ),
          ),
        ],
        backgroundColor: notifier.background,
      ),
      body: Column(
        children: [
          AppConstants.Height(40),
          Column(
            children: [
              const Center(
                child: Text(
                  "Amazon balance",
                  style: TextStyle(
                    color: Color(0xff64748B),
                    fontSize: 16,
                    fontFamily: "Manrope-Medium",
                  ),
                ),
              ),
              AppConstants.Height(20),
              Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifier.background,
                  border: Border.all(
                    color: notifier.getContainerBorder,
                  ),
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(
                        fontSize: 35,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold"),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.only(
                        bottom: 2,
                        left: 8,
                        top: 2,
                      ),
                    ),
                  ),
                ),
              ),
              AppConstants.Height(20),
              Stack(clipBehavior: Clip.none, children: [
                Column(
                  children: [
                    upDown1 ? container1() : container2(),
                    const SizedBox(
                      height: 15,
                    ),
                    upDown1 ? container2() : container1(),
                  ],
                ),
                Positioned(
                  top: 65,
                  left: width / 2.5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        upDown1 = !upDown1;
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: notifier.sort,
                        border: Border.all(
                          color: notifier.getContainerBorder,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/arrows-sort.png",
                        color: const Color(0xff94A3B8),
                        scale: 2.7,
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
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
              child: Text(
                "Convert",
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

  Widget container1() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tap1 = 0;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: notifier.textField,
            border: Border.all(
                color:
                    tap1 == 0 ? const Color(0xff6B39F4) : notifier.textField)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('From',
                          style: TextStyle(
                              color: Color(0xff94A3B8), fontSize: 12)),
                      Text('890.00',
                          style: TextStyle(
                              fontSize: 18,
                              color: notifier.textColor,
                              fontFamily: "Manrope-Bold")),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 35,
                          width: 93,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifier.container,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  "assets/images/amazon.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              AppConstants.Width(4),
                              Text(
                                "AMZN",
                                style: TextStyle(
                                    fontSize: 12, color: notifier.textColor),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Color(0xff94A3B8),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget container2() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tap1 = 1;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: notifier.textField,
            border: Border.all(
                color:
                    tap1 == 1 ? const Color(0xff6B39F4) : notifier.textField)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('To',
                          style: TextStyle(
                              color: Color(0xff94A3B8), fontSize: 12)),
                      Text('789.00',
                          style: TextStyle(
                              fontSize: 18,
                              color: notifier.textColor,
                              fontFamily: "Manrope-Bold")),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 35,
                          width: 93,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifier.container,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  "assets/images/Airbnb.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              AppConstants.Width(4),
                              Text(
                                "ABNB",
                                style: TextStyle(
                                    fontSize: 12, color: notifier.textColor),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Color(0xff94A3B8),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
