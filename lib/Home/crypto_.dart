// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Account&setting/Refferal Code.dart';
import '../Crypto/Detail_crypto.dart';
import '../Crypto/Latest News.dart';
import '../Crypto/See All Assets.dart';
import '../Crypto/Trending see all.dart';
import '../Dark mode.dart';
import '../config/common.dart';

class crypto_ extends StatefulWidget {
  const crypto_({super.key});

  @override
  State<crypto_> createState() => _crypto_State();
}

class _crypto_State extends State<crypto_> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: notifier.textColor)),
        title: Text("Crypto",style: TextStyle(fontSize: 17,fontFamily: "Manrope-Bold",color: notifier.textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_crypto(),));
                },
                child: Container(
                  height: height/9,
                  // width: 400,
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
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage("assets/images/Bitcoin.png"),
                                height: 40,
                                width: 40),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bitcoin",
                                  style: TextStyle(
                                      fontSize: 15, color: notifier.textColor),
                                ),
                                AppConstants.Height(10),
                                const Text("BTC",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            Spacer(),
                            // AppConstants.Width(60),
                            Column(
                              children: [
                                Text(
                                  "\$19,075.00",
                                  style: TextStyle(
                                      fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                Row(
                                  children: [
                                    Image.asset("assets/images/up-arrow.png",
                                        height: 10, width: 12),
                                    Text(
                                      "0.35%",
                                      style: TextStyle(
                                          color: Color(0xff1DCE5C), fontSize: 13),
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
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Detail_crypto()));
                },
                child: Container(
                  height: height/9,
                  // width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: notifier.getContainerBorder, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage("assets/images/cardano.png"),
                                height: 40,
                                width: 40),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cardano",
                                  style: TextStyle(
                                      fontSize: 15, color: notifier.textColor),
                                ),
                                AppConstants.Height(10),
                                Text("ADA",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            Spacer(),
                            // AppConstants.Width(60),
                            Column(
                              children: [
                                Text(
                                  " \$0,3908",
                                  style: TextStyle(
                                      fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                Row(
                                  children: [
                                    Image.asset("assets/images/up-arrow.png",
                                        height: 10, width: 12),
                                    Text(
                                      "0.24%",
                                      style: TextStyle(
                                          color: Color(0xff1DCE5C), fontSize: 13),
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
              GestureDetector(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Detail_crypto()));
                },
                child: Container(
                  height: height/9,
                  // width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: notifier.getContainerBorder, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage("assets/images/polygon.png"),
                                height: 40,
                                width: 40),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Polygon",
                                  style: TextStyle(
                                      fontSize: 15, color: notifier.textColor),
                                ),
                                AppConstants.Height(10),
                                Text("Matic",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            // Expand
                            // AppConstants.Width(60),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  " \$0,7869",
                                  style: TextStyle(
                                      fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/Down_red_arrow.png",
                                        height: 10,
                                        width: 12),
                                    Text(
                                      "0.54%",
                                      style: TextStyle(
                                          color: Color(0xffE82C81), fontSize: 13),
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
              AppConstants.Height(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => see_all(),));
                },
                child: Text(
                  "See All Assets",
                  style: TextStyle(
                      fontFamily: "Manrope-Medium",
                      fontSize: 15,
                      color: Color(0xff6B39F4),
                      fontWeight: FontWeight.w700),
                ),
              ),
              AppConstants.Height(20),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Reffle_code(),));
                    },
                    child: Container(
                      height: height/5.5,
                      decoration: BoxDecoration(
                          color: notifier.earn,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: notifier.getContainerBorder)
                      ),
                      child:  Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Earn up to 5% APR",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                Text(
                                  "Learn how to rewards on \nFinancial",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Manrope-Regular",
                                      color: Color(0xff64748B),
                                      wordSpacing: 4),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Image(
                              image: AssetImage('assets/images/Piggy bank.png'),
                              height: 96,
                              width: 90,
                            ),
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
                        fontSize: 17,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold"),
                  ),
                  // Expand
                  // AppConstants.Width(230),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => latest_news(),));
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff6B39F4),
                          fontFamily: "Manrope-Medium"),
                    ),
                  ),
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
                title: Text(
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
                    Text(
                      "The Block",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 12,
                          fontFamily: "Manrope-SemiBold"),
                    ),
                    AppConstants.Width(MediaQuery.of(context).size.width / 60),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifier.getContainerBorder),
                    ),
                    AppConstants.Width(MediaQuery.of(context).size.width / 60),
                    Text(
                      "2h ago",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontFamily: "Manrope-SemiBold",
                          fontSize: 12),
                    ),
                    Spacer(),
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
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/images/Nemus.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                title: Text(
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
                    Text(
                      "The Block",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 12,
                          fontFamily: "Manrope-SemiBold"),
                    ),
                    AppConstants.Width(MediaQuery.of(context).size.width / 60),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifier.getContainerBorder),
                    ),
                    AppConstants.Width(MediaQuery.of(context).size.width / 60),
                    Text(
                      "2h ago",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontFamily: "Manrope-SemiBold",
                          fontSize: 12),
                    ),
                    Spacer(),
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
                title: Text(
                  "Mango hack drama and other\nmajor crypto stories of the pa...",
                  style: TextStyle(
                      fontSize: 14,
                      color: notifier.textColor,
                      fontFamily: "Manrope-SemiBold"),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "The Block",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 12,
                          fontFamily: "Manrope-SemiBold"),
                    ),
                    AppConstants.Width(MediaQuery.of(context).size.width / 60),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifier.getContainerBorder),
                    ),
                    AppConstants.Width(MediaQuery.of(context).size.width / 60),
                    Text(
                      "2h ago",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontFamily: "Manrope-SemiBold",
                          fontSize: 12),
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz,color: notifier.textColor,)
                  ],
                ),
              ),
              AppConstants.Height(5),
              Divider(
                height: 2,
                thickness: 1,
                color:notifier.getContainerBorder,
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Text("Trending",
                      style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 16,
                          fontFamily: "Manrope-Bold",),),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Trending_see(),),);
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(fontSize: 14, color: Color(0xff6B39F4)),
                    ),
                  )
                ],
              ),
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
                              builder: (context) => Detail_crypto(),
                            ),);
                      },
                      child: Container(
                        height: height/5.5,
                        width: width/2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("data"),
                                  Image(
                                      image:
                                      AssetImage("assets/images/SHIB.png"),
                                      height: 40,
                                      width: 40),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SHIB",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      Text("Shiba Inu",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 10)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(17),
                              Text(
                                " \$0.09854",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Down_red_arrow.png",
                                    height: 10,
                                    width: 10,
                                  ),
                                  AppConstants.Width(3),
                                  Text("2.03%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: Color(0xffE82C81))),
                                  Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 33,
                                      width: 80,
                                      color: Color(0xffE82C81)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    AppConstants.Width(20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail_crypto(),
                            ));
                      },
                      child: Container(
                        height: height/5.5,
                        width: width/2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("data"),
                                  Image(
                                      image:
                                      AssetImage("assets/images/cardano.png"),
                                      height: 40,
                                      width: 40),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ADA",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      Text("Cardano",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 10)),
                                      // SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              ),
                              AppConstants.Height(17),
                              Text(
                                " \$0.3391",
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
                                  ),
                                  AppConstants.Width(3),
                                  Text("0.95%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: Color(0xff1DCE5C))),
                                  Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 33,
                                      width: 80,
                                      color: Color(0xff1DCE5C)),
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
                    "All Stocks",
                    style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 16,
                        fontFamily: "Manrope-Bold"),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/arrows-sort.png",
                    scale: 3,
                  ),
                  Text(
                    "Sort",
                    style: TextStyle(fontSize: 15, color: Color(0xff94A3B8)),
                  )
                ],
              ),
              AppConstants.Height(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_crypto(),));
                },
                child: Container(
                  height: height/9,
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
                            Image(
                                image: AssetImage("assets/images/Bitcoin.png"),
                                height: 40,
                                width: 40),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BTC",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text("Bitcoin",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    " \$19,073.00",
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
                                      Text(
                                        "0.66%",
                                        style: TextStyle(
                                            color: Color(0xff1DCE5C),
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
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_crypto(),));
                },
                child: Container(
                  height: height/9,
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
                            Image(
                                image: AssetImage(
                                    "assets/images/Ethereum (ETH).png"),
                                height: 40,
                                width: 40),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ETH",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text("Ethereum",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    " \$1,288.87",
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
                                      Text(
                                        "0.95%",
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
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_crypto(),));
                },
                child: Container(
                  height: height/9,
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
                            Image(
                                image: AssetImage("assets/images/bnb.png"),
                                height: 40,
                                width: 40),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "USDT",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text("Tether",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    " \$18,980.00",
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
                                      Text(
                                        "0.54%",
                                        style: TextStyle(
                                            color: Color(0xff1DCE5C),
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