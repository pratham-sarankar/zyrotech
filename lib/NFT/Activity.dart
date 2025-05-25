// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Dark mode.dart';
import 'Activity Model.dart';

class activity extends StatefulWidget {
  const activity({super.key});

  @override
  State<activity> createState() => _activityState();
}

class _activityState extends State<activity> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              AppConstants.Height(10),
              Row(
                children: [
                   Text("Activity",style: TextStyle(fontSize: 16,color: notifier.textColor,fontFamily: "Manrope-Bold"),),
                  const Spacer(),
                  Image.asset("assets/images/arrows-sort.png",height: 20,width: 20,),
                  AppConstants.Width(8),
                  const Text("Sort",style: TextStyle(color: Color(0xff94A3B8),fontSize: 14,fontFamily: "Manrope-Medium"),)
                ],
              ),
              AppConstants.Height(10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const Order_nft(),));
              //   },
              //   child: Container(
              //     height: height / 9,
              //     // width: 330,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         border: Border.all(color: notifier.getContainerBorder, width: 1)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             children: [
              //               const Image(
              //                   image: AssetImage("assets/images/Genesis1_icon.png"),
              //                   height: 40,width: 40,),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                    Text(
              //                     "Genesis Art...",
              //                     style: TextStyle(
              //                         fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
              //                   ),
              //                   AppConstants.Height(5),
              //                   const Text("Sale",
              //                       style: TextStyle(
              //                           color: Color(0xff64748B), fontSize: 13)),
              //                 ],
              //               ),
              //               AppConstants.Width(50),
              //               Column(
              //                 children: [
              //                    Text(
              //                     "0.450 ETH",
              //                     style: TextStyle(
              //                         fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
              //                   ),
              //                   AppConstants.Height(5),
              //                   const Text(
              //                     "2m ago",
              //                     style: TextStyle(
              //                         color: Color(0xff64748B), fontSize: 13),
              //                   ),
              //
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: activityDetail.length,
                  itemBuilder: (context, index) {
                    ActivityModel data = activityDetail[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: notifier.getContainerBorder)),
                        child: ListTile(
                          // contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(data.image),
                                fit: BoxFit.cover,),
                            ),
                          ),
                          title: Row(
                            children: [

                              Text(data.name,
                                  style:  TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold")),
                              const Spacer(),
                              Text(data.money,
                                  style:  TextStyle(
                                      fontSize: 16,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold")),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(data.desc,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff64748B),
                                      fontFamily: "Manrope-Regular")),
                              const Spacer(),
                              Text(data.time,style: const TextStyle(color: Color(0xff1DCE5C),fontFamily: "Manrope-Bold"),)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
/*              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Order_nft(),));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 9,
                  // width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/Genesis_icon.png"),
                              height: 40,width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Genesis Arti...",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text("Sale",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            AppConstants.Width(50),
                            Column(
                              children: [
                                const Text(
                                  "0.450 ETH",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text(
                                  "3m ago",
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
              ),
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Order_nft(),));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 9,
                  // width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/Genesis12_icon.png"),
                              height: 40,width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Genesis #0012",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text("Sale",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            AppConstants.Width(50),
                            Column(
                              children: [
                                const Text(
                                  "0.190 ETH",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text(
                                  "3m ago",
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
              ),
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Order_nft(),));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 9,
                  // width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/Genesis_icon.png"),
                              height: 40,width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Genesis Arti...",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text("Sale",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            AppConstants.Width(50),
                            Column(
                              children: [
                                const Text(
                                  "0.450 ETH",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text(
                                  "3m ago",
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
              ),
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Order_nft(),));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 9,
                  // width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/Genesis12_icon.png"),
                              height: 40,width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Genesis #0012",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text("Sale",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            AppConstants.Width(50),
                            Column(
                              children: [
                                const Text(
                                  "0.190 ETH",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text(
                                  "3m ago",
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
              ),
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Order_nft(),));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 9,
                  // width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/Genesis_icon.png"),
                              height: 40,width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Genesis Arti...",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text("Sale",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            AppConstants.Width(50),
                            Column(
                              children: [
                                const Text(
                                  "0.450 ETH",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text(
                                  "3m ago",
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
              ),
              AppConstants.Height(10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Order_nft(),));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 9,
                  // width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffE2E8F0), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/Genesis12_icon.png"),
                              height: 40,width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Genesis #0012",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text("Sale",
                                    style: TextStyle(
                                        color: Color(0xff64748B), fontSize: 13)),
                              ],
                            ),
                            AppConstants.Width(50),
                            Column(
                              children: [
                                const Text(
                                  "0.190 ETH",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff0F172A),fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(5),
                                const Text(
                                  "3m ago",
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
              ),*/
            ],
          ),
        ),
      )
    );
  }
}
