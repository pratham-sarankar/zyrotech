// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Dark mode.dart';
import 'Top up Success.dart';

class Top_confirmation extends StatefulWidget {
  const Top_confirmation({super.key});

  @override
  State<Top_confirmation> createState() => _Top_confirmationState();
}

class _Top_confirmationState extends State<Top_confirmation> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: Colors.white,)),
        title: const Text(
          "Deposit Preview",
          style: TextStyle(
              fontFamily: "Manrope-Bold",
              fontSize: 16,
              color: Colors.white),
        ),
        backgroundColor: const Color(0xff0F172A),
        elevation: 0,
      ),
      body: Container(
        width:double.maxFinite,
        height: double.maxFinite,
        color: const Color(0xff0F172A),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,10,15,10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                height: height/ 1.9,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifier.onboardBackgroundColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      AppConstants.Height(30),
                      Image.asset("assets/images/coin.png",scale: 2.2,),
                      AppConstants.Height(10),
                      const Text("Deposit (USD)",style: TextStyle(color: Color(0xff64748B),fontSize: 12,fontFamily: "Manrope-Regular"),),
                      AppConstants.Height(5),
                      Text("+ \$280.00",style: TextStyle(fontFamily: "Manrope-Bold",fontSize:18 ,color: notifier.textColor),),
                      AppConstants.Height(20),
                      Row(
                        children: [
                          const Text("Deposit ID",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
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
                          const Text("Deposit amount",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                          const Spacer(),
                          Text("280.00",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                        ],
                      ),
                      AppConstants.Height(5),
                      Divider(
                        color: notifier.divider,
                      ),
                      AppConstants.Height(5),
                      Row(
                        children: [
                          const Text("Deposit fee",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Regular"),),
                          const Spacer(),
                          Text("2.00",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
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
                          Text("BANK OF AMERICA",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
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
            ],
          ),
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //      children: [
      //        Stack(
      //          children: [
      //            Container(
      //            height: 700,
      //            color: const Color(0xff0F172A),
      //          ),
      //            // Positioned(
      //            //   top: 60,
      //            //   child: Padding(
      //            //     padding: const EdgeInsets.only(left: 20,right: 20),
      //            //     child:
      //            //   ),
      //            // )
      //        ])
      //      ],
      //   ),
      // ),
   floatingActionButton: Padding(
     padding: const EdgeInsets.only(bottom: 20,right: 15,left: 15),
     child: BottomSheet(onClosing: () {
     }, builder: (context) {
       return GestureDetector(
         onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const Top_success(),));
         },
         child: Container(
           height: 56,
           // width: 370,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
           child: const Center(child: Text("Deposit Now",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "̌Manrope-Bold"))),
         ),
       );
     },backgroundColor: const Color(0xff0F172A),),
   ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }
}
