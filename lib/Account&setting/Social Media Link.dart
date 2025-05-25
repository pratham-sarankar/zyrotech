
// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';
import '../Home/Profile.dart';
import 'Social Media Model.dart';

class Social_media extends StatefulWidget {
  const Social_media({super.key});

  @override
  State<Social_media> createState() => _Social_mediaState();
}

class _Social_mediaState extends State<Social_media> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
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
        title: Text("Link Account",
            style: TextStyle(
                fontFamily: "Manrope-Bold",
                color: notifier.textColor,
                fontSize: 16)),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(20),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: socialDetail.length,
                  itemBuilder: (context, index) {
                    SocialMediaModel data = socialDetail[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        height: height/10,
                        // width: 365,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: notifier.getContainerBorder, width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height:40,
                                  width:40,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: notifier.onboardBackgroundColor),
                                  child: Image.asset(data.image,width: 20,height: 20,),
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name,
                                      style: TextStyle(
                                          fontSize: 15, color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                    ),
                                    AppConstants.Height(5),
                                     Text(data.desc,
                                        style: const TextStyle(
                                            color: Color(0xff64748B), fontSize: 12,fontFamily: "Manrope-Regular")),
                                  ],
                                ),
                                // AppConstants.Width(60),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 24,
                                        width: 69,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.purpleAccent.withOpacity(0.1)),
                                        child: const Center(child: Text("Connect",style: TextStyle(color: Color(0xff6B39F4),fontSize: 10,fontFamily: "Manrope-Bold"))),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15,bottom: 15,right: 15),
        child: GestureDetector(
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile(),));
          },
          child: Container(
            height: 56,
            width: 370,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
            child: const Center(child: Text("Confirm",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "̌Manrope-Bold"))),
          ),
        ),
      ),


    );
  }
}
