// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Dark mode.dart';

class Invest extends StatefulWidget {
  const Invest({super.key});

  @override
  State<Invest> createState() => _InvestState();
}

class _InvestState extends State<Invest> {
  ColorNotifire notifier = ColorNotifire();
  int select = 0;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
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
              scale: 2.9,color: notifier.textColor,
            ),
          ),
          title: Center(child: Text("Auto Invest",style: TextStyle(fontSize: 16,color: notifier.textColor))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset("assets/images/question-circle-outlined.png",width: 23,color: notifier.textFieldHintText,),
            ),
          ],
          backgroundColor: notifier.background,
        ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            AppConstants.Height(90),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Wallet balance",style: TextStyle(color: Color(0xff64748B),fontSize: 17),),
              ],
            ),
            AppConstants.Height(20),
            Container(
              height: 75,
              // width: 226,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: notifier.background,border: Border.all(color: notifier.getContainerBorder)
              ),
              child: TextField(
                style: TextStyle(fontSize: 40,color: notifier.textColor,fontFamily: "Manrope-Bold"),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.only(bottom: 2,left: 8,top: 25)
                ),
              ),
            ),
             AppConstants.Height(40),
            GestureDetector(
              onTap: () {
                setState(() {
                  select = 0;
                });
              },

              child: Container(
                height: 72,
                width: 327,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifier.onboardBackgroundColor,border: Border.all(
                  color: select == 0 ? const Color(0xff6B39F4) : notifier.getContainerBorder, )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20,top: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Amount',style: TextStyle(color: Color(0xff94A3B8))),
                                Text('100',style: TextStyle(fontSize: 18,color: notifier.textColor)),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    height: 35,
                                    width: 93,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifier.container,),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Image.asset("assets/images/ruppes_green.png",height: 20,width: 20,),
                                        ),
                                        AppConstants.Width(4),
                                        Text("USD",style: TextStyle(fontSize: 12,color: notifier.textColor),),
                                        AppConstants.Width(5),
                                        const Icon(Icons.chevron_right,color: Color(0xff94A3B8),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),

                  ],
                ),
              ),
            ),
            AppConstants.Height(10),
            GestureDetector(
              onTap: () {
                setState(() {
                  select = 1;
                });
              },
              child: Container(
                height: 72,
                width: 327,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifier.onboardBackgroundColor,border: Border.all(
                  color: select == 1 ? const Color(0xff6B39F4) : notifier.getContainerBorder, )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20,top: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Amount',style: TextStyle(color: Color(0xff94A3B8))),
                                Text('0.5',style: TextStyle(fontSize: 18,color: notifier.textColor)),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    height: 35,
                                    width: 93,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifier.container,),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Image.asset("assets/images/gold_icon.png",height: 20,width: 20,),
                                        ),
                                        AppConstants.Width(4),
                                        Text("Gram",style: TextStyle(fontSize: 12,color: notifier.textColor),),
                                        AppConstants.Width(5),
                                        const Icon(Icons.chevron_right,color: Color(0xff94A3B8),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20,bottom: 15,right: 20),
        child: GestureDetector(
          onTap: () {
           Navigator.pop(context);
          },
          child: Container(
            height: 56,
            // width: 370,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
          child: const Center(child: Text("Review Auto Invest",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "̌Manrope-Bold"))),
          ),
        ),
      ),
    );
  }
}
