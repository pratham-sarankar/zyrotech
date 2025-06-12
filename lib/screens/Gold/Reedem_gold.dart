// ignore_for_file: file_names

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../dark_mode.dart';
import '../config/common.dart';

class Reedem extends StatefulWidget {
  const Reedem({super.key});

  @override
  State<Reedem> createState() => _ReedemState();
}

class _ReedemState extends State<Reedem> {
  ColorNotifire notifier = ColorNotifire();
  int index5 = 0;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Column(
        children: [
          Container(
            height: 192,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Background (2).png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/arrow-narrow-left (1).png",
                            scale: 3,
                            color: Colors.white,
                          )),
                      const Spacer(),
                      const Text(
                        "Reedem",
                        style: TextStyle(
                            fontFamily: "Manrope-Bold",
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      const Spacer(),
                    ],
                  ),
                  AppConstants.Height(30),
                  const Text("Gold Balance",
                      style: TextStyle(color: Color(0xffB59CFA), fontSize: 16)),
                  Row(
                    children: [
                      const Text(
                        "100 gr",
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Manrope-Bold",
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/images/gold_icon.png",
                        height: 50,
                        width: 50,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          AppConstants.Height(20),
          Container(
            height: 72,
            width: 327,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: notifier.onboardBackgroundColor),
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
                            const Text('Amount',
                                style: TextStyle(color: Color(0xff94A3B8))),
                            Text('0.5',
                                style: TextStyle(
                                    fontSize: 18, color: notifier.textColor)),
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
                                        "assets/images/gold_icon.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    AppConstants.Width(4),
                                    Text(
                                      "Gram",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: notifier.textColor),
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
                    )),
              ],
            ),
          ),
          AppConstants.Height(20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index5 = 0;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index5 == 0
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withValues(alpha: 0.1),
                    ),
                    child: Center(
                        child: Text("0.10g",
                            style: TextStyle(
                                color: index5 == 0
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index5 = 1;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index5 == 1
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withValues(alpha: 0.1),
                    ),
                    child: Center(
                        child: Text("0.50g",
                            style: TextStyle(
                                color: index5 == 1
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index5 = 2;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index5 == 2
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withValues(alpha: 0.1),
                    ),
                    child: Center(
                        child: Text("5.00g",
                            style: TextStyle(
                                color: index5 == 2
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index5 = 3;
                    });
                  },
                  child: Container(
                    height: height / 19,
                    width: width / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index5 == 3
                          ? const Color(0xff6B39F4)
                          : Colors.blue.withValues(alpha: 0.1),
                    ),
                    child: Center(
                        child: Text("10.00g",
                            style: TextStyle(
                                color: index5 == 3
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff94A3B8),
                                fontSize: 14))),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         height: 32,
          //         width: 70,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.blue.withValues(alpha:0.1)),
          //         child: Center(
          //             child: Text("0.10g",
          //                 style: TextStyle(
          //                     color: Color(0xff64748B), fontSize: 13))),
          //       ),
          //       Container(
          //         height: 32,
          //         width: 70,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.blue.withValues(alpha:0.1)),
          //         child: Center(
          //             child: Text("0.50g",
          //                 style: TextStyle(
          //                     color: Color(0xff64748B), fontSize: 13))),
          //       ),
          //       Container(
          //         height: 32,
          //         width: 70,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.blue.withValues(alpha:0.1)),
          //         child: Center(
          //             child: Text("5.00g",
          //                 style: TextStyle(
          //                     color: Color(0xff64748B), fontSize: 13))),
          //       ),
          //       Container(
          //         height: 32,
          //         width: 70,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.blue.withValues(alpha:0.1)),
          //         child: Center(
          //             child: Text("10.00g",
          //                 style: TextStyle(
          //                     color: Color(0xff64748B), fontSize: 13))),
          //       ),
          //     ],
          //   ),
          // ),
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
                child: Text("Reedem",
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
