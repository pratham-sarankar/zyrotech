// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'FAQ.dart';

class Help_Center extends StatefulWidget {
  const Help_Center({super.key});

  @override
  State<Help_Center> createState() => _Help_CenterState();
}

class _Help_CenterState extends State<Help_Center> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: const Color(0xff6B39F4),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(
            Icons.menu,
            size: 25,
            color: Color(0xffFFFFFF),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Background (2).png"),
                  scale: 2,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstants.Height(40),
                    const Text(
                      "Hi, how can we help?",
                      style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    AppConstants.Height(20),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Image.asset("assets/images/Search.png",
                                scale: 3),
                            hintText: "Search...",
                            hintStyle: const TextStyle(
                                color: Color(0xff94A3B8),
                                fontSize: 16,
                                fontFamily: "Manrope-Regular"),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppConstants.Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 8,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/Question asked.png",
                                scale: 3,
                              )
                            ],
                          ),
                          AppConstants.Width(30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Frequently Asked Question",
                                  style: TextStyle(
                                      color: notifier.textColor,
                                      fontSize: 16,
                                      fontFamily: "Manrope-Bold")),
                              AppConstants.Height(7),
                              const Text(
                                "Find all the answers to questions",
                                style: TextStyle(
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 10,
                                    color: Color(0xff64748B)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  AppConstants.Height(10),
                  Text(
                    "Community",
                    style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        fontSize: 14,
                        color: notifier.textColor),
                  ),
                  const Text(
                    "Connect with thousands of the Financial users to discuss\nand share about investment knowledge.",
                    style: TextStyle(
                        fontFamily: "Manrope-Regular",
                        fontSize: 13,
                        color: Color(0xff64748B)),
                  ),
                  AppConstants.Height(10),
                  Container(
                    height: height / 11,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: notifier.getContainerBorder, width: 1,),),
                    child: Padding(
                      padding:
                          const EdgeInsets.only( left: 10, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue.withOpacity(0.1)),
                                child: const Image(
                                    image:
                                        AssetImage("assets/images/Discord.png"),
                                    height: 25,
                                    width: 25),
                              ),
                              const SizedBox(
                                width: 15
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Discords",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor),
                                  ),
                                  AppConstants.Height(5),
                                  const Text("Discord Official",
                                      style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13,),),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.chevron_right,
                                      color: notifier.tabBarText2,
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
                  AppConstants.Height(10),
                  Container(
                    height: height / 11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: notifier.getContainerBorder,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only( left: 10, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue.withOpacity(0.1)),
                                child: const Image(
                                    image: AssetImage(
                                        "assets/images/Telegram.png"),
                                    height: 25,
                                    width: 25),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Telegram",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor),
                                  ),
                                  AppConstants.Height(5),
                                  const Text("Telegram Official",
                                      style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13,),),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.chevron_right,
                                      color: notifier.tabBarText2,
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
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Faq(),
                ));
          },
          backgroundColor: const Color(0xff6B39F4),
          child: const Icon(Icons.headset_mic_outlined)),
    );
  }
}
