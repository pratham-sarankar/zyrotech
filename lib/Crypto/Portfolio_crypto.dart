// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Buy_crypto.dart';
import 'Exchange_crypto.dart';
import 'History Crypto.dart';
import 'Sell crypto.dart';

class Portfolio_crypto extends StatefulWidget {
  const Portfolio_crypto({super.key});

  @override
  State<Portfolio_crypto> createState() => _Portfolio_cryptoState();
}

class _Portfolio_cryptoState extends State<Portfolio_crypto> {
  bool _password = true;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: const Color(0xff8247E5),
        // flexibleSpace: Image.asset("assets/images/Background (2).png",fit: BoxFit.cover,),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/Portfolio.png",
            color: Colors.white,
            scale: 3,
          ),
          Image.asset(
            "assets/images/receipt.png",
            scale: 3,
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/Background (2).png"),
                      fit: BoxFit.cover,
                    ),),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppConstants.Height(10),
                          const Column(
                            children: [
                              Text(
                                "Total asset value",
                                style: TextStyle(
                                    color: Color(0xff94A3B8),
                                    fontSize: 15,
                                    fontFamily: "Manrope-Regular",),
                              ),
                            ],
                          ),
                          AppConstants.Height(10),
                          Row(
                            children: [
                              _password
                                  ? const Text(
                                      " \$8,786.55",
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Color(0xffFFFFFF),
                                          fontFamily: "Manrope-Bold",),
                                    )
                                  : const Text(
                                      '  **********',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Color(0xffFFFFFF),),
                                    ),
                              AppConstants.Width(10),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _password = !_password;
                                    });
                                  },
                                  child: _password
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 24,
                                          color: Color(0xffFFFFFF),)
                                      : const Icon(
                                          Icons.visibility_off_outlined,
                                          size: 24,
                                          color: Color(0xffFFFFFF),),),
                              // Expand
                              const Spacer(),
                              // Expanded(child: AppConstants.Width(90)),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(0xff1DCE5C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              "assets/images/up-arrow.png",),
                                          color: Colors.white,
                                          height: 15,
                                          width: 15,),
                                      AppConstants.Width(5),
                                      const Text(
                                        "5.10% (+0.03%)",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontFamily: "Manrope-Medium",),
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
                  ),
                  Positioned(
                    bottom: 30,
                    left: 35,
                    right: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Sell_crypto(),
                                    ),);
                              },
                              child: Container(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color:
                                        Colors.purpleAccent.withOpacity(0.3)),
                                child: Center(
                                    child: Image.asset("assets/images/Send.png",
                                        scale: 2.5)),
                              ),
                            ),
                            AppConstants.Height(5),
                            const Text(
                              "Send",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffFFFFFF),
                                  fontFamily: "Manrope-SemiBold"),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const History_crypto(),
                                    ));
                              },
                              child: Container(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color:
                                        Colors.purpleAccent.withOpacity(0.3)),
                                child: Center(
                                    child: Image.asset(
                                        "assets/images/Recieve.png",
                                        scale: 2.5)),
                              ),
                            ),
                            AppConstants.Height(5),
                            const Text(
                              "Transaction",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffFFFFFF),
                                  fontFamily: "Manrope-SemiBold"),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Buy_crypto(),
                                    ));
                              },
                              child: Container(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.purpleAccent.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/buy_sell.png",
                                    scale: 2.5,
                                  ),
                                ),
                              ),
                            ),
                            AppConstants.Height(5),
                            const Text(
                              "Buy/sell",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-SemiBold",
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Exchange(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.purpleAccent.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/exchange.png",
                                    scale: 2.5,
                                  ),
                                ),
                              ),
                            ),
                            AppConstants.Height(5),
                            const Text(
                              "Exchange",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-SemiBold",
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: notifier.onboardBackgroundColor,
                    ),
                    child: Center(
                      child: TextField(
                        style: TextStyle(color: notifier.textColor),
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              "assets/images/Search.png",
                              scale: 3,
                              color: notifier.textFieldHintText,
                            ),
                          ),
                          hintText: "Search asset...",
                          hintStyle: TextStyle(
                            color: notifier.textFieldHintText,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.only(top: 20),
                        ),
                      ),
                    ),
                  ),
                  AppConstants.Height(20),
                  Text(
                    "Stock Assets",
                    style: TextStyle(
                      fontSize: 16,
                      color: notifier.textColor,
                      fontFamily: "Manrope-Bold",
                    ),
                  ),
                  AppConstants.Height(15),
                  Container(
                    height: height / 9,
                    // width: 365,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: notifier.getContainerBorder,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage(
                                  "assets/images/Bitcoin.png",
                                ),
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bitcoin",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(7),
                                  Row(
                                    children: [
                                      const Text(
                                        "BTC",
                                        style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13,
                                        ),
                                      ),
                                      AppConstants.Width(3),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xff64748B),
                                        ),
                                      ),
                                      AppConstants.Width(2),
                                      const Text(
                                        " \$13,029.46",
                                        style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13,
                                          fontFamily: "Manrope-Regular",
                                        ),
                                      )
                                    ],
                                  ),
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
                                      "0.678564 BTC",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold",
                                      ),
                                    ),
                                    AppConstants.Height(7),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/up-arrow.png",
                                          height: 10,
                                          width: 12,
                                        ),
                                        const Text(
                                          "0.35%",
                                          style: TextStyle(
                                            color: Color(0xff1DCE5C),
                                            fontSize: 13,
                                            fontFamily: "Manrope-SemiBold",
                                          ),
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
                  AppConstants.Height(15),
                  Container(
                    height: height / 9,
                    // width: 365,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: notifier.getContainerBorder,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage("assets/images/polygon.png"),
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Polygon",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(7),
                                  Row(
                                    children: [
                                      const Text(
                                        "MATIC",
                                        style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13,
                                        ),
                                      ),
                                      AppConstants.Width(3),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xff64748B),
                                        ),
                                      ),
                                      AppConstants.Width(2),
                                      const Text(
                                        " \$1,084.55",
                                        style: TextStyle(
                                            color: Color(0xff64748B),
                                            fontSize: 13,
                                            fontFamily: "Manrope-Regular"),
                                      )
                                    ],
                                  ),
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
                                      "1,300 MATIC",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope-Bold"),
                                    ),
                                    AppConstants.Height(7),
                                    Row(
                                      children: [
                                        Image.asset(
                                            "assets/images/Down_red_arrow.png",
                                            height: 10,
                                            width: 12),
                                        const Text(
                                          "0.10%",
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
                  AppConstants.Height(15),
                  Container(
                    height: height / 9,
                    // width: 365,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: notifier.getContainerBorder, width: 1)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                  image: AssetImage("assets/images/SOL.png"),
                                  height: 40,
                                  width: 40),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Solana",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(7),
                                  Row(
                                    children: [
                                      const Text("SOL",
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 13)),
                                      AppConstants.Width(3),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff64748B)),
                                      ),
                                      AppConstants.Width(2),
                                      const Text(
                                        " \$3,672.28",
                                        style: TextStyle(
                                            color: Color(0xff64748B),
                                            fontSize: 13,
                                            fontFamily: "Manrope-Regular"),
                                      )
                                    ],
                                  ),
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
                                      "130.99 SOL",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope-Bold"),
                                    ),
                                    AppConstants.Height(7),
                                    Row(
                                      children: [
                                        Image.asset(
                                            "assets/images/up-arrow.png",
                                            height: 10,
                                            width: 12),
                                        const Text(
                                          "0.10%",
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
                  AppConstants.Height(15),
                  Container(
                    height: height / 9,
                    // width: 365,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: notifier.getContainerBorder, width: 1)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                  image:
                                      AssetImage("assets/images/cardano.png"),
                                  height: 40,
                                  width: 40,),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cardano",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(7),
                                  Row(
                                    children: [
                                      const Text("ADA",
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 13)),
                                      AppConstants.Width(3),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff64748B)),
                                      ),
                                      AppConstants.Width(2),
                                      const Text(
                                        " \$87.69",
                                        style: TextStyle(
                                            color: Color(0xff64748B),
                                            fontSize: 13,
                                            fontFamily: "Manrope-Regular"),
                                      )
                                    ],
                                  ),
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
                                      "250 ADA",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope-Bold"),
                                    ),
                                    AppConstants.Height(7),
                                    Row(
                                      children: [
                                        Image.asset(
                                            "assets/images/up-arrow.png",
                                            height: 10,
                                            width: 12),
                                        const Text(
                                          "2.50%",
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
                  AppConstants.Height(30),
                ],
              ),
            ),
            //  TextField(),
            // Autocomplete<String>(
            //   optionsBuilder: (TextEditingValue optionTextEditingValue){
            //     if(optionTextEditingValue.text == ''){
            //       return const Iterable<String>.empty();
            //     }
            //     return complete.where((String option){
            //       return option.contains(optionTextEditingValue.text.toLowerCase());
            //     });
            //   },
            //   onSelected: (String value){
            //     debugPrint(' just selected $value');
            //   },
            //
            // ),
          ],
        ),
      ),
    );
  }
}
