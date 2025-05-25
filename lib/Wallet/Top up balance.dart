// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Top up Payment method.dart';

class Top_up extends StatefulWidget {
  const Top_up({super.key});

  @override
  State<Top_up> createState() => _Top_upState();
}

class _Top_upState extends State<Top_up> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
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
        title: Center(
          child: Text(
            "Deposit",
            style: TextStyle(
              fontSize: 15,
              color: notifier.textColor,
              fontFamily: "Manrope-Bold",
            ),
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/question-circle-outlined.png",
            scale: 3,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Center(
                child: Container(
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
                      style: TextStyle(
                        fontSize: 35,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold",
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(bottom: 2, left: 8, top: 15),
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
            AppConstants.Height(20),
            const Text(
              "Top up fee 2.00",
              style: TextStyle(
                color: Color(0xff64748B),
                fontSize: 12,
                fontFamily: "Manrope-Medium",
              ),
            ),
            AppConstants.Height(20),
            Container(
              height: height / 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: notifier.getContainerBorder,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: notifier.getContainerBorder,
                          ),
                          child: const Image(
                            image: AssetImage(
                              "assets/images/Bank America icon.png",
                            ),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank of America",
                              style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
                            AppConstants.Height(10),
                            const Text(
                              "Checked automatically",
                              style: TextStyle(
                                color: Color(0xff64748B),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Text(
                                "Change",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold",
                                  color: Color(0xff6B39F4),
                                ),
                              )
                            ],
                          ),
                        ),
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
                builder: (context) => const Top_payment(),
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
                child: Text("Deposit Preview",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "̌Manrope-Bold"))),
          ),
        ),
      ),
    );
  }
}
