// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Transferbalance contact.dart';

class Recevie_balance extends StatefulWidget {
  const Recevie_balance({super.key});

  @override
  State<Recevie_balance> createState() => _Recevie_balanceState();
}

class _Recevie_balanceState extends State<Recevie_balance> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: notifier.textColor,
          ),
        ),
        title: Center(
            child: Text("Recieve USD",
                style: TextStyle(fontSize: 16, color: notifier.textColor))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/question-circle-outlined.png",
              width: 23,
            ),
          ),
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            AppConstants.Height(60),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  // alignment: Alignment.center,
                  height: height / 11,
                  // width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifier.background,
                    border: Border.all(
                      color: notifier.getContainerBorder,
                    ),
                  ),
                  child: Center(
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 35,
                          color: Color(0xff0F172A),
                          fontFamily: "Manrope-Bold"),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Center(
            //   child: Container(
            //     height: height/12,
            //     width: width/2,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       color: notifier.background, border: Border.all(color: notifier.getContainerBorder)
            //     ),
            //     child: const TextField(
            //       keyboardType: TextInputType.number,
            //       // decoration: OutlineInputBorder
            //
            //         /*border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(15),
            //             borderSide: const BorderSide(color: Colors.white)),*/
            //       // ),
            //     ),
            //   ),
            // ),
            AppConstants.Height(9),
            const Text(
              "USD Balance 8,786.55",
              style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 12,
                  fontFamily: "Manrope-Bold"),
            ),
            AppConstants.Height(20),
            Container(
              height: height / 8.5,
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
                        const Image(
                          image: AssetImage("assets/images/Airbnb.png"),
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Aileen Fullbright",
                              style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
                            AppConstants.Height(10),
                            const Text(
                              "+1 7896 8797 908",
                              style: TextStyle(
                                color: Color(0xff64748B),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(top: 15,right: 10),
                          child: Column(
                            children: [
                              Text(
                                "Change",
                                style: TextStyle(
                                  color: Color(0xff6B39F4),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold",
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
            // AppConstants.Height(40),
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
                  builder: (context) => const Transfer_contact(),
                ));
          },
          child: Container(
            height: 56,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
                child: Text("Recieve Preview",
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
