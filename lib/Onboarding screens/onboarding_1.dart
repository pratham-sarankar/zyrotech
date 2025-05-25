import 'package:crowwn/Onboarding%20screens/splash_screen.dart';
import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Get started.dart';

class Onboard1 extends StatefulWidget {
  const Onboard1({super.key});

  @override
  State<Onboard1> createState() => _Onboard1State();
}

class _Onboard1State extends State<Onboard1> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        actions: [
          Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Get1(),
                  ),
                );
              },
              style: ButtonStyle(
                side: MaterialStatePropertyAll(
                  BorderSide(color: notifier.outlinedButtonColor),
                ),
              ),
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 17,
                  color: notifier.outlinedButtonColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        backgroundColor: notifier.onboardBackgroundColor,
        elevation: 0,
      ),
      body: PageView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  color: notifier.onboardBackgroundColor,
                  child: Image.asset("assets/images/Card 1.png", scale: 0.11),
                ),
              ),
              // Switch(
              //   value: notifier.isDark,
              //   onChanged: (bool value) {
              //     notifier.isavalable(value);
              //   },
              // ),
              AppConstants.Height(10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All in One Investment\nPlatform",
                      style: TextStyle(
                          fontSize: 24,
                          // wordSpacing: 5,
                          fontFamily: "Manrope-Bold",
                          color: notifier.textColor),
                    ),
                    AppConstants.Height(10),
                    const Text(
                      "Diversity your investment from cryptocurrency, NFTs, Gold, and stock in one app",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff64748B),
                        fontFamily: "Manrope-Medium",
                      ),
                    ),
                    AppConstants.Height(15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Get1(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        // width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff6B39F4)),
                        child: const Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Manrope-SemiBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppConstants.Height(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Splash(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Browse Assets",
                              style: TextStyle(
                                color: Color(0xff6B39F4),
                                fontSize: 16,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // AppConstants.Height(30),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 2.8,
                  width: double.infinity,
                  color: notifier.onboardBackgroundColor,
                  child: Image.asset(
                    "assets/images/Card 2.png",
                    scale: 0.9,
                  ),
                ),
              ),
              AppConstants.Height(20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Track Prices On All\nInvestment",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor,
                      ),
                    ),
                    AppConstants.Height(10),
                    const Text(
                      "Set up automatic price alerts to let you know about price movements for a specific asset.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff64748B),
                        fontFamily: "Manrope-Medium",
                      ),
                    ),
                    AppConstants.Height(10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Get1(),
                          ),
                        );
                      },
                      child: Center(
                        child: Container(
                          height: 60,
                          // width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff6B39F4),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Manrope-SemiBold",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppConstants.Height(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Splash(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Browse Assets",
                              style: TextStyle(
                                color: Color(0xff6B39F4),
                                fontSize: 16,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // AppConstants.Height(30),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.8,
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: notifier.onboardBackgroundColor,
                  child: Image.asset("assets/images/Card 3.png", scale: 0.9),
                ),
              ),
              AppConstants.Height(20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stretch Out Your Payments Over Time",
                      style: TextStyle(
                        fontSize: 24,
                        // wordSpacing: 5,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor,
                      ),
                    ),
                    AppConstants.Height(10),
                    const Text(
                      "Massa enim rhoncus quis magna. Fames mi dignissim cursus sit. Malesuada pulvinar enim a vitae urna volutpat.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff64748B),
                        fontFamily: "Manrope-Medium",
                      ),
                    ),
                    AppConstants.Height(10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Get1(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        // width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xff6B39F4),
                        ),
                        child: const Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Manrope-SemiBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppConstants.Height(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Splash(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Browse Assets",
                              style: TextStyle(
                                color: Color(0xff6B39F4),
                                fontSize: 16,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // AppConstants.Height(30),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.8,
                  color: notifier.onboardBackgroundColor,
                  child: Image.asset("assets/images/Card 4.png", scale: 0.9),
                ),
              ),
              AppConstants.Height(20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter for a Chance to Win You Share 1M Assets",
                      style: TextStyle(
                        fontSize: 24,
                        color: notifier.textColor,
                        // wordSpacing: 5,
                        fontFamily: "Manrope-SemiBold",
                      ),
                    ),
                    AppConstants.Height(10),
                    const Text(
                      "Each time the friends you invite buy or sells, you get a 0.020%. Commission is calculated from the value of buy or sell purchase.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: "Manrope-Medium",
                      ),
                    ),
                    AppConstants.Height(10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Get1(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60,
                        // width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xff6B39F4),
                        ),
                        child: const Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Manrope-SemiBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppConstants.Height(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Splash(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Browse Assets",
                              style: TextStyle(
                                color: Color(0xff6B39F4),
                                fontSize: 16,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // AppConstants.Height(30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
