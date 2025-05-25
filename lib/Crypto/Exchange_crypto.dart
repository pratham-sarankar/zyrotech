// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/common.dart';

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  ColorNotifire notifier = ColorNotifire();
  int tap = 0;
  bool updown = false;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
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
                  "Bitcoin balance",
                  style: TextStyle(
                      color: Color(0xff64748B),
                      fontSize: 16,
                      fontFamily: "Manrope-Medium"),
                ),
              ),
              AppConstants.Height(20),
              Container(
                height: height / 12,
                width: width / 2,
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
                        color: notifier.textColor,
                        fontSize: 35,
                        fontFamily: "Manrope-Bold"),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      contentPadding:
                          const EdgeInsets.only(bottom: 2, left: 8, top: 2),
                    ),
                  ),
                ),
              ),
              AppConstants.Height(20),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(children: [
                    updown ? Container1() : Container2(),
                    const SizedBox(
                      height: 15,
                    ),
                    updown ? Container2() : Container1(),
                  ]),
                  Positioned(
                    top: 45,
                    left: width/2.5,
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            updown = !updown;
                          },
                        );
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: notifier.sort,
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Image.asset("assets/images/arrows-sort.png",
                            color: const Color(0xff94A3B8), scale: 2.7),
                      ),
                    ),
                  ),
                ],
              ),
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
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
                child: Text("Convert",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "̌Manrope-Bold"))),
          ),
        ),
      ),
    );
  }

  Widget Container1() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tap = 0;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: notifier.textField,
            border: Border.all(
                color: tap == 0 ? const Color(0xff6B39F4) : notifier.textField)),
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
                        Text('0.8796',
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
                                    "assets/images/Bitcoin.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                AppConstants.Width(4),
                                Text(
                                  "BTC",
                                  style: TextStyle(
                                      fontSize: 12, color: notifier.textColor),
                                ),
                                AppConstants.Width(5),
                                const Icon(Icons.chevron_right,
                                    color: Color(0xff94A3B8)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget Container2() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tap = 1;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: notifier.textField,
            border: Border.all(
                color: tap == 1 ? const Color(0xff6B39F4) : notifier.textField)),
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
                        Text('12.8694',
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
                                    "assets/images/Ethereum (ETH).png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                AppConstants.Width(4),
                                Text(
                                  "ETH",
                                  style: TextStyle(
                                      fontSize: 12, color: notifier.textColor),
                                ),
                                AppConstants.Width(5),
                                const Icon(Icons.chevron_right,
                                    color: Color(0xff94A3B8)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
