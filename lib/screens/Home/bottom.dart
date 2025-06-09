// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Home/Portfolio.dart';
import 'package:crowwn/screens/Home/Profile.dart';
import 'package:crowwn/screens/Home/bot.dart';
import 'package:crowwn/screens/Home/my_signals.dart';
import 'package:crowwn/screens/Home/new_home_screen.dart';
import '../../Dark mode.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  List<Widget> myChildren = [
    const NewHomeScreen(),
    const MySignals(),
    const BotScreen(),
    const Portfolio(),
    const Profile(),
  ];
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: const Alignment(0, 0.99),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          backgroundColor: const Color(0xff6B39F4),
          child: Image(
            image: const AssetImage("assets/images/robot.png"),
            fit: BoxFit.contain,
            color: Colors.white,
            height: 26,
            width: 26,
          ),
        ),
      ),
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
          const BottomNavigationBarItem(
            label: "",
            icon: Text(""),
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
            label: "Portfolio",
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
