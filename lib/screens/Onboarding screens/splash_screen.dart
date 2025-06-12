// Flutter imports:
import 'package:crowwn/screens/Onboarding%20screens/kyc_onboarding.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Home/bottom.dart';
import 'package:crowwn/screens/Login%20Screens/login_screen.dart';
import 'package:crowwn/screens/config/common.dart';
import 'package:crowwn/services/auth_storage_service.dart';
import '../../Dark mode.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final AuthStorageService _authStorage = AuthStorageService();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        final isLoggedIn = await _authStorage.isLoggedIn();
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ? const BottomBarScreen() : const Login(),
            ),
          );
        }
      },
    );
  }

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage(
                  "assets/images/144.png",
                ),
                color: notifier.isDark ? Colors.white : null,
                height: height / 8.5,
              ),
              AppConstants.Width(width / 19),
              Text(
                "ZyroBot",
                style: TextStyle(
                  color: notifier.textColor,
                  fontSize: 30,
                  fontFamily: "Manrope-Bold",
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: notifier.background,
        elevation: 0,
        height: 75,
        child: Center(
          child: Column(
            children: [
              Text(
                "where automation meets assurance",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Manrope-Bold",
                  color: notifier.textColor,
                  wordSpacing: 5,
                ),
              ),
              AppConstants.Height(5),
              const Text(
                "Version 0.0.1",
                style: TextStyle(
                  color: Color(0xffD1D1D1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Manrope_semibold",
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
