
// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';
import 'Bank Account List.dart';

class Bank_detail extends StatefulWidget {
  const Bank_detail({super.key});

  @override
  State<Bank_detail> createState() => _Bank_detailState();
}

class _Bank_detailState extends State<Bank_detail> {
  bool value = false;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:notifier.background,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(30),
              Container(
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff6B39F4),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppConstants.Height(20),
                      Row(
                        children: [
                          const Text("BANK OF AMERICA",style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: "Manrope-Bold"),),
                          AppConstants.Width(5),
                          Image.asset("assets/images/Bank America icon.png",scale: 3,)
                        ],
                      ),
                      AppConstants.Height(30),
                      Row(
                        children: [
                          const Text("**** **** **** 7777",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: "Manrope-Bold"),),
                          const Spacer(),
                          Image.asset("assets/images/Sim card.png",scale: 3,)
                        ],
                      ),
                      AppConstants.Height(30),
                      const Row(
                        children: [
                          Text("Name",style: TextStyle(color:Color(0xffB59CFA),fontSize: 12),),
                          Spacer(),
                          Text("Exp Date",style: TextStyle(color:Color(0xffB59CFA),fontSize: 12),),
                        ],
                      ),
                      AppConstants.Height(10),
                      const Row(
                        children: [
                          Text("Helena Sarapova",style: TextStyle(fontSize: 14,color: Color(0xffFFFFFF),fontFamily: "Manrope-Bold"),),
                          Spacer(),
                          Text("12/2023",style: TextStyle(fontSize: 14,color: Color(0xffFFFFFF),fontFamily: "Manrope-Bold"),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppConstants.Height(20),
              const Text(
                "Name on card",
                style: TextStyle(
                    fontFamily: "Manrope-Bold",
                    fontSize: 16,
                    color: Color(0xff64748B)),
              ),
              AppConstants.Height(15),
              Container(
                height: height/13,
                // width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(
                      0.1),
                ),
                child: TextField(
                  style: TextStyle(color: notifier.textColor),
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              AppConstants.Height(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Expiration",
                        style: TextStyle(
                            fontFamily: "Manrope-Bold",
                            fontSize: 16,
                            color: Color(0xff64748B)),
                      ),
                      AppConstants.Height(15),
                      Container(
                        height: height/13,
                         width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(
                              0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
                        ),
                        child: TextField(
                          style: TextStyle(color: notifier.textColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "MM/YY",
                            hintStyle: const TextStyle(color: Color(0xff94A3B8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppConstants.Width(30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CVC",
                        style: TextStyle(
                            fontFamily: "Manrope-Bold",
                            fontSize: 16,
                            color: Color(0xff64748B)),
                      ),
                      AppConstants.Height(15),
                      Container(
                        height: height/13,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(
                              0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
                        ),
                        child: TextField(
                          style: TextStyle(color: notifier.textColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "123",
                            hintStyle: const TextStyle(color: Color(0xff94A3B8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppConstants.Height(15),
              const Text(
                "Card number",
                style: TextStyle(
                    fontFamily: "Manrope-Bold",
                    fontSize: 16,
                    color: Color(0xff64748B)),
              ),
              AppConstants.Height(15),
              Container(
                height: height/13,
                // width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(
                      0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
                ),
                child: TextField(
                  style: TextStyle(color: notifier.textColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "XXXX XXXX XXXX XXXX",
                    hintStyle: const TextStyle(color: Color(0xff94A3B8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Bank_list(),
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
                child: Text("Continue",
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
