// ignore_for_file: camel_case_types

import 'package:crowwn/screens/Home/stocks_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Crypto/Detail_crypto.dart';
import '../Crypto/crypto.dart';
import '../../Dark mode.dart';
import '../Gold/Detail_gold.dart';
import '../Gold/Gold.dart';
import '../Message & Notification/Message.dart';
import '../Message & Notification/Notifications.dart';
import '../NFT/Collections.dart';
import '../NFT/NFTs.dart';
import '../Stocks/Detail_stock.dart';
import '../Stocks/Us stocks.dart';
import '../config/common.dart';
import 'Search.dart';
import 'crypto_.dart';
import 'gold_.dart';
import 'nfts_.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  int currentindex = 0;
  int selectIndex = 0;
  bool _password = true;

  List page = [
    const Crypto_(),
    const Stock(),
    const gold(),
    const nfts(),
  ];

  List text = [
    "Crypto Assets",
    "US Stock",
    "Gold",
    "NFTs",
  ];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: notifier.background,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                "assets/images/Crowwn.png",
                scale: 55,
              ),
              SizedBox(width: width / 45),
              Text(
                'Crowwn',
                style: TextStyle(
                  fontSize: 18,
                  color: notifier.textColor,
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const search(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset(
                  "assets/images/Search.png",
                  height: 20,
                  width: 19,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Message(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/images/message.png",
                  height: 23,
                  width: 26,
                ),
              ),
            ),
            // Switch(
            //   value: notifier.isDark,
            //   onChanged: (bool value) {
            //     notifier.isavalable(value);
            //   },
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notifications(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset("assets/images/notification.png",
                    height: 23, width: 23),
              ),
            ),
          ],
          backgroundColor: notifier.background,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          height: 190,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage("assets/images/Background (1).png"),
                            fit: BoxFit.cover,
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Total asset value",
                                  style: TextStyle(
                                      color: Color(0xff94A3B8),
                                      fontSize: 15,
                                      fontFamily: "Manrope-Regular"),
                                ),
                                AppConstants.Height(10),
                                Row(
                                  children: [
                                    _password
                                        ? const Text(
                                            "\$56,890.00",
                                            style: TextStyle(
                                                fontSize: 32,
                                                color: Color(0xffFFFFFF)),
                                          )
                                        : const Text(
                                            ' **********',
                                            style: TextStyle(
                                                fontSize: 32,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                    AppConstants.Width(10),
                                    GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _password = !_password;
                                            },
                                          );
                                        },
                                        child: _password
                                            ? const Icon(
                                                Icons.remove_red_eye_outlined,
                                                size: 24,
                                                color: Color(0xff94A3B8))
                                            : const Icon(
                                                Icons.visibility_off_outlined,
                                                size: 24,
                                                color: Color(0xff94A3B8))),
                                    // Expand
                                    const Spacer(),
                                    // Expanded(child: AppConstants.Width(90)),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Container(
                                        height: 33,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: const Color(0xff1DCE5C),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/up-arrow.png",
                                              height: 15,
                                              width: 15,
                                              color: Colors.white,
                                            ),
                                            AppConstants.Width(5),
                                            const Text(
                                              "23.00%",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontFamily: "Manrope-Medium"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 90,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: notifier.onboardBackgroundColor,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const stocks_(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: height / 12,
                                      width: width / 7,
                                      color: notifier.onboardBackgroundColor,
                                      // color: Colors.red,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            notifier.isDark
                                                ? "assets/images/stocks_dark.png"
                                                : "assets/images/Stocks.png",
                                            height:
                                                25, /*color: notifier.textColor*/
                                          ),
                                          AppConstants.Height(5),
                                          const Text(
                                            "Stocks",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff64748B),
                                                fontFamily: "Manrope-Bold"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const crypto_(),
                                          ));
                                    },
                                    child: Container(
                                      height: height / 12,
                                      width: width / 7,
                                      color: notifier.onboardBackgroundColor,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              notifier.isDark
                                                  ? "assets/images/crypto_dark.png"
                                                  : "assets/images/Crypto.png",
                                              height: 25,
                                            ),
                                            AppConstants.Height(5),
                                            const Text(
                                              "Crypto",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff64748B),
                                                fontFamily: "Manrope-Bold",
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const gold_(),
                                          ));
                                    },
                                    child: Container(
                                      height: height / 12,
                                      width: width / 7,
                                      color: notifier.onboardBackgroundColor,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                notifier.isDark
                                                    ? "assets/images/gold_dark.png"
                                                    : "assets/images/Gold.png",
                                              ),
                                              height: 25,
                                              // color: notifier.textColor,
                                            ),
                                            AppConstants.Height(5),
                                            const Text(
                                              "Gold",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff64748B),
                                                  fontFamily: "Manrope-Bold"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const nfts_(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: height / 12,
                                      width: width / 7,
                                      color: notifier.onboardBackgroundColor,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image(
                                              image: AssetImage(notifier.isDark
                                                  ? "assets/images/nft_dark.png"
                                                  : "assets/images/NFTs.png"),
                                              height: 25,
                                              // color: notifier.textColor,
                                            ),
                                            AppConstants.Height(5),
                                            const Text(
                                              "NFTs",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff64748B),
                                                fontFamily: "Manrope-Bold",
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppConstants.Height(80),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "My Portfolio",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppConstants.Height(15),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Detail_crypto(),
                                  ),
                                );
                              },
                              child: Container(
                                height: height / 4.8,
                                width: width / 1.2,
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: notifier.isDark
                                      ? const Color(0xff1E293B)
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: height / 18,
                                            width: width / 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35),
                                              color: notifier.isDark
                                                  ? const Color(0xff2D3748)
                                                  : const Color(0xffF8F9FD),
                                            ),
                                            child: Image.asset(
                                              notifier.isDark
                                                  ? "assets/images/crypto_dark.png"
                                                  : "assets/images/Crypto.png",
                                              height: height / 30,
                                              width: width / 4,
                                            ),
                                          ),
                                          AppConstants.Width(10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Crypto",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Manrope-Bold",
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              AppConstants.Height(5),
                                              Text(
                                                "10 Assets",
                                                style: TextStyle(
                                                  color: notifier.isDark
                                                      ? const Color(0xff94A3B8)
                                                      : const Color(0xff64748B),
                                                  fontSize: 12,
                                                  fontFamily: "Manrope-Regular",
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "\$20,321.00",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Manrope-Bold",
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              AppConstants.Height(5),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/up-arrow.png",
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  AppConstants.Width(3),
                                                  const Text(
                                                    "0.24%",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xff1DCE5C),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      AppConstants.Height(15),
                                      Divider(
                                        height: 2,
                                        thickness: 1,
                                        color: notifier.isDark
                                            ? const Color(0xff2D3748)
                                            : const Color(0xffE2E8F0),
                                      ),
                                      AppConstants.Height(15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Profits",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifier.isDark
                                                      ? const Color(0xff94A3B8)
                                                      : const Color(0xff64748B),
                                                ),
                                              ),
                                              AppConstants.Height(5),
                                              Text(
                                                "\$16,988.00",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Manrope-Bold",
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 40,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xff6B39F4),
                                                  Color(0xff8B5CF6)
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Buy",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "Manrope-SemiBold",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AppConstants.Width(10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Detail_stock(),
                                  ),
                                );
                              },
                              child: Container(
                                height: height / 4.8,
                                width: width / 1.2,
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: notifier.getContainerBorder,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20, right: 20, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: height / 18,
                                            width: width / 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                color: notifier.textField),
                                            child: Image.asset(
                                              notifier.isDark
                                                  ? "assets/images/stocks_dark.png"
                                                  : "assets/images/Stocks.png",
                                              height: height / 30,
                                              width: width / 4,
                                              // color: notifier.textColor,
                                            ),
                                          ),
                                          AppConstants.Width(10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // AppConstants.Width(90),
                                              Text(
                                                "Stocks",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Manrope-Bold",
                                                    color: notifier.textColor),
                                              ),
                                              AppConstants.Height(5),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text("10 Assets",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff64748B),
                                                        fontSize: 12,
                                                        fontFamily:
                                                            "Manrope-Regular")),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Text("\$20,000.00",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          "Manrope-Bold",
                                                      color:
                                                          notifier.textColor)),
                                              AppConstants.Height(5),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/up-arrow.png",
                                                      height: 10,
                                                      width: 10),
                                                  AppConstants.Width(3),
                                                  const Text(
                                                    "0.29%",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(
                                                        0xff1DCE5C,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      AppConstants.Height(10),
                                      Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: notifier.getContainerBorder,
                                      ),
                                      AppConstants.Height(12),
                                      const Text(
                                        "Profits",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$20,000.00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Manrope-Bold",
                                              color: notifier.textColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 32,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color(0xff6B39F4),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Buy",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      "Manrope-SemiBold",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AppConstants.Width(10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Detail_gold(),
                                  ),
                                );
                              },
                              child: Container(
                                height: height / 4.8,
                                width: width / 1.2,
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: notifier.getContainerBorder,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20, right: 20, bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: height / 18,
                                            width: width / 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                color: notifier.textField),
                                            child: Image.asset(
                                              notifier.isDark
                                                  ? "assets/images/gold_dark.png"
                                                  : "assets/images/Gold.png",
                                              height: height / 30,
                                              width: width / 4,
                                              // color: notifier.textColor,
                                            ),
                                          ),
                                          AppConstants.Width(10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // AppConstants.Width(90),
                                              Text(
                                                "Gold",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Manrope-Bold",
                                                    color: notifier.textColor),
                                              ),
                                              AppConstants.Height(5),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  "17 Assets",
                                                  style: TextStyle(
                                                    color: Color(0xff64748B),
                                                    fontSize: 12,
                                                    fontFamily:
                                                        "Manrope-Regular",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Text(
                                                "\$90,000.00",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Manrope-Bold",
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              AppConstants.Height(5),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/images/up-arrow.png",
                                                      height: 10,
                                                      width: 10),
                                                  AppConstants.Width(3),
                                                  const Text(
                                                    "0.90%",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xff1DCE5C),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      AppConstants.Height(10),
                                      Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: notifier.getContainerBorder,
                                      ),
                                      AppConstants.Height(12),
                                      const Text(
                                        "Profits",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$40,000.00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Manrope-Bold",
                                              color: notifier.textColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 32,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color(0xff6B39F4),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Buy",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      "Manrope-SemiBold",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AppConstants.Width(10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Collections(),
                                  ),
                                );
                              },
                              child: Container(
                                height: height / 4.8,
                                width: width / 1.2,
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: notifier.getContainerBorder,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20, right: 20, bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: height / 18,
                                            width: width / 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35),
                                              color: notifier.textField,
                                            ),
                                            child: Image.asset(
                                              notifier.isDark
                                                  ? "assets/images/nft_dark.png"
                                                  : "assets/images/NFTs.png",
                                              height: height / 30,
                                              width: width / 4,
                                              // color: notifier.textColor,
                                            ),
                                          ),
                                          AppConstants.Width(10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // AppConstants.Width(90),
                                              Text(
                                                "NFT",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Manrope-Bold",
                                                    color: notifier.textColor),
                                              ),
                                              AppConstants.Height(5),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  "20 Assets",
                                                  style: TextStyle(
                                                    color: Color(0xff64748B),
                                                    fontSize: 12,
                                                    fontFamily:
                                                        "Manrope-Regular",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Text(
                                                "\$30,000.00",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "Manrope-Bold",
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              AppConstants.Height(5),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/up-arrow.png",
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                                  AppConstants.Width(3),
                                                  const Text(
                                                    "0.40%",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xff1DCE5C),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      AppConstants.Height(10),
                                      Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: notifier.getContainerBorder,
                                      ),
                                      AppConstants.Height(12),
                                      const Text(
                                        "Profits",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$10,000.00",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Manrope-Bold",
                                              color: notifier.textColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 32,
                                            width: 64,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color(0xff6B39F4),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Buy",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      "Manrope-SemiBold",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Watchlist",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor,
                            ),
                          ),
                          AppConstants.Width(5),
                          const Icon(
                            Icons.add_circle_outline_outlined,
                            size: 22,
                            color: Color(0xff94A3B8),
                          ),
                          const Spacer(),
                          const Text(
                            "Edit Watchlist",
                            style: TextStyle(
                              color: Color(0xff6B39F4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppConstants.Height(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: TabBar(
                        labelPadding: EdgeInsetsDirectional.symmetric(
                            horizontal: 5, vertical: 3),
                        physics: const BouncingScrollPhysics(),
                        labelColor: const Color(0xff6B39F4),
                        labelStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Manrope_bold",
                          letterSpacing: 0.2,
                        ),
                        dividerColor: Colors.transparent,
                        isScrollable: false,
                        indicatorSize: TabBarIndicatorSize.tab,
                        enableFeedback: false,
                        unselectedLabelColor: notifier.isDark
                            ? const Color(0xff64748B)
                            : const Color(0xff94A3B8),
                        // indicator: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        //   color: notifier.isDark
                        //       ? const Color(0xff1E293B)
                        //       : const Color(0xffF8F5FF),
                        // ),
                        indicator: BoxDecoration(color: Colors.transparent),
                        tabs: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: notifier.isDark
                                  ? const Color(0xff1E293B)
                                  : const Color(0xffF8F9FD),
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Tab(
                              child: Text("Crypto Assets"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: notifier.isDark
                                  ? const Color(0xff1E293B)
                                  : const Color(0xffF8F9FD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Tab(
                              child: Text("Us stock"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: notifier.isDark
                                  ? const Color(0xff1E293B)
                                  : const Color(0xffF8F9FD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Tab(
                              child: Text("Gold"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: notifier.isDark
                                  ? const Color(0xff1E293B)
                                  : const Color(0xffF8F9FD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Tab(
                              child: Text("Nfts"),
                            ),
                          ),
                        ],
                      ),

                      //   child: TabBar(
                      //     physics: BouncingScrollPhysics(),
                      //     isScrollable: true,
                      //     labelPadding: EdgeInsets.only(left: 5, right: 5),
                      //     indicatorColor: Colors.transparent,
                      //     unselectedLabelColor: notifier.isDark?notifier.tabBar1:notifier.tabBar1,
                      //
                      //     indicator:  BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //   color: notifier.tabBar2,
                      //   border: Border.all(
                      //     width: 1,
                      //     color:  notifier.tabBar2,
                      //   ),
                      // ),
                      //     // onTap: (index) {
                      //     //   setState(() {
                      //     //     selectIndex = index;
                      //     //   },
                      //     //   );
                      //     // },
                      //     labelColor: notifier.isDark? notifier.tabBar1 : notifier.tabBar2,
                      //     tabs: [
                      //       Tab(
                      //         child: Container(
                      //           height: 40,
                      //           width: 120,
                      //           alignment: Alignment.center,
                      //           decoration: const BoxDecoration(),
                      //           child: Text(
                      //             " ",
                      //             style: TextStyle(
                      //                 fontSize: 14,
                      //                 fontFamily: "gilroy_medium",
                      //                 color: selectIndex == 0
                      //                     ? notifier.tabBarText1
                      //                     : notifier.tabBarText2),
                      //             // overflow: TextOverflow.ellipsis,
                      //           ),
                      //         ),
                      //       ),
                      //       Tab(
                      //         child: Container(
                      //           height: 40,
                      //           width: 100,
                      //           alignment: Alignment.center,
                      //           // width: 140,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: selectIndex == 1
                      //                 ? notifier.tabBar1
                      //                 : notifier.tabBar2,
                      //             border: Border.all(
                      //               width: 1,
                      //               color: selectIndex == 1
                      //                   ? notifier.tabBar1
                      //                   : notifier.tabBar2,
                      //             ),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Us stocks",
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontFamily: "gilroy_medium",
                      //                   color: selectIndex == 1
                      //                       ? notifier.tabBarText1
                      //                       : notifier.tabBarText2,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Tab(
                      //         child: Container(
                      //           height: 35,
                      //           width: 100,
                      //           alignment: Alignment.center,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: selectIndex == 2
                      //                 ? notifier.tabBar1
                      //                 : notifier.tabBar2,
                      //             border: Border.all(
                      //               width: 1,
                      //               color: selectIndex == 2
                      //                   ? notifier.tabBar1
                      //                   : notifier.tabBar2,
                      //             ),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "Gold",
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontFamily: "gilroy_medium",
                      //                   color: selectIndex == 2
                      //                       ? notifier.tabBarText1
                      //                       : notifier.tabBarText2),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Tab(
                      //         child: Container(
                      //           height: 35,
                      //           width: 100,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: selectIndex == 3
                      //                 ? notifier.tabBar1
                      //                 : notifier.tabBar2,
                      //             border: Border.all(
                      //               width: 1,
                      //               color: selectIndex == 3
                      //                   ? notifier.tabBar1
                      //                   : notifier.tabBar2,
                      //             ),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "NFT",
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontFamily: "gilroy_medium",
                      //                   color: selectIndex == 3
                      //                       ? notifier.tabBarText1
                      //                       : notifier.tabBarText2,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              Crypto_(),
              Stock(),
              gold(),
              nfts(),
            ],
          ),
        ),
        // bottomNavigationBar: BottomAppBar(
        //   color: Colors.blue,
        //   clipBehavior: Clip.hardEdge,
        //   child: SizedBox(
        //     height: 65,
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 10,right: 10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Icon(Icons.home,color: Colors.white,),
        //               AppConstants.Height(5),
        //               Text("Home")
        //
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        //
        // ),
        // bottomNavigationBar: BottomAppBar(
        //   elevation: 0,
        //   color: Colors.white,
        //   clipBehavior: Clip.hardEdge,
        //   child: SizedBox(
        //     height: 84,
        //     width: double.infinity,
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 10, right: 10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   fillb1 = !fillb1;
        //                 });
        //                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
        //
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                    Icon(
        //                           Icons.home,
        //                           color: Colors.grey,
        //                         ),
        //                       Icon(
        //                           Icons.home_filled,
        //                           color: Colors.black,
        //                         ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                    Text(
        //                           'Home',
        //                           style: TextStyle(
        //                               fontSize: 12, color: Colors.grey),
        //                         ),
        //                        Text(
        //                           'Home',
        //                           style: TextStyle(
        //                               fontSize: 12, color: Colors.black),
        //                         )
        //                 ],
        //               )),
        //           GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   fillb2 = !fillb2;
        //                 });
        //                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
        //
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                    Image.asset("assets/images/Market.png",
        //                           height: 25, width: 25, color: Colors.grey),
        //                        Image.asset("assets/images/Market.png",
        //                           height: 25, width: 25, color: Colors.black),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                    Text(
        //                           'Market',
        //                           style: TextStyle(
        //                               fontSize: 12, color: Colors.grey),
        //                         ),
        //                        Text(
        //                           'Market',
        //                           style: TextStyle(
        //                               fontSize: 12, color: Colors.black),
        //                         )
        //                 ],
        //               )),
        //           AppConstants.Width(20),
        //           GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   fillb3 = !fillb3;
        //                 });
        //                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
        //
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                    Image.asset("assets/images/Portfolio.png",
        //                           height: 19, width: 19, color: Colors.grey),
        //                        Image.asset("assets/images/Portfolio.png",
        //                           height: 19, width: 19, color: Colors.black),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                    Text(
        //                           'Portfolio',
        //                           style: TextStyle(
        //                               fontSize: 12, color: Colors.grey),
        //                         ),
        //                        Text(
        //                           'Portfolio',
        //                           style: TextStyle(
        //                               fontSize: 12, color: Colors.black),
        //                         )
        //                 ],
        //               )),
        //           GestureDetector(
        //             onTap: () {
        //               setState(() {
        //                 fillb4 = !fillb4;
        //               });
        //               // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
        //             },
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                  Icon(Icons.perm_identity, color: Colors.grey),
        //                 Icon(Icons.person, color: Colors.black),
        //                 const SizedBox(
        //                   height: 5,
        //                 ),
        //                  Text(
        //                         'Profile',
        //                         style:
        //                             TextStyle(fontSize: 12, color: Colors.grey),
        //                       ),
        //                      Text(
        //                         'Profile',
        //                         style: TextStyle(
        //                             fontSize: 12, color: Colors.black),
        //                       ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // floatingActionButton: Align(
        //   alignment: Alignment(0.1, 1.23),
        //   child: FloatingActionButton(
        //     splashColor: Colors.blue,
        //     backgroundColor: Color(0xff6B39F4),
        //     child: Image(
        //         image: AssetImage("assets/images/Floating action.png"),
        //         height: 20,
        //         width: 20),
        //     onPressed: () {},
        //   ),
        // ),
      ),
    );
  }
}
