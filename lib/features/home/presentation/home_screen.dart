// Flutter imports:
import 'package:crowwn/features/brokers/presentation/screens/brokers_screen.dart';
import 'package:crowwn/features/subscriptions/presentation/screens/my_subscriptions_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/features/profile/presentation/profile.dart';
import 'package:crowwn/features/user_signals/presentation/screens/user_signals_screen.dart';
import 'package:crowwn/features/home/presentation/home_tab_screen.dart';
import '../../../dark_mode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    // Create the HomeTabScreen first so it can use the callback
    final homeTab = HomeTabScreen(
      onSettingsTap: () {
        setState(() {
          currentIndex = 4;
        });
      },
    );
    final myChildren = [
      homeTab,
      const UserSignalsScreen(),
      // const BotScreen(),
      // const Portfolio(),
      const MySubscriptionsScreen(),
      const BrokersScreen(),
      const Profile(),
    ];
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Align(
      //   alignment: const Alignment(0, 0.99),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       setState(() {
      //         currentIndex = 2;
      //       });
      //     },
      //     backgroundColor: const Color(0xff2e9844),
      //     child: Image(
      //       image: const AssetImage("assets/images/robot.png"),
      //       fit: BoxFit.contain,
      //       color: Colors.white,
      //       height: 26,
      //       width: 26,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: notifier.background,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        iconSize: 20,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        unselectedItemColor: notifier.textColor,
        selectedItemColor: notifier.textColor,
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 8,
          letterSpacing: 0.2,
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 8,
          fontWeight: FontWeight.w700,
          color: notifier.textColor,
          letterSpacing: 0.2,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/home.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/home_fill.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Market_fill.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Market_fill.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            label: "Signals",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Portfolio.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Portfolio_fill.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            label: "Subscriptions",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Portfolio.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Portfolio_fill.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            label: "Broker",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Person.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    "assets/images/Person_fill.png",
                    color: notifier.bottom,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
            label: "Profile",
          ),
        ],
      ),
      body: myChildren.elementAt(currentIndex),
    );
  }
}
