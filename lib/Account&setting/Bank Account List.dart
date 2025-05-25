// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Bank Account List all.dart';
import 'Payment method link.dart';

class Bank_list extends StatefulWidget {
  const Bank_list({super.key});

  @override
  State<Bank_list> createState() => _Bank_listState();
}

class _Bank_listState extends State<Bank_list> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
        title: Text(
          "Witdrawal Destination",
          style: TextStyle(
            fontFamily: "Manrope-Bold",
            color: notifier.textColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(20),
              Container(
                height: height / 14,
                // width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(
                      0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
                ),
                child: Center(
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image(
                              image:
                                  const AssetImage("assets/images/Search.png"),
                              height: 20,
                              width: 20,
                              color: notifier.tabBarText2),
                        ),
                        hintText: "Search bank",
                        hintStyle: TextStyle(
                            color: notifier.tabBarText2,
                            fontFamily: "Manrope-Regular",
                            fontSize: 16)),
                  ),
                ),
              ),
              AppConstants.Height(20),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bankaccountDetail.length,
                  itemBuilder: (context, index) {
                    BankAccountModel data = bankaccountDetail[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: height / 10,
                        // width: 365,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: height / 14,
                                    width: width / 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: notifier.onboardBackgroundColor,
                                    ),
                                    child: Image(
                                      image: AssetImage(data.image),
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.name,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifier.textColor,
                                              fontFamily: "Manrope-Bold"),
                                        ),
                                        AppConstants.Height(10),
                                        Text(
                                          data.desc,
                                          style: const TextStyle(
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
                    );
                  }),
              /*Container(
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
                              image: AssetImage("assets/images/Bank of america.png"),
                              height: 35,width: 35),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bank of America",
                                style: TextStyle(
                                    fontSize: 14, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("bankofamerica.com",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
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
                              image: AssetImage("assets/images/Barclays.png"),
                              height: 35,width: 35),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Barclays",
                                style: TextStyle(
                                    fontSize: 14, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("barclays.com",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
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
                              image: AssetImage("assets/images/chase.png"),
                              height: 35,width: 35),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Chase",
                                style: TextStyle(
                                    fontSize: 14, color:notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("chase.com",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
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
                              image: AssetImage("assets/images/citi bank.png"),
                              height: 35,width: 35),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Citibank Online",
                                style: TextStyle(
                                    fontSize: 14, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("citi.com",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
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
                              image: AssetImage("assets/images/Wells.png"),
                              height: 35,width: 35),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wells Fargo",
                                style: TextStyle(
                                    fontSize: 14, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("wellsfargo.com",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
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
                              image: AssetImage("assets/images/UBS.png"),
                              height: 35,width: 35),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "UBS",
                                style: TextStyle(
                                    fontSize: 14, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                              ),
                              AppConstants.Height(10),
                              const Text("ubs.com",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13)),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),*/
              // SizedBox(height: 80,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Payment_method(),
                ));
          },
          child: Container(
            height: 56,
            // width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
                child: Text("Confirm",
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
