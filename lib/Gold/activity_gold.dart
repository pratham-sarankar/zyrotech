// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Activity&History/See All Transaction History.dart';
import '../Dark mode.dart';

class Activity_gold extends StatefulWidget {
  const Activity_gold({super.key});

  @override
  State<Activity_gold> createState() => _Activity_goldState();
}

class _Activity_goldState extends State<Activity_gold> {
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
            scale: 2.9,color: notifier.textColor,
          ),
        ),
        title: Center(
            child: Text("Activity",
                style: TextStyle(fontSize: 16, color: notifier.textColor))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/Filter_.png",
              height: 25,
              width: 25,
              color: notifier.textColor,
            ),
          ),
          AppConstants.Width(20),
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(30),
              const Text("20 October 2022",style: TextStyle(fontSize: 16,color: Color(0xff64748B),fontFamily: "Manrope-Medium"),),
              AppConstants.Height(20),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: transactionDetail.length,
                  itemBuilder: (context, index) {
                    TransactionModel data = transactionDetail[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
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
                                      image: AssetImage(data.image),
                                      height: 40,width: 40),
                                  const SizedBox(width: 15,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.name,
                                        style: TextStyle(
                                            fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                      ),
                                      AppConstants.Height(10),
                                      Text(data.time,
                                          style: const TextStyle(
                                              color: Color(0xff64748B), fontSize: 13)),
                                    ],
                                  ),
                                  // AppConstants.Width(60),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        data.percentage,
                                        style: TextStyle(
                                            fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                      ),
                                      AppConstants.Height(10),
                                      Text(
                                        data.ruppes,
                                        style: const TextStyle(
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
                    );
                  }),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Order_gold(),));
              //   },
              //   child: Container(
              //     height: MediaQuery.of(context).size.height / 9,
              //     // width: 365,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Image(
              //                   image: AssetImage("assets/images/gold_icon.png"),
              //                   height: 40,width: 40),
              //               SizedBox(width: 15,),
              //               Column(
              //                  crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Buy Gold",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   const Text("04:00 PM",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               // AppConstants.Width(60),
              //               Spacer(),
              //               Column(
              //                 children: [
              //                   Text(
              //                     " + 1,0g",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
              //                   ),
              //                   AppConstants.Height(10),
              //                   Text(
              //                     "87.65",
              //                     style: TextStyle(
              //                         color: Color(0xff64748B), fontSize: 13),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // AppConstants.Height(10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Order_gold(),));
              //   },
              //   child: Container(
              //     height: MediaQuery.of(context).size.height / 9,
              //
              //     // width: 365,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Image(
              //                   image: AssetImage("assets/images/gold_icon.png"),
              //                   height: 40,width: 40),
              //               SizedBox(width: 15,),
              //               Column(
              //                  crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Sell Gold",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   const Text("10:15 AM",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               // AppConstants.Width(60),
              //               Spacer(),
              //               Column(
              //                 children: [
              //                   Text(
              //                     " - 5,0g",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xffE82C81),fontFamily: "Manrope-Bold"),
              //                   ),
              //                   AppConstants.Height(10),
              //                   Text(
              //                     "549.00",
              //                     style: TextStyle(
              //                         color: Color(0xff64748B), fontSize: 13),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // AppConstants.Height(10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Order_gold(),));
              //   },
              //   child: Container(
              //     height: MediaQuery.of(context).size.height / 9,
              //
              //     // width: 365,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Image(
              //                   image: AssetImage("assets/images/dollar_Icon.png"),
              //                   height: 40,width: 40),
              //               SizedBox(width: 15,),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Deposit (USD)",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   const Text("07:00 AM",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               // AppConstants.Width(60),
              //               Spacer(),
              //               Padding(
              //                 padding: const EdgeInsets.only(top: 15),
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       "+ 234.00g",
              //                       style: TextStyle(
              //                           fontSize: 15, color: Color(0xff1DCE5C),fontFamily: "Manrope-Bold"),
              //                     ),
              //
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // AppConstants.Height(20),
              // Text("10 October 2022",style: TextStyle(fontSize: 16,color: Color(0xff64748B),fontFamily: "Manrope-Medium"),),
              // AppConstants.Height(20),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Order_gold(),));
              //   },
              //   child: Container(
              //     height: MediaQuery.of(context).size.height / 9,
              //
              //     // width: 365,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Image(
              //                   image: AssetImage("assets/images/dollar_Icon.png"),
              //                   height: 40,width: 40),
              //               SizedBox(width: 15,),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Deposit (USD)",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   const Text("07:00 AM",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               // AppConstants.Width(60),
              //               Spacer(),
              //               Padding(
              //                 padding: const EdgeInsets.only(top: 15),
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       "+ 560.00g",
              //                       style: TextStyle(
              //                           fontSize: 15, color: Color(0xff1DCE5C),fontFamily: "Manrope-Bold"),
              //                     ),
              //
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // AppConstants.Height(10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Order_gold(),));
              //   },
              //   child: Container(
              //     height: MediaQuery.of(context).size.height / 9,
              //
              //     // width: 365,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Image(
              //                   image: AssetImage("assets/images/gold_icon.png"),
              //                   height: 40,width: 40),
              //               SizedBox(width: 15,),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Buy Gold",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   const Text("04:00 PM",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               // AppConstants.Width(60),
              //               Spacer(),
              //               Column(
              //                 children: [
              //                   Text(
              //                     " + 1,0g",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
              //                   ),
              //                   AppConstants.Height(10),
              //                   Text(
              //                     "87.65",
              //                     style: TextStyle(
              //                         color: Color(0xff64748B), fontSize: 13),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // AppConstants.Height(10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => Order_gold(),));
              //   },
              //   child: Container(
              //     height: MediaQuery.of(context).size.height / 9,
              //
              //     // width: 365,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Image(
              //                   image: AssetImage("assets/images/gold_icon.png"),
              //                   height: 40,width: 40),
              //               SizedBox(width: 15,),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Sell Gold",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xff0F172A)),
              //                   ),
              //                   AppConstants.Height(10),
              //                   const Text("10:15 AM",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               // AppConstants.Width(60),
              //               Spacer(),
              //               Column(
              //                 children: [
              //                   Text(
              //                     " - 5,0g",
              //                     style: TextStyle(
              //                         fontSize: 15, color: Color(0xffE82C81),fontFamily: "Manrope-Bold"),
              //                   ),
              //                   AppConstants.Height(10),
              //                   Text(
              //                     "549.00",
              //                     style: TextStyle(
              //                         color: Color(0xff64748B), fontSize: 13),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // AppConstants.Height(30),
            ],
          ),
        ),
      ),

    );
  }
}
