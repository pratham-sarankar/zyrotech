// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';


class About_App extends StatefulWidget {
  const About_App({super.key});

  @override
  State<About_App> createState() => _About_AppState();
}

class _About_AppState extends State<About_App> {
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
        // flexibleSpace: Image.asset("assets/images/Background (2).png",fit: BoxFit.cover,),
        elevation: 0,
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Manrope-Bold",
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: Colors.white,)),
        actions: const [
          SizedBox(width: 20,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height/2.5,
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background (2).png"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstants.Height(60),
                    const Text(
                      "Where automation meets assurance",
                      style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          fontSize: 28,
                          color: Colors.white),
                    ),
                    AppConstants.Height(25),
                    const Text(
                      "We are on a mission to transform the world's money management with a multi-asset investment platform that is easy to use and supported by a trusted community.",
                      style: TextStyle(
                          color: Color(0xffD3C4FC),
                          fontSize: 16,
                          fontFamily: "Manrope-Regular"),
                    )
                  ],
                ),
              ),
            ),
            AppConstants.Height(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "At Zyroteck, we are passionate about reshaping the future of finance through intelligent automation and cutting-edge technology. Founded with a vision to empower traders and investors, we develop high-performance trading bots and tools that harness the power of AI, data analytics, and algorithmic precision.",
                    style: TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 16,
                        fontFamily: "Manrope-Regular",
                        height: 1.5),
                  ),
                  AppConstants.Height(15),
                  const Text(
                    "Our mission is to make crypto trading smarter, faster, and more accessible—whether you're a beginner or a seasoned professional. With a team of engineers, data scientists, and market analysts, Zyroteck is committed to delivering secure, transparent, and adaptive solutions for the evolving digital economy.",
                    style: TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 16,
                        fontFamily: "Manrope-Regular",
                        height: 1.5),
                  ),
                  AppConstants.Height(15),
                  const Text(
                    "We're not just building software—we're building the future of autonomous trading.",
                    style: TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 16,
                        fontFamily: "Manrope-Regular",
                        height: 1.5),
                  ),
                  AppConstants.Height(40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height/5,
                      decoration: BoxDecoration(
                          color: notifier.onboardBackgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/join team.png",
                              scale: 2.5,
                            ),
                            AppConstants.Width(25),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Join Our Team",
                                      style: TextStyle(
                                          color: notifier.textColor,
                                          fontSize: 18,
                                          fontFamily: "Manrope-Bold")),
                                  AppConstants.Height(10),
                                  const Text(
                                    "We make investing accessible to more people and help them to reach their financial goals.",
                                    style: TextStyle(
                                      fontFamily: "Manrope-Regular",
                                      fontSize: 14,
                                      color: Color(0xff64748B),
                                      height: 1.5,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppConstants.Height(30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
