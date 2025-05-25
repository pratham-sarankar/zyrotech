// ignore_for_file: file_names, camel_case_types, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Buy Stock.dart';
import 'Exchange_stock.dart';
import 'History_stock.dart';
import 'Sell Stock.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  bool _password = true;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        // backgroundColor: Color(0xff8247E5),
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
          SizedBox(width: 5),
          Image.asset(
            "assets/images/receipt.png",
            scale: 3,
            color: Colors.white,
          ),
          SizedBox(width: 5),
        ],
        backgroundColor: const Color(0xff8247E5),
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
                    )),
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
                                    fontFamily: "Manrope-Regular"),
                              ),
                            ],
                          ),
                          AppConstants.Height(10),
                          Row(
                            children: [
                              _password
                                  ? const Text(
                                      "\$12,768.00",
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Color(0xffFFFFFF),
                                          fontFamily: "Manrope-Bold"),
                                    )
                                  : const Text(
                                      '  ***********',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Color(0xffFFFFFF)),
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
                                          color: Color(0xffFFFFFF))
                                      : const Icon(
                                          Icons.visibility_off_outlined,
                                          size: 24,
                                          color: Color(0xffFFFFFF))),
                              // Expand
                              const Spacer(),
                              // Expanded(child: AppConstants.Width(90)),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 33,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(0xff1DCE5C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              "assets/images/up-arrow.png"),
                                          color: Colors.white,
                                          height: 15,
                                          width: 15),
                                      AppConstants.Width(5),
                                      const Text(
                                        "9.10%",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontFamily: "Manrope-Medium"),
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
                                      builder: (context) => const Buy_stock(),
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
                                          const History_stock(),
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
                                    child: Image.asset(
                                  "assets/images/Recieve.png",
                                  scale: 2.5,
                                )),
                              ),
                            ),
                            AppConstants.Height(5),
                            const Text(
                              "Recieve",
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
                                    builder: (context) => const Sell_stock(),
                                  ),
                                );
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
                                    builder: (context) =>
                                        const Exchange_stock(),
                                  ),
                                );
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
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: notifier.onboardBackgroundColor,
                    ),
                    child: TextField(
                      style: TextStyle(color: notifier.textColor),
                      decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset("assets/images/Search.png",
                                scale:
                                    3) /*Icon(Icons.search, color: notifier.textFieldHintText)*/,
                          ),
                          hintText: "Search asset...",
                          hintStyle: TextStyle(
                              color: notifier.textFieldHintText, fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.only(top: 20)),
                    ),
                  ),
                  AppConstants.Height(20),
                  Text(
                    "Stock Assets",
                    style: TextStyle(
                        fontSize: 16,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold"),
                  ),
                  AppConstants.Height(20),
                  Container(
                    height: 156,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: notifier.getContainerBorder, width: 1),
                        color: notifier.background),
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
                                  image: AssetImage("assets/images/amazon.png"),
                                  height: 40,
                                  width: 40),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "AMZN",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope-Bold",
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text("Amazon, Inc",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 10)),
                                ],
                              ),
                              const Spacer(),
                              Image.asset("assets/images/ABNB Chart.png",
                                  height: 42, width: 100, color: Colors.green),
                            ],
                          ),
                          AppConstants.Height(20),
                          Container(
                            height: 1,
                            width: 500,
                            color: notifier.divider,
                          ),
                          AppConstants.Height(20),
                          const Row(
                            children: [
                              Text(
                                " 10 Shares",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular"),
                              ),
                              Spacer(),
                              Text(
                                "Gain/Loss",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontSize: 12,
                                    fontFamily: "Manrope-Regular"),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(" \$4,987.00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Manrope-Bold",
                                      color: notifier.textColor)),
                              const Spacer(),
                              const Text(
                                "+1,897.00",
                                style: TextStyle(
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14,
                                    color: Color(0xff1DCE5C)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  AppConstants.Height(15),
                  Container(
                    height: 156,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: notifier.getContainerBorder, width: 1),
                        color: notifier.background),
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
                                  image: AssetImage("assets/images/Airbnb.png"),
                                  height: 40,
                                  width: 40),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "ABNB",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope-Bold",
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text("Airbnb, Inc",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 10)),
                                ],
                              ),
                              const Spacer(),
                              Image.asset("assets/images/ABNB Chart.png",
                                  height: 42,
                                  width: 100,
                                  color: const Color(0xff1e82c81)),
                            ],
                          ),
                          AppConstants.Height(20),
                          Container(
                            height: 1,
                            width: 500,
                            color: notifier.divider,
                          ),
                          AppConstants.Height(20),
                          const Row(
                            children: [
                              Text(
                                " 5 Shares",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular"),
                              ),
                              Spacer(),
                              Text(
                                "Gain/Loss",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontSize: 12,
                                    fontFamily: "Manrope-Regular"),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(" \$2,432.00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Manrope-Bold",
                                      color: notifier.textColor)),
                              const Spacer(),
                              const Text(
                                "-562.00",
                                style: TextStyle(
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14,
                                    color: Color(0xff1E82C81)),
                              )
                            ],
                          )
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
