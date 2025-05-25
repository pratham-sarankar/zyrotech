// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Bank Account Add bank.dart';
import 'Bank Account detail.dart';

class Bank_account extends StatefulWidget {
  const Bank_account({super.key});

  @override
  State<Bank_account> createState() => _Bank_accountState();
}

class _Bank_accountState extends State<Bank_account> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
        title: Text("Bank Account",
            style: TextStyle(
                fontFamily: "Manrope-Bold",
                color: notifier.textColor,
                fontSize: 16)),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(30),
            const Text(
              "Bank Account",
              style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 15,
                  fontFamily: "Manrope-Bold"),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Bank_detail(),
                    ));
              },
              child: Container(
                height: height / 10,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(
                            image:
                                AssetImage("assets/images/Bank of america.png"),
                            height: 35,
                            width: 35,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bank of America",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text(
                                "**** **** **** 8907",
                                style: TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 13,
                                ),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Bank_detail(),
                    ));
              },
              child: Container(
                height: height / 10,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/Barclays.png"),
                            height: 35,
                            width: 35,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Barclays",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text(
                                "**** **** **** 8907",
                                style: TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 13,
                                ),
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
            const Text(
              "E-wallet",
              style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 15,
                  fontFamily: "Manrope-Bold"),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Bank_detail(),
                    ));
              },
              child: Container(
                height: height / 10,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/Paypal.png"),
                            height: 35,
                            width: 35,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paypal",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text(
                                "helenasarapova@mail.com",
                                style: TextStyle(
                                  color: Color(0xff64748B),
                                  fontSize: 13,
                                ),
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Bank_account_add_bank(),
              ),
            );
          },
          child: Container(
            height: 56,
            // width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
              child: Text(
                "Add Bank Account/E-wallet",
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
