// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Crypto/Latest News.dart';
import '../../Dark mode.dart';
import '../config/common.dart';
import 'Detail_gold.dart';
import 'buy gold in.dart';

class gold extends StatefulWidget {
  const gold({super.key});

  @override
  State<gold> createState() => _goldState();
}

class _goldState extends State<gold> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(10),
              Text("Gold Price",
                  style: TextStyle(
                      fontFamily: "Manrope-Bold",
                      color: notifier.textColor,
                      fontSize: 16)),
              AppConstants.Height(10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_gold(),));
              //   },
              //   child: Container(
              //     height: 80,
              //     width: 365,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //               Image(
              //                   image: AssetImage("assets/images/Bitcoin.png"),
              //                   height: 40,width: 40),
              //               Column(
              //                 // crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Gold",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   const Text("Gold",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               AppConstants.Width(60),
              //               Column(
              //                 children: [
              //                   Text(
              //                     " 87,65.00",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   Row(
              //                     children: [
              //                       Image.asset("assets/images/up-arrow.png",height: 10,width: 12),
              //                       Text(
              //                         "0.00%",
              //                         style: TextStyle(
              //                             color: Color(0xff1DCE5C), fontSize: 13),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Detail_gold(),
                      ));
                },
                child: Container(
                  height: height / 9,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: notifier.getContainerBorder, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image:
                                    AssetImage("assets/images/gold_icon.png"),
                                height: 40,
                                width: 40),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gold",
                                  style: TextStyle(
                                      fontSize: 15, color: notifier.textColor),
                                ),
                                AppConstants.Height(10),
                                const Text("Gold",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  " \$87,65.00",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                Row(
                                  children: [
                                    Image.asset("assets/images/up-arrow.png",
                                        height: 10, width: 12),
                                    const Text(
                                      "0.00%",
                                      style: TextStyle(
                                          color: Color(0xff1DCE5C),
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(10),
              Row(
                children: [
                  Text(
                    "Buy Gold in",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const buy_gold(),
                          ));
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Manrope-Medium",
                          color: Color(0xff6B39F4)),
                    ),
                  ),
                ],
              ),
              AppConstants.Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: notifier.tabBar2),
                        child: Image.asset("assets/images/united-states.png",
                            height: 30, width: 30),
                      ),
                      // Image.asset(
                      //   "assets/images/gold_usa.png",
                      //   height: 60,
                      //   width: 60,
                      //   // color: notifier.textColor,
                      // ),
                      AppConstants.Height(5),
                      Text("USA",
                          style: TextStyle(
                              fontSize: 15,
                              color: notifier.textColor,
                              fontFamily: "Manrope-SemiBold")),
                    ],
                  ),
                  AppConstants.Width(10),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: notifier.tabBar2),
                        child: Image.asset("assets/images/ukraine.png",
                            height: 30, width: 30),
                      ),
                      // Image.asset(
                      //   "assets/images/gold_canada.png",
                      //   height: 60,
                      //   width: 60,
                      // ),
                      AppConstants.Height(5),
                      Text("UKRAINE",
                          style: TextStyle(
                              fontSize: 15,
                              color: notifier.textColor,
                              fontFamily: "Manrope-SemiBold")),
                    ],
                  ),
                  AppConstants.Width(10),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: notifier.tabBar2),
                        child: Image.asset("assets/images/united-kingdom.png",
                            height: 30, width: 30),
                      ),
                      AppConstants.Height(5),
                      Text("UK",
                          style: TextStyle(
                              fontSize: 15,
                              color: notifier.textColor,
                              fontFamily: "Manrope-SemiBold")),
                    ],
                  ),
                  AppConstants.Width(10),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: notifier.tabBar2),
                        child: Image.asset("assets/images/italy.png",
                            height: 30, width: 30),
                      ),
                      AppConstants.Height(5),
                      Text("ITALY",
                          style: TextStyle(
                              fontSize: 15,
                              color: notifier.textColor,
                              fontFamily: "Manrope-SemiBold")),
                    ],
                  ),
                  AppConstants.Width(10),
                ],
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Text(
                    "Latest News",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const latest_news(),
                          ));
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Manrope-Medium",
                          color: Color(0xff6B39F4)),
                    ),
                  ),
                ],
              ),
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Detail_gold()));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    "assets/images/Sky_high.png",
                    // height: MediaQuery.of(context).size.height / 3,
                    // width: MediaQuery.of(context).size.width / 7,
                  ),
                  title: Text(
                    "Sky high: recent surge inShanghai-\nLondon gold pri...",
                    style: TextStyle(
                        fontSize: 14,
                        color: notifier.textColor,
                        fontFamily: "Manrope-SemiBold"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  subtitle: Row(
                    children: [
                      const Text(
                        "The Block",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 12,
                            fontFamily: "Manrope-SemiBold"),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifier.getContainerBorder),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      const Text(
                        "2h ago",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold",
                            fontSize: 12),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        color: notifier.textColor,
                      )
                    ],
                  ),
                ),
              ),
              AppConstants.Height(5),
              Divider(
                height: 2,
                thickness: 1,
                color: notifier.getContainerBorder,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Detail_gold()));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    "assets/images/Visionxxx.png",
                    // height: MediaQuery.of(context).size.height / 3,
                    // width: MediaQuery.of(context).size.width / 7,
                  ),
                  title: Text(
                    "A Central Banker's Perspective:\n the role of gold in Kazakhstan",
                    style: TextStyle(
                        fontSize: 14,
                        color: notifier.textColor,
                        fontFamily: "Manrope-SemiBold"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  subtitle: Row(
                    children: [
                      const Text(
                        "The Block",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 12,
                            fontFamily: "Manrope-SemiBold"),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifier.getContainerBorder),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      const Text(
                        "2h ago",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold",
                            fontSize: 12),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        color: notifier.textColor,
                      )
                    ],
                  ),
                ),
              ),
              AppConstants.Height(5),
              Divider(
                height: 2,
                thickness: 1,
                color: notifier.getContainerBorder,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Detail_gold()));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    "assets/images/chase.png",
                    // height: MediaQuery.of(context).size.height / 3,
                    // width: MediaQuery.of(context).size.width / 7,
                  ),
                  title: Text(
                    "Bitcoin Perspective:\n the role of gold in Kazakhstan",
                    style: TextStyle(
                        fontSize: 14,
                        color: notifier.textColor,
                        fontFamily: "Manrope-SemiBold"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  subtitle: Row(
                    children: [
                      const Text(
                        "The Block",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 12,
                            fontFamily: "Manrope-SemiBold"),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifier.getContainerBorder),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      const Text(
                        "2h ago",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold",
                            fontSize: 12),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        color: notifier.textColor,
                      )
                    ],
                  ),
                ),
              ),
              AppConstants.Height(5),
              Divider(
                height: 1,
                thickness: 1,
                color: notifier.getContainerBorder,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Detail_gold(),
                      ));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    "assets/images/citi bank.png",
                  ),
                  title: Text(
                    "Btc ust : recent surge inShanghai-\nLondon gold pri...",
                    style: TextStyle(
                        fontSize: 14,
                        color: notifier.textColor,
                        fontFamily: "Manrope-SemiBold"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  subtitle: Row(
                    children: [
                      const Text(
                        "The Block",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 12,
                            fontFamily: "Manrope-SemiBold"),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifier.getContainerBorder),
                      ),
                      AppConstants.Width(
                          MediaQuery.of(context).size.width / 60),
                      const Text(
                        "2h ago",
                        style: TextStyle(
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold",
                            fontSize: 12),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        color: notifier.textColor,
                      )
                    ],
                  ),
                ),
              ),
              AppConstants.Height(5),
            ],
          ),
        ),
      ),
    );
  }
}
