// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Recieve balance.dart';
import 'Top up balance.dart';
import 'Transaction all.dart';
import 'Transfer balance.dart';
import 'Withdraw Balance.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool _password = true;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        elevation: 0,
        // title: const Text(
        //   "Wallet",
        //   style: TextStyle(
        //     color: Color(0xffFFFFFF),
        //     fontSize: 16,
        //   ),
        // ),
        centerTitle: true,
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
        backgroundColor: const Color(0xff6B39F4),
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
                  height: MediaQuery.of(context).size.height / 2.8,
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
                              "USD Balance",
                              style: TextStyle(
                                color: Color(0xff94A3B8),
                                fontSize: 15,
                                fontFamily: "Manrope-Regular",
                              ),
                            ),
                          ],
                        ),
                        AppConstants.Height(10),
                        Row(
                          children: [
                            _password
                                ? const Text(
                                    "\$8,786.55",
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  )
                                : const Text(
                                    '  ********',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Color(0xffFFFFFF),
                                    ),
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
                                      Icons.visibility,
                                      size: 24,
                                      color: Color(0xffFFFFFF),
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      size: 24,
                                      color: Color(0xffFFFFFF),
                                    ),
                            ),
                            // Expand
                            // Expanded(child: AppConstants.Width(90)),
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
                                    builder: (context) => const Top_up(),
                                  ),);
                            },
                            child: Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.purpleAccent.withOpacity(0.3)),
                              child: const Center(
                                  child: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          AppConstants.Height(5),
                          const Text(
                            "Deposit",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-SemiBold",),
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
                                    builder: (context) => const Withdraw(),
                                  ));
                            },
                            child: Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.purpleAccent.withOpacity(0.3)),
                              child: Center(
                                  child: Image.asset(
                                      "assets/images/Recieve.png",
                                      scale: 2.5,),),
                            ),
                          ),
                          AppConstants.Height(5),
                          const Text(
                            "Withdraw",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-SemiBold",),
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
                                        const Transfer_balance(),
                                  ),);
                            },
                            child: Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.purpleAccent.withOpacity(0.3),),
                              child: Center(
                                  child: Image.asset("assets/images/logout.png",
                                      scale: 2.5,),),
                            ),
                          ),
                          AppConstants.Height(5),
                          const Text(
                            "Send",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-SemiBold",),
                          ),
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
                                        const Recevie_balance(),
                                  ),);
                            },
                            child: Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.purpleAccent.withOpacity(0.3)),
                              child: Center(
                                  child: Image.asset(
                                      "assets/images/coin white.png",
                                      scale: 2.5)),
                            ),
                          ),
                          AppConstants.Height(5),
                          const Text(
                            "Receive",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-SemiBold"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Transactions",
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
                                builder: (context) => const Transaction_all(),
                              ));
                        },
                        child: const Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff6B39F4),
                              fontFamily: "Manrope - Regular"),
                        ),
                      )
                    ],
                  ),
                  AppConstants.Height(20),
                  const Text(
                    "20 October 2022",
                    style: TextStyle(
                        fontFamily: "Manrope - Regular",
                        color: Color(0xff64748B),
                        fontSize: 15),
                  ),
                  AppConstants.Height(20),
                  Container(
                    height: height / 9,
                    // width: 365,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: notifier.getContainerBorder, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
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
                                width: 40,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Send (AMZN)",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text("07:00 PM",
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
                                    "- 2.00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text(
                                    " 224.90",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppConstants.Height(20),
                  const Text(
                    "15 October 2022",
                    style: TextStyle(
                        fontFamily: "Manrope - Regular",
                        color: Color(0xff64748B),
                        fontSize: 15),
                  ),
                  AppConstants.Height(20),
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
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: const AssetImage(
                                    "assets/images/apple-logo.png"),
                                height: 40,
                                width: 40,
                                color: notifier.textColor,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Buy AAPL",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text(
                                    "04:00 PM",
                                    style: TextStyle(
                                      color: Color(0xff64748B),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              // AppConstants.Width(60),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "+7.00",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text(
                                    " 1,016.33",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppConstants.Height(20),
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
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage("assets/images/cardano.png"),
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sell ADA",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text("03:00 PM",
                                      style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13)),
                                ],
                              ),
                              // AppConstants.Width(60),
                              const Spacer(),
                              Column(
                                children: [
                                  const Text(
                                    "- 250",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffE82C81),
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text(
                                    " 87.69",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13),
                                  ),
                                ],
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
            )
          ],
        ),
      ),
    );
  }
}
