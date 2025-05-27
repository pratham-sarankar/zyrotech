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
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Get1(),
        ),
      );
    }
  }

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
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                ),
              ),
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  color: notifier.outlinedButtonColor,
                  fontFamily: "Manrope-SemiBold",
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
        backgroundColor: notifier.onboardBackgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Smarter Trading.\nZero Emotions",
                          style: TextStyle(
                            fontSize: 32,
                            height: 1.2,
                            fontFamily: "Manrope-Bold",
                            color: notifier.textColor,
                          ),
                        ),
                        AppConstants.Height(16),
                        const Text(
                          "Make informed decisions with AI-powered insights and automated trading strategies",
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                        AppConstants.Height(32),
                        GestureDetector(
                          onTap: _nextPage,
                          child: Container(
                            height: 56,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff6B39F4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff6B39F4).withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Manrope-SemiBold",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Height(40),
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
                      child: Image.asset("assets/images/Card 2.png", scale: 0.9),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your AI Trader\nin Action",
                          style: TextStyle(
                            fontSize: 32,
                            height: 1.2,
                            fontFamily: "Manrope-Bold",
                            color: notifier.textColor,
                          ),
                        ),
                        AppConstants.Height(16),
                        const Text(
                          "Experience the power of AI-driven trading with real-time market analysis and automated execution",
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                        AppConstants.Height(32),
                        GestureDetector(
                          onTap: _nextPage,
                          child: Container(
                            height: 56,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff6B39F4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff6B39F4).withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Manrope-SemiBold",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Height(40),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter for a Chance to Win You Share 1M Assets",
                          style: TextStyle(
                            fontSize: 32,
                            height: 1.2,
                            color: notifier.textColor,
                            fontFamily: "Manrope-Bold",
                          ),
                        ),
                        AppConstants.Height(16),
                        const Text(
                          "Each time the friends you invite buy or sells, you get a 0.020%. Commission is calculated from the value of buy or sell purchase.",
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                        AppConstants.Height(32),
                        GestureDetector(
                          onTap: _nextPage,
                          child: Container(
                            height: 56,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff6B39F4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff6B39F4).withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
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
                        AppConstants.Height(40),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == 0 ? const Color(0xff6B39F4) : const Color(0xff6B39F4).withOpacity(0.3),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == 1 ? const Color(0xff6B39F4) : const Color(0xff6B39F4).withOpacity(0.3),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == 2 ? const Color(0xff6B39F4) : const Color(0xff6B39F4).withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
