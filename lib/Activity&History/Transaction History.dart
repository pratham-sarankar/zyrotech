// ignore_for_file: file_names
import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'See All Transaction History.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          child: Text(
            "Transaction History",
            style: TextStyle(
              fontSize: 16,
              color: notifier.textColor,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/Filter_.png",
              height: 25,
              width: 25,
              color: notifier.textColor,
            ),
          ),
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(20),
              const Text(
                "20 October 2022",
                style: TextStyle(
                  color: Color(0xff64748B),
                  fontSize: 15,
                  fontFamily: "Manrope-Regular",
                ),
              ),
              AppConstants.Height(20),
              Column(
                children: [
                  AppConstants.Height(10),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: transactionDetail.length,
                      itemBuilder: (context, index) {
                        TransactionModel data = transactionDetail[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: height / 9.5,
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
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image(
                                        image: AssetImage(data.image),
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.name,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: notifier.textColor,
                                              fontFamily: "Manrope-Bold",
                                            ),
                                          ),
                                          AppConstants.Height(10),
                                          Text(
                                            data.time,
                                            style: const TextStyle(
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
                                            data.percentage,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: notifier.textColor,
                                              fontFamily: "Manrope-Bold",
                                            ),
                                          ),
                                          AppConstants.Height(10),
                                          Text(
                                            data.ruppes,
                                            style: const TextStyle(
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
                        );
                      }),
                ],
              ),
              /* Container(
                height: height/9,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage("assets/images/amazon.png"),
                              height: 40,width: 40),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Send (AMZN)",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("07:00 PM",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
                            ],
                          ),
                          // AppConstants.Width(60),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "- 2.00",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              Text(
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
              Text("15 October 2022",style: TextStyle(color: Color(0xff64748B),fontSize: 15,fontFamily: "Manrope-Regular"),),
              AppConstants.Height(20),
              Container(
                height: height/9,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage("assets/images/apple-logo.png"),
                              height: 40,width: 40,color: notifier.textColor),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buy AAPL",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("04:00 PM",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
                            ],
                          ),
                          // AppConstants.Width(60),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                " +7.00",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              Text(
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
                height: height/9,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage("assets/images/cardano.png"),
                              height: 40,width: 40),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sell ADA",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("04:00 PM",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
                            ],
                          ),
                          // AppConstants.Width(60),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "- 250",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffE82C81),fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              Text(
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
              AppConstants.Height(20),
              Text("30 September 2022",style: TextStyle(color: Color(0xff64748B),fontSize: 15,fontFamily: "Manrope-Regular"),),
              AppConstants.Height(20),
              Container(
                height: height/9,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage("assets/images/amazon.png"),
                              height: 40,width: 40),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buy AMD",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("02:15 PM",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
                            ],
                          ),
                          // AppConstants.Width(60),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "+ 3.00",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              Text(
                                " 172.38",
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
                height: height/9,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage("assets/images/gold_icon.png"),
                              height: 40,width: 40),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buy Gold",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor),
                              ),
                              AppConstants.Height(10),
                              const Text("04:00 PM",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
                            ],
                          ),
                          // AppConstants.Width(60),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                " + 1,0g",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              Text(
                                "87.65",
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
                height: 80,
                // width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.getContainerBorder, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                              image: AssetImage("assets/images/gold_icon.png"),
                              height: 40,width: 40),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sell Gold",
                                style: TextStyle(
                                    fontSize: 15, color: notifier.textColor),
                              ),
                              AppConstants.Height(10),
                              const Text("10:15 AM",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
                            ],
                          ),
                          // AppConstants.Width(60),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Text(
                                  " - 5,0g",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xffE82C81),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                Text(
                                  "549.00",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
