// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Dark mode.dart';
import '../Home/bottom.dart';

class Transfer_confirmation extends StatefulWidget {
  final String image_;
  final String name_;
  const Transfer_confirmation({super.key, required this.image_, required this.name_});

  @override
  State<Transfer_confirmation> createState() => _Transfer_confirmationState();
}

class _Transfer_confirmationState extends State<Transfer_confirmation> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  const Color(0xff0F172A),
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: Colors.white,)),
          title: const Text(
            "Transfer Preview",
            style: TextStyle(
                fontFamily: "Manrope-Bold",
                fontSize: 16,
                color: Colors.white),
          ),
          backgroundColor: const Color(0xff0F172A),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  children: [Container(
                    height: 600,

                  ),
                    Positioned(
                      top: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Container(
                          height: height/1.5,
                          width: width / 1.1,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifier.onboardBackgroundColor),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Column(
                              children: [
                                AppConstants.Height(30),
                                CircleAvatar(
                                backgroundImage: AssetImage(widget.image_),radius: 30
                                    ),
                                AppConstants.Height(10),
                                Text(widget.name_,style: const TextStyle(color: Color(0xff64748B),fontSize: 12,fontFamily: "Manrope-Regular"),),
                                AppConstants.Height(5),
                                Text(" 567.00",style: TextStyle(fontFamily: "Manrope-Bold",fontSize:18 ,color: notifier.textColor),),
                                AppConstants.Height(20),
                                Row(
                                  children: [
                                    const Text("Transfer ID",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                                    const Spacer(),
                                    Text("123Tyu890XBNu",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                  ],
                                ),
                                AppConstants.Height(5),
                                Divider(
                                  color: notifier.divider,
                                ),
                                AppConstants.Height(5),
                                Row(
                                  children: [
                                    const Text("Recipient",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                                    const Spacer(),
                                    Text(widget.name_,style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                  ],
                                ),
                                AppConstants.Height(5),
                                Divider(
                                  color: notifier.divider,
                                ),
                                AppConstants.Height(5),
                                Row(
                                  children: [
                                    const Text("Transfer amount",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                                    const Spacer(),
                                    Text(" 567.00",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                  ],
                                ),
                                AppConstants.Height(5),
                                Divider(
                                  color: notifier.divider,
                                ),
                                AppConstants.Height(5),
                                Row(
                                  children: [
                                    const Text("Transfer fee",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                                    const Spacer(),
                                    Text(" 2.00",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                  ],
                                ),
                                AppConstants.Height(5),
                                Divider(
                                  color: notifier.divider,
                                ),
                                AppConstants.Height(5),
                                Row(
                                  children: [
                                    const Text("Payment",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                                    const Spacer(),
                                    Text("Bank of America",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                  ],
                                ),
                                AppConstants.Height(5),
                                Divider(
                                  color: notifier.divider,
                                ),
                                AppConstants.Height(5),
                                Row(
                                  children: [
                                    const Text("Time",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                                    const Spacer(),
                                    Text("31 Oct 2022, 02:00 PM",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                  ],
                                ),
                                AppConstants.Height(5),
                                Divider(
                                  color: notifier.divider,
                                ),
                                AppConstants.Height(5),
                                Row(
                                  children: [
                                    const Text("Total amount",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                                    const Spacer(),
                                    Text(" 282.00",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                  ],
                                ),
                                AppConstants.Height(5),

                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ])
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20,right: 15,left: 15),
          child: BottomSheet(
            backgroundColor: Colors.transparent,
            onClosing: () {
            }, builder: (context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
              },
              child: Container(
                height: 56,
                // width: 370,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
                child: const Center(child: Text("Transfer Now",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "̌Manrope-Bold"))),
              ),
            );
          },/*backgroundColor: Color(0xff0F172A),*/),
        )
    );
  }
}
