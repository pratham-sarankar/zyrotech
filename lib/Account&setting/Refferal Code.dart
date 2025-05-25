

// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';

class Reffle_code extends StatefulWidget {
  const Reffle_code({super.key});

  @override
  State<Reffle_code> createState() => _Reffle_codeState();
}

class _Reffle_codeState extends State<Reffle_code> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff0F172A),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff0F172A),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close, color: Color(0xffFFFFFF))),
        title: const Text("Refferal Program",
            style: TextStyle(fontSize: 16, fontFamily: "Manrope-Bold")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(30),
              Container(
                height: 576,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifier.onboardBackgroundColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppConstants.Height(40),
                      Center(
                          child: Image.asset(
                        "assets/images/Gift_1.png",
                        scale: 1.6,
                      )),
                      AppConstants.Height(30),
                      Text(
                        "Invite your friends and win\n     up to 1 Million Dollar!",
                        style: TextStyle(
                            fontFamily: "Manrope-Bold",
                            fontSize: 22,
                            color: notifier.textColor),
                      ),
                      AppConstants.Height(10),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Eacht time the friends you invite buy or sells, you get a 0.020%. Commission is calculated from the value of buy or sell purchase.",
                          style: TextStyle(
                              color: Color(0xff64748B),
                              fontSize: 14,
                              fontFamily: "Manrope-Regular"),
                        ),
                      ),
                      AppConstants.Height(30),
                      Container(
                        height: height/9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: notifier.getContainerBorder, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Use @username as a refferal code",
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 13,
                                              fontFamily: "Manrope-Regular")),
                                       Text(
                                        "@helena02",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.copy,
                                              color: Color(0xff6B39F4),
                                              size: 14,
                                            ),
                                            Text(
                                              'Copy',
                                              style: TextStyle(
                                                  color: Color(0xff6B39F4),
                                                  fontSize: 12,
                                                  fontFamily: "Manrope-Bold"),
                                            )
                                          ],
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
                      AppConstants.Height(20),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(45),
                                    topRight: Radius.circular(45))),
                             isScrollControlled: true,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                    height: 500,
                                    decoration: BoxDecoration(borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),color: notifier.background,),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15,right: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Invite your friends",
                                                  style: TextStyle(
                                                    fontFamily: "Manrope-Bold",
                                                    fontSize: 18,
                                                    color: notifier.textColor,
                                                  ),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color: notifier.textColor,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: notifier.getContainerBorder,
                                          ),
                                          AppConstants.Height(10),
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children:[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15,right: 15),
                                                child: Container(
                                                height: 280,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: notifier.getContainerBorder)),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    AppConstants.Height(20),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 15),
                                                      child: Text("Helena journeys",style:TextStyle(color:notifier.textColor,fontSize: 17,fontFamily: "Manrope-Bold"),),
                                                    ),
                                                    AppConstants.Height(10),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 15, top: 5),
                                                      child: Text.rich(
                                                        TextSpan(
                                                          text: "I earned ",
                                                          style: TextStyle(
                                                            fontSize: 24,
                                                            fontFamily: "Manrope_bold",
                                                            fontWeight: FontWeight.w700,
                                                            color: notifier.textColor,
                                                          ),
                                                          children: [
                                                            const TextSpan(
                                                              text: "\$5 ",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontFamily: "Manrope_bold",
                                                                fontWeight: FontWeight.w700,
                                                                color: Color(0xff6B39F4),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: " in assets by\nfinishing",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontFamily: "Manrope_bold",
                                                                fontWeight: FontWeight.w700,
                                                                color: notifier.textColor,
                                                              ),
                                                            ),
                                                            const TextSpan(
                                                              text: " 1 ",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontFamily: "Manrope_bold",
                                                                fontWeight: FontWeight.w700,
                                                                color: Color(0xff6B39F4),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: "lesson",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontFamily: "Manrope_bold",
                                                                fontWeight: FontWeight.w700,
                                                                color: notifier.textColor,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: " about",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontFamily: "Manrope_bold",
                                                                fontWeight: FontWeight.w700,
                                                                color: notifier.textColor,
                                                              ),
                                                            ),
                                                             const TextSpan(
                                                              text: " 4 ",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontFamily: "Manrope_bold",
                                                                fontWeight: FontWeight.w700,
                                                                color: Color(0xff6B39F4),
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: " investments",
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontFamily: "Manrope_bold",
                                                                fontWeight: FontWeight.w700,
                                                                color: notifier.textColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Padding(
                                                    //   padding: const EdgeInsets.only(left: 15,right: 15),
                                                    //   child: Text("I earnied 5 in assets by finishing 1 lesson about 4 investments",style:TextStyle(color:notifier.textColor,fontSize: 23,fontFamily: "Manrope-Bold"),),
                                                    // ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 110,
                                                      decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),color: Color(0xff6B39F4)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 20,right: 20),
                                                      child: Column(
                                                        children: [
                                                          AppConstants.Height(17),
                                                          const Center(child: Text("Use referral code and earn commission",style: TextStyle(color: Color(0xffB59CFA),fontSize: 13,fontFamily: "Manrope-Regular"),),),
                                                          AppConstants.Height(17),
                                                          Container(
                                                            height: 45,
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                                                            child: const Center(child: Text("@helena02",style: TextStyle(color: Color(0xff0F172A),fontFamily: "Manrope-Medium",fontSize: 17))),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                              ),
                                          ],),
                                          AppConstants.Height(40),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15,right: 15),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      height:56,
                                                      width:56,
                                                      // color: Colors.black,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: notifier.onboardBackgroundColor),
                                                      child: Icon(Icons.copy,size: 20,color: notifier.textColor),
                                                    ),
                                                    AppConstants.Height(10),
                                                    Text("Copy",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height:56,
                                                      width:56,
                                                      // color: Colors.black,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: notifier.onboardBackgroundColor),
                                                      child: Image.asset("assets/images/Whatsapp outlined.png",scale: 3,color: notifier.textColor),
                                                    ),
                                                    AppConstants.Height(10),
                                                    Text("Whatsapp",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height:56,
                                                      width:56,
                                                      // color: Colors.black,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: notifier.onboardBackgroundColor),
                                                      child: Image.asset("assets/images/Instagram outlined.png",color: notifier.textColor,scale: 3,),
                                                    ),
                                                    AppConstants.Height(10),
                                                    Text("Instagram",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height:56,
                                                      width:56,
                                                      // color: Colors.black,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: notifier.onboardBackgroundColor),
                                                      child: Icon(Icons.menu,size: 20,color: notifier.textColor,),
                                                    ),
                                                    AppConstants.Height(10),
                                                    Text("More",style: TextStyle(fontSize: 14,color: notifier.textColor,fontFamily: "Manrope-Medium"),)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xff6B39F4)),
                          child: const Center(
                              child: Text("Invite My Friends",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      fontFamily: "Manrope-Bold"))),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
