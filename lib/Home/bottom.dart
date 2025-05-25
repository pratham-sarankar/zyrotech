import 'package:crowwn/Home/Market.dart';
import 'package:crowwn/Home/Portfolio.dart';
import 'package:crowwn/Home/Profile.dart';
import 'package:crowwn/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../Wallet/My wallet.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  List<Widget> myChildren = [
    const home(),
    const Market(),
    const Wallet(),
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
        alignment: const Alignment(0,0.99),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
          backgroundColor: const Color(0xff6B39F4),
          child: const Image(
              image: AssetImage("assets/images/Floating action.png"),
              height: 20,
              width: 20,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  notifier.background,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        elevation: 0,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        unselectedItemColor: notifier.textColor,
        selectedItemColor: notifier.textColor,
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 10,
          letterSpacing: 0.2,
        ),
        selectedLabelStyle:  TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: notifier.textColor,
          letterSpacing: 0.2,
        ),
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset("assets/images/home.png", scale: 3.5,color: notifier.bottom),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/images/home_fill.png",
                  scale: 3.5,
                  color: notifier.bottom,
                ),
              ),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(
                  "assets/images/Market.png",
                  scale: 3.5,
                    color: notifier.bottom
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/Market_fill.png",
                    scale: 3.5, color: notifier.bottom),
              ),
              label: "Market"),
          const BottomNavigationBarItem(
            label: "",
            icon: Text(""),
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/images/Portfolio.png",
                  scale: 3.5,
                    color: notifier.bottom
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  "assets/images/Portfolio_fill.png",
                  // color: Colors.black,
                  scale: 3.5,
                    color: notifier.bottom
                ),
              ),
              label: "Portfolio"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0,right: 5),
                child: Image.asset("assets/images/Person.png", scale: 3.5,color: notifier.bottom),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset("assets/images/Person_fill.png", scale: 3.5,color: notifier.bottom),
              ),
              label: "Profile"),
        ],
      ),
      body: myChildren.elementAt(currentIndex),
    );
  }
}
