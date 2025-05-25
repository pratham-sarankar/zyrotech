// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Order_success.dart';

class Confirm_order extends StatefulWidget {
  const Confirm_order({super.key});

  @override
  State<Confirm_order> createState() => _Confirm_orderState();
}

class _Confirm_orderState extends State<Confirm_order> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: notifier.textColor,
          ),
        ),
        title: Text(
          "Order Preview",
          style: TextStyle(
            fontFamily: "Manrope-Bold",
            fontSize: 16,
            color: notifier.textColor,
          ),
        ),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 19, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(20),
            Container(
              height: height / 9,
              // width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: notifier.getContainerBorder,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/Bitcoin.png"),
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BTC",
                              style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
                            AppConstants.Height(10),
                            const Text(
                              "Bitcoin",
                              style: TextStyle(
                                color: Color(0xff64748B),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        // AppConstants.Width(60),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                " 1,245.00",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold",
                                ),
                              ),
                              AppConstants.Height(10),
                              const Text(
                                " 0.061 BTC",
                                style: TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 13,
                                ),
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
            AppConstants.Height(20),
            Text(
              "Order summary",
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 16,
                fontFamily: "Manrope-Bold",
              ),
            ),
            AppConstants.Height(20),
            Container(
              height: 265,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: notifier.onboardBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    AppConstants.Height(15),
                    Row(
                      children: [
                        const Text(
                          "BTC price",
                          style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          " 0.061 BTC",
                          style: TextStyle(
                            fontSize: 15,
                            color: notifier.textColor,
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                      ],
                    ),
                    AppConstants.Height(5),
                    Divider(
                      thickness: 1,
                      color: notifier.divider,
                    ),
                    AppConstants.Height(5),
                    Row(
                      children: [
                        const Text(
                          "Amount",
                          style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          " 1,245.00",
                          style: TextStyle(
                            fontSize: 15,
                            color: notifier.textColor,
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: notifier.divider,
                    ),
                    AppConstants.Height(5),
                    Row(
                      children: [
                        const Text(
                          "Payment method",
                          style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          " Bank of America",
                          style: TextStyle(
                            fontSize: 14,
                            color: notifier.textColor,
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: notifier.divider,
                    ),
                    AppConstants.Height(5),
                    Row(
                      children: [
                        const Text(
                          "Financial fee",
                          style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          " 8.00",
                          style: TextStyle(
                            fontSize: 15,
                            color: notifier.textColor,
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: notifier.divider,
                    ),
                    AppConstants.Height(5),
                    const Row(
                      children: [
                        Text(
                          "Buy fee",
                          style: TextStyle(
                            color: Color(0xff64748B),
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Text(
                          " Free",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff1DCE5C),
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: notifier.divider,
                    ),
                    AppConstants.Height(5),
                    Row(
                      children: [
                        Text(
                          "Total buy",
                          style: TextStyle(
                            color: notifier.bottom,
                            fontSize: 14,
                            fontFamily: "Manrope-Bold",
                          ),
                        ),
                        const Spacer(),
                        Text(
                          " 1,253.00",
                          style: TextStyle(
                            fontSize: 15,
                            color: notifier.textColor,
                            fontFamily: "Manrope-Bold",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 15, right: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Order_success(),
              ),
            );
          },
          child: Container(
            height: 56,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
              child: Text(
                "Buy Now",
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
}
