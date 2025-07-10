// Flutter imports:
import 'package:crowwn/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:crowwn/screens/Login%20Screens/login_screen.dart';
import 'package:crowwn/screens/config/common.dart';
import 'package:crowwn/services/auth_storage_service.dart';
import '../../../../dark_mode.dart';

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
                  isLoggedIn ? const HomeScreen() : const Login(),
            ),
          );
        }
      },
    );
  }

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: notifier.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(
                "assets/images/app-icon.png",
              ),
              color: notifier.isDark ? Colors.white : null,
              width: size.height * 0.2,
            ),
            Text(
              "FinFx",
              style: TextStyle(
                color: notifier.textColor,
                fontFamily: "Manrope-Bold",
                fontSize: size.width * 0.08,
                height: 1,
              ),
            )
          ],
        ),
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
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  final version = snapshot.hasData
                      ? 'Version ${snapshot.data!.version}'
                      : 'Version ...';
                  return Text(
                    version,
                    style: const TextStyle(
                      color: Color(0xffD1D1D1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Manrope_semibold",
                      letterSpacing: 0.3,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
