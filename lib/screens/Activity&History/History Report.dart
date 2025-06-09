// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/config/common.dart';
import '../../Dark mode.dart';

class History_report extends StatefulWidget {
  const History_report({super.key});

  @override
  State<History_report> createState() => _History_reportState();
}

class _History_reportState extends State<History_report> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            scale: 2.9,
            color: notifier.textColor,
          ),
        ),
        title: Center(
            child: Text("Bought Cardano",
                style: TextStyle(
                    fontSize: 16,
                    color: notifier.textColor,
                    fontFamily: "Manrope-Bold"))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    alignment: const Alignment(0, 1),
                    elevation: 0,
                    backgroundColor: notifier.background,
                    actions: [
                      SizedBox(
                        height: 270,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                AppConstants.Height(20),
                                Container(
                                  height: 58,
                                  width: 58,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: notifier.textField,
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/download.png"),
                                          scale: 2)),
                                ),
                                AppConstants.Height(20),
                                Text(
                                  "Download Reports",
                                  style: TextStyle(
                                      color: notifier.textColor,
                                      fontSize: 18,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text(
                                  "Malesuada at et non accumsan a\n morbi fames volutpat volutpat.",
                                  style: TextStyle(
                                      color: Color(0xff64748B),
                                      fontSize: 14,
                                      fontFamily: "Manrope-Regular"),
                                ),
                                AppConstants.Height(30),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: width / 4,
                                        decoration: BoxDecoration(
                                            color: notifier.textField,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text("Cancel",
                                                style: TextStyle(
                                                    color: Color(0xff6B39F4),
                                                    fontSize: 14,
                                                    fontFamily:
                                                        "Manrope-Bold"))),
                                      ),
                                    ),
                                    const Expanded(
                                        child: SizedBox(
                                      width: 30,
                                    )),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: width / 4,
                                        // width: 130,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff6B39F4),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text(
                                          "Download",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Manrope-Bold",
                                              color: Color(0xffFFFFFF)),
                                        )),
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
                );
              },
              child: Image.asset(
                "assets/images/download.png",
                height: 25,
                width: 25,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    AppConstants.Height(30),
                    Image.asset(
                      "assets/images/cardano.png",
                      scale: 2,
                    ),
                    AppConstants.Height(10),
                    const Text(
                      "1,250 ADA",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 15,
                          fontFamily: "Manrope-Regular"),
                    ),
                    AppConstants.Height(5),
                    Text(
                      " 105.00",
                      style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 24,
                          fontFamily: "Manrope-Bold"),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(20),
              Container(
                height: 392,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: notifier.isDark
                        ? notifier.getContainerBorder
                        : notifier.getContainerBorder,
                  ), /*color: notifier.isDark?notifier.background:Colors.blue*/
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      AppConstants.Height(15),
                      Row(
                        children: [
                          const Text(
                            "Reference code",
                            style: TextStyle(
                                color: Color(0xff64748B), fontSize: 14),
                          ),
                          const Spacer(),
                          Text(
                            " AqUXby",
                            style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Medium"),
                          ),
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        thickness: 1,
                        color: notifier.getContainerBorder,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text(
                            "Price percoin",
                            style: TextStyle(
                                color: Color(0xff64748B), fontSize: 14),
                          ),
                          const Spacer(),
                          Text(
                            " 0.3913",
                            style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Medium"),
                          ),
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        thickness: 1,
                        color: notifier.getContainerBorder,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text(
                            "Network fee",
                            style: TextStyle(
                                color: Color(0xff64748B), fontSize: 14),
                          ),
                          const Spacer(),
                          Text(
                            " 0.00",
                            style: TextStyle(
                                fontSize: 14,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Medium"),
                          ),
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        thickness: 1,
                        color: notifier.getContainerBorder,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text(
                            "Payment",
                            style: TextStyle(
                                color: Color(0xff64748B), fontSize: 14),
                          ),
                          const Spacer(),
                          Text(
                            " Bank of America",
                            style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Medium"),
                          )
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        thickness: 1,
                        color: notifier.getContainerBorder,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text("Time",
                              style: TextStyle(
                                  color: Color(0xff64748B), fontSize: 14)),
                          const Spacer(),
                          Text(
                            "10 Sep 2022, 02:00 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Medium"),
                          )
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        thickness: 1,
                        color: notifier.getContainerBorder,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text("Status",
                              style: TextStyle(
                                  color: Color(0xff64748B), fontSize: 14)),
                          const Spacer(),
                          Container(
                            height: 24,
                            width: 72,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green.withValues(alpha: 0.1)),
                            child: const Center(
                                child: Text("Successfull",
                                    style: TextStyle(
                                        color: Color(0xff1DCE5C),
                                        fontSize: 10,
                                        fontFamily: "Manrope-Bold"))),
                          ),
                          // Text("10 Sep 2022, 02:00 PM",style: TextStyle(fontSize: 15,color: Color(0xff0F172A),fontFamily: "Manrope-Medium"),)
                        ],
                      ),
                      AppConstants.Height(10),
                      Divider(
                        thickness: 1,
                        color: notifier.getContainerBorder,
                      ),
                      AppConstants.Height(10),
                      Row(
                        children: [
                          const Text("Total buy amount",
                              style: TextStyle(
                                  color: Color(0xff64748B), fontSize: 14)),
                          const Spacer(),
                          Text(
                            " 105.00",
                            style: TextStyle(
                                fontSize: 15,
                                color: notifier.textColor,
                                fontFamily: "Manrope-Medium"),
                          )
                        ],
                      ),
                      AppConstants.Height(10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
