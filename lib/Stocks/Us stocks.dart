// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Account&setting/Refferal Code.dart';
import '../Crypto/Latest News.dart';
import '../Dark mode.dart';
import '../config/common.dart';
import 'Category_stock.dart';
import 'Detail_stock.dart';
import 'Top Gainers see all.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Detail_stock()));
                      },
                      child: Container(
                        height: 140,
                        width: 212,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color:notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          "assets/images/Airbnb.png"),
                                      height: 40,
                                      width: 40),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ABNB",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      const Text("Airbnb, Inc.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 10)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(10),
                               Text(
                                " \$112,72",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/up-arrow.png",
                                    height: 10,
                                    width: 10,
                                    color: const Color(0xff1DCE5C),
                                  ),
                                  AppConstants.Width(3),
                                  const Text("0.33%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: Color(0xff1DCE5C))),
                                  const Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 33, width: 80),
                                ],
                              )
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
                                builder: (context) => const Detail_stock()));
                      },
                      child: Container(
                        height:140,
                        width:212,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          "assets/images/Spotify.png"),
                                      height: 40,
                                      width: 40),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Spotify",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      const Text("Spotify Technology",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 10)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(10),
                              Text(
                                " \$82,70",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/up-arrow.png",
                                    height: 10,
                                    width: 10,
                                    color: const Color(0xff1DCE5C),
                                  ),
                                  AppConstants.Width(3),
                                  const Text("0.06%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: Color(0xff1DCE5C))),
                                 const Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 33, width: 80),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Top Gainers",
                      style: TextStyle(
                          fontSize: 16,
                          color: notifier.textColor,
                          fontFamily: "Manrope-Bold"),
                    ),
                  ),
                  // Expand
                 const Spacer(),
                  // AppConstants.Width(190),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const top_gainers_see(),
                            ));
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xff6B39F4),
                          fontSize: 14,
                          fontFamily: "Manrope-Regular",
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Detail_stock(),
                            ));
                      },
                      child: Container(
                        height: 106,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          "assets/images/polygon.png"),
                                      height: 30,
                                      width: 30),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Polygon",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      AppConstants.Height(5),
                                      const Text("MATIC",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 12)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(10),
                              Row(
                                children: [
                                   Text(
                                    " \$0.8016",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    "assets/images/up-arrow.png",
                                    height: 10,
                                    width: 10,
                                    color: const Color(0xff1DCE5C),
                                  ),
                                  AppConstants.Width(3),
                                  const Text("5.87%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff1DCE5C))),
                                ],
                              )
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
                                builder: (context) => const Detail_stock()));
                      },
                      child: Container(
                        height: 106,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image:
                                          AssetImage("assets/images/bnb.png"),
                                      height: 30,
                                      width: 30),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bnb",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      AppConstants.Height(5),
                                      const Text("BNB",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 12)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(10),
                              Row(
                                children: [
                                   Text(
                                    "\$271.01",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    "assets/images/up-arrow.png",
                                    height: 10,
                                    width: 10,
                                    color: const Color(0xff1DCE5C),
                                  ),
                                  AppConstants.Width(3),
                                  const Text("1.68%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff1DCE5C))),
                                ],
                              )
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
                                builder: (context) => const Detail_stock()));
                      },
                      child: Container(
                        height: 106,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          "assets/images/Bitcoin.png"),
                                      height: 30,
                                      width: 30),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bitcoin",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      AppConstants.Height(5),
                                      const Text("BCN",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 12)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(10),
                              Row(
                                children: [
                                  Text(
                                    "\$270.01",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  const Spacer(),
                                  Image.asset(
                                    "assets/images/up-arrow.png",
                                    height: 10,
                                    width: 10,
                                    color: const Color(0xff1DCE5C),
                                  ),
                                  AppConstants.Width(3),
                                 const Text("1.8%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff1DCE5C))),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(20),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Reffle_code(),));
                    },
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: const Color(0xff6B39F4),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Earn up to 5% APR",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xffFFFFFF),
                                    fontFamily: "Manrope-Bold"),
                              ),
                              Text(
                                "Learn how to rewards on \n Financial",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Regular",
                                    color: Color(0xffB59CFA)),
                              ),
                            ],
                          ),
                          // const Spacer(),
                          // Flexible
                           Image(
                            image: AssetImage('assets/images/Piggy bank.png'),
                            height: 96,
                            width: 90,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Text(
                    "Latest News",
                    style: TextStyle(
                        fontSize: 20,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold"),
                  ),
                  // Expand
                 const Spacer(),
                  // AppConstants.Width(230),
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
                            color: Color(0xff6B39F4),
                            fontFamily: "Manrope-Medium"),
                      )),
                ],
              ),
              AppConstants.Height(10),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  "assets/images/Coinbase.png",
                  // height: MediaQuery.of(context).size.height / 3,
                  // width: MediaQuery.of(context).size.width / 7,
                ),
                title:  Text(
                  "Coinbase CEO Armstrong plans \nto sell part of his stake to fu...",
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
                    Icon(Icons.more_horiz,color: notifier.textColor,)
                  ],
                ),
              ),
              AppConstants.Height(5),
              Divider(
                height: 2,
                thickness: 1,
                color: notifier.getContainerBorder,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/images/Nemus.png"),
                      fit: BoxFit.cover,),
                  ),
                ),
                title:  Text(
                  "Market Trying to Relax Even\nthough Economic Threats lurk",
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
                    Icon(Icons.more_horiz,color: notifier.textColor,)
                  ],
                ),
              ),
              AppConstants.Height(5),
              Divider(
                height: 2,
                thickness: 1,
                color: notifier.getContainerBorder,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  "assets/images/Mango hack.png",
                ),
                title:  Text(
                  "Mango hack drama and other\nmajor crypto stories of the pa...",
                  style: TextStyle(
                      fontSize: 14,
                      color: notifier.textColor,
                      fontFamily: "Manrope-SemiBold"),
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
                    Icon(Icons.more_horiz,color: notifier.textColor),
                  ],
                ),
              ),
              AppConstants.Height(5),
               Divider(
                height: 2,
                thickness: 1,
                color: notifier.getContainerBorder,
              ),
              AppConstants.Height(20),
              Text("Stock Futures",
                  style: TextStyle(
                      fontSize: 16,
                      color: notifier.textColor,
                      fontFamily: "Manrope-Bold")),
              AppConstants.Height(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Detail_stock()));
                      },
                      child: Container(
                        height: 140,
                        width: 212,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:  const Color(0xff6B39F4)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("data"),
                                  Image(
                                      image:
                                          AssetImage("assets/images/Nas.png"),
                                      height: 40,
                                      width: 40),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "NASDAQ100",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xffFFFFFF),
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      Text("NASDAQ 100 Index",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 10)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(10),
                             const Text(
                                " 111,73",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xffFFFFFF),
                                    fontFamily: "Manrope-Bold"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/up-arrow.png",
                                    height: 10,
                                    width: 10,
                                    color: const Color(0xffB59CFA),
                                  ),
                                  AppConstants.Width(3),
                                  const Text("2.56%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: Color(0xffB59CFA))),
                                 const Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 33,
                                      width: 80,
                                      color: Colors.white),
                                ],
                              )
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
                            ));
                      },
                      child: Container(
                        height: 140,
                        width: 212,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("data"),
                                  const Image(
                                      image:
                                          AssetImage("assets/images/S_P.png"),
                                      height: 40,
                                      width: 40),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SNP500",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      const Text("S&P 500 Index",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 10)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(10),
                              Text(
                                " \$37,31",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/up-arrow.png",
                                    height: 10,
                                    width: 10,
                                    color: const Color(0xff1BC256),
                                  ),
                                  AppConstants.Width(3),
                                  const Text("1.55%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: Color(0xff1BC256))),
                                  const Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 33, width: 80),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Text(
                    "Sectors",
                    style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 16,
                        fontFamily: "Manrope-Bold"),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Category(),
                            ));
                      },
                      child: const Text(
                        "See all",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff6B39F4)),
                      ))
                ],
              ),
              AppConstants.Height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: notifier.getContainerBorder)),
                        child: Center(
                            child: Image.asset("assets/images/Finance.png",
                                scale: 2.5)),
                      ),
                      AppConstants.Height(5),
                      const Text(
                        "Finance",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: notifier.getContainerBorder)),
                        child: Center(
                            child: Image.asset("assets/images/Technology.png",
                                scale: 2.5)),
                      ),
                      AppConstants.Height(5),
                      const Text(
                        "Technology",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: notifier.getContainerBorder)),
                        child: Center(
                            child: Image.asset("assets/images/Industry.png",
                                scale: 2.5)),
                      ),
                      AppConstants.Height(5),
                      const Text(
                        "Industry",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: notifier.getContainerBorder)),
                        child: Center(
                            child: Image.asset("assets/images/Utilities.png",
                                scale: 2.5)),
                      ),
                      AppConstants.Height(5),
                      const Text(
                        "Utilities",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold"),
                      )
                    ],
                  ),
                ],
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Text(
                    "All Stocks",
                    style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 16,
                        fontFamily: "Manrope-Bold"),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/arrows-sort.png",
                    scale: 3,
                  ),
                  const Text(
                    "Sort",
                    style: TextStyle(fontSize: 15, color: Color(0xff94A3B8)),
                  )
                ],
              ),
              AppConstants.Height(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Detail_stock(),
                      ));
                },
                child: Container(
                  height: height/8.5,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: notifier.getContainerBorder, width: 1)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only( left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage("assets/images/amazon.png"),
                                height: 40,
                                width: 40),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "AMZN",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text("Amazon, Inc.",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    " \$112,85.00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(10),
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/Down_red_arrow.png",
                                          height: 10,
                                          width: 12),
                                      const Text(
                                        "0.12%",
                                        style: TextStyle(
                                            color: Color(0xffE82C81),
                                            fontSize: 13,
                                            fontFamily: "Manrope-SemiBold"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(30),
            ],
          ),
        ),
      ),
    );
  }
}
