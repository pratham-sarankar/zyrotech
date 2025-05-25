
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
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: Colors.white,)),
        actions: const [
          Icon(Icons.menu, size: 25, color: Color(0xffFFFFFF)),
          SizedBox(width: 20,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height/3,
              width: width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background (2).png"),
                      // scale: 1,
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     AppConstants.Height(40),
                    const Text(
                      "All in one investment platform",
                      style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    AppConstants.Height(20),
                    const Text(
                      "We are on a mission to transform the world's money management with a multi-asset investment platform that is easy to use and supported by a trusted community.",
                      style: TextStyle(
                          color: Color(0xffD3C4FC),
                          fontSize: 15,
                          fontFamily: "Manrope-Regular"),
                    )
                  ],
                ),
              ),
            ),
            AppConstants.Height(30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 18,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold"),
                  ),
                  AppConstants.Height(10),
                  const Text(
                    "Ante vitae mi volutpat neque blandit egestas elementum sed vel. Quis volutpat luctus blandit. Adipiscing pellentesque adipiscing lectus tempus auctor. At egestas ipsum, donec.",
                    style: TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 16,
                        fontFamily: "Manrope-Regular"),
                  ),
                  AppConstants.Height(5),
                  const Text(
                    "Proin consectetur aliquam sed pellentesque ultrices aenean. Urna eu netus eu enim. Consectetur integer pellentesque lorem sit.",
                    style: TextStyle(
                        color: Color(0xff64748B),
                        fontSize: 16,
                        fontFamily: "Manrope-Regular"),
                  ),
                  AppConstants.Height(30),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height/6,
                      decoration: BoxDecoration(
                          color: notifier.onboardBackgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 30),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/join team.png",
                                  scale: 3,
                                )
                              ],
                            ),
                            AppConstants.Width(30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Join Our Team",
                                    style: TextStyle(
                                        color: notifier.textColor,
                                        fontSize: 16,
                                        fontFamily: "Manrope-Bold")),
                                AppConstants.Height(7),
                                const Text("We make investing accessible\nto more people and help them to reach\ntheir financial goals.",style: TextStyle(fontFamily: "Manrope-Regular",fontSize: 10,color: Color(0xff64748B)),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppConstants.Height(20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
