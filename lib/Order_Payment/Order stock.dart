// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Dark mode.dart';
import 'Payment method.dart';

class Order_st extends StatefulWidget {
  const Order_st({super.key});

  @override
  State<Order_st> createState() => _Order_stState();
}

class _Order_stState extends State<Order_st> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: const Color(0xff6B39F4),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 3,
              color: Colors.white),
        ),
        title: const Text("Reedem",style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: "Manrope-Bold")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children:[
                Container(
                height: height / 6,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background (2).png"),
                      fit: BoxFit.cover),
                ),
              ),
                Positioned(
                  bottom: -40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17,right: 22),
                    child: Container(
                      height: height/9,
                      width: width / 1.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: notifier.textField),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                    image: const AssetImage("assets/images/apple-logo.png"),
                                    height: 30,width: 30,color: notifier.textColor),
                                const SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "AAPL",
                                      style: TextStyle(
                                          fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                    ),
                                    AppConstants.Height(10),
                                    const Text("Apple, Inc.",
                                        style: TextStyle(
                                            color: Color(0xff64748B), fontSize: 13)),
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
                                        " 89.00",
                                        style: TextStyle(
                                            fontSize: 15, color:notifier.textColor,fontFamily: "Manrope-Bold"),
                                      ),
                                      AppConstants.Height(10),
                                      const Text(
                                        " 0.6789 shares",
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
                    ),
                  ),
                )
            ]),
            AppConstants.Height(70),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment method",style: TextStyle(color: notifier.textColor,fontSize: 16,fontFamily: "Manrope-Bold"),),
                  AppConstants.Height(30),
                  Container(
                    height: height/8.5,
                    // width: 365,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: notifier.getContainerBorder, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only( left: 10,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: height/14,
                                width: width/8,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: notifier.onboardBackgroundColor),
                                child: Image.asset("assets/images/Bank America icon.png",height: 25,width: 25,),
                              ),
                              const SizedBox(width: 15,),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bank of America",
                                      style: TextStyle(
                                          fontSize: 15, color: notifier.textColor),
                                    ),
                                    AppConstants.Height(10),
                                    const Text("Automatic payment",
                                        style: TextStyle(
                                            color: Color(0xff64748B), fontSize: 13)),
                                  ],
                                ),
                              ),
                              // AppConstants.Width(60),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.only(right: 20,top: 25),
                                child: Column(
                                  children: [
                                    Text(
                                      "Change",
                                      style: TextStyle(
                                          fontSize: 15, color: Color(0xff6B39F4),fontFamily: "Manrope-Bold"),
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
                  Text("Order summary",style: TextStyle(color: notifier.textColor,fontSize: 16,fontFamily: "Manrope-Bold"),),
                  AppConstants.Height(20),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        children: [
                          AppConstants.Height(15),
                          Row(
                            children: [
                            const Text("Amount",style: TextStyle(color: Color(0xff64748B),fontSize: 14)),
                              const Spacer(),
                              Text(" 89.00",style: TextStyle(fontSize: 15,color: notifier.textColor,fontFamily: "Manrope-Bold"),)
                          ],),
                          AppConstants.Height(5),
                          Divider(
                            thickness: 1,
                            color: notifier.divider,
                          ),
                          AppConstants.Height(5),
                          Row(
                            children: [
                              const Text("Stock purchased",style: TextStyle(color: Color(0xff64748B),fontSize: 14)),
                              const Spacer(),
                              Text(" 0.6789",style: TextStyle(fontSize: 15,color: notifier.textColor,fontFamily: "Manrope-Bold"),)
                            ],),
                          Divider(
                            thickness: 1,
                            color: notifier.divider,
                          ),
                          AppConstants.Height(5),
                          const Row(
                            children: [
                              Text("Buy fee",style: TextStyle(color: Color(0xff64748B),fontSize: 14)),
                              Spacer(),
                              Text(" Free",style: TextStyle(fontSize: 15,color: Color(0xff1DCE5C),fontFamily: "Manrope-Bold"),)
                            ],),
                          Divider(
                            thickness: 1,
                            color: notifier.divider,
                          ),
                          AppConstants.Height(5),
                          Row(
                            children: [
                              Text("Total buy",style: TextStyle(color:notifier.bottom,fontSize: 14)),
                              const Spacer(),
                              Text(" 89.00",style: TextStyle(fontSize: 15,color: notifier.textColor,fontFamily: "Manrope-Bold"),)
                            ],),
                        ],
                      ),
                    ),
                  ),
                  AppConstants.Height(20),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: notifier.textField,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        children: [
                          Image.asset("assets/images/ticket-discount.png",height: 20,width: 20,color: notifier.bottom,),
                          AppConstants.Width(5),
                          const Text("Promo code",style: TextStyle(color: Color(0xff94A3B8),fontSize: 14),),
                          const Spacer(),
                          Icon(Icons.chevron_right,color: notifier.textFieldHintText,)
                        ],
                      ),
                    ),
                  ),
                  AppConstants.Height(40),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20,bottom: 15,right: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Payment_method(),));
          },
          child: Container(
            height: 56,
            // width: 370,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
            child: const Center(child: Text("Preview Buy",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "̌Manrope-Bold"))),
          ),
        ),
      ),
    );
  }
}
