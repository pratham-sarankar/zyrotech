// Flutter imports:
import 'package:crowwn/features/profile/presentation/personal_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Login%20Screens/login_screen.dart';
import '../../../dark_mode.dart';
import '../../../screens/Account&setting/API_Connection.dart';
import '../../../screens/Account&setting/About App.dart';
import '../../../screens/Account&setting/Help Center.dart';
import '../../../screens/Account&setting/Identify_Verification.dart';
import '../../../screens/Account&setting/Privacy&Policy.dart';
import '../../../screens/Account&setting/Push Notification.dart';
import '../../../screens/Account&setting/Refferal Code.dart';
import '../../../screens/Account&setting/Terms&conditions.dart';
import '../../../screens/Message & Notification/Notifications.dart';
import '../../../screens/config/common.dart';
import '../../../services/auth_service.dart';
import '../../../utils/api_error.dart';
import '../../../utils/toast_utils.dart';
import 'providers/profile_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ColorNotifire notifier = ColorNotifire();

  @override
  void initState() {
    super.initState();
    // Fetch profile when the screen is first loaded
    Future.microtask(() => context.read<ProfileProvider>().fetchProfile());
  }

  Future<void> _logout() async {
    try {
      final authService = context.read<AuthService>();
      await authService.logout();

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      }
    } on ApiError catch (e) {
      if (mounted) {
        ToastUtils.showError(
          context: context,
          message: e.message,
        );
      }
    } catch (e) {
      if (mounted) {
        ToastUtils.showError(
          context: context,
          message: 'An unexpected error occurred during logout.',
        );
      }
    }
  }

  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap a button
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 28),
              const SizedBox(width: 10),
              const Text(
                'Confirm Logout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to log out? This will end your current session.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                _logout();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        final profile = profileProvider.profile;
        final isLoading = profileProvider.isLoading;
        final error = profileProvider.error;

        // Show error in overlay if there is one
        if (error != null && mounted) {
          Future.microtask(() {
            ToastUtils.showError(
              context: context,
              message: error,
            );
            profileProvider.clearError();
          });
        }

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: notifier.background,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Background (2).png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PersonalData(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/images/edit.png",
                                    scale: 3,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            AppConstants.Height(3),
                            Center(
                              child: Container(
                                height: height / 14,
                                width: width / 4.2,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  IconlyBold.profile,
                                  size: height / 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            AppConstants.Height(3),
                            Center(
                              child: isLoading
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!
                                          .withValues(alpha: 0.25),
                                      highlightColor: Colors.grey[100]!
                                          .withValues(alpha: 0.25),
                                      child: Container(
                                        width: 120,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      profile?.fullName ?? 'No Name',
                                      style: const TextStyle(
                                        fontFamily: "Manrope-Bold",
                                        color: Color(0xffFFFFFF),
                                        fontSize: 18,
                                        height: 1.5,
                                      ),
                                    ),
                            ),
                            AppConstants.Height(1),
                            Center(
                              child: isLoading
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!
                                          .withValues(alpha: 0.25),
                                      highlightColor: Colors.grey[100]!
                                          .withValues(alpha: 0.25),
                                      child: Container(
                                        width: 180,
                                        height: 14,
                                        margin: const EdgeInsets.only(top: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      profile?.email ?? 'No Email',
                                      style: const TextStyle(
                                        fontFamily: "Manrope-Regular",
                                        color: Color(0xffB59CFA),
                                        fontSize: 14,
                                        height: 1,
                                      ),
                                    ),
                            ),
                            AppConstants.Height(15),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppConstants.Height(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppConstants.Height(12),
                        const Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-Bold",
                          ),
                        ),
                        AppConstants.Height(6),
                        Text(
                          "Account Details",
                          style: TextStyle(
                            fontFamily: "Manrope-Bold",
                            color: notifier.textColor,
                            fontSize: 16,
                          ),
                        ),
                        AppConstants.Height(15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PersonalData(),
                              ),
                            );
                          },
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: notifier.getContainerBorder)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: notifier.tabBar1),
                                      child: Image.asset(
                                        "assets/images/Person.png",
                                        scale: 3,
                                        color: notifier.passwordIcon,
                                      )),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppConstants.Height(20),
                                        Row(
                                          children: [
                                            Text(
                                              "Personal Details",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Manrope_bold",
                                                fontSize: 14,
                                                color: notifier.textColor,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE8F5E9),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: const Text(
                                                "Verified",
                                                style: TextStyle(
                                                  color: Color(0xff2E7D32),
                                                  fontSize: 10,
                                                  fontFamily: "Manrope-Regular",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 7),
                                        Text(
                                          "Your account information",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Manrope_bold",
                                            fontSize: 12,
                                            letterSpacing: 0.2,
                                            color: Color(0xff64748B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: notifier.tabBarText2,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Height(12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Identify_Verification(),
                              ),
                            );
                          },
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: notifier.getContainerBorder)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: notifier.tabBar1),
                                      child: Image.asset(
                                        "assets/images/Identycard_.png",
                                        scale: 3,
                                        color: notifier.passwordIcon,
                                      )),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppConstants.Height(20),
                                      Text(
                                        "Identify Verification",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Manrope_bold",
                                          fontSize: 14,
                                          color: notifier.textColor,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        "Verify your identity",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Manrope_bold",
                                          fontSize: 12,
                                          letterSpacing: 0.2,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: notifier.tabBarText2,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Height(12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const API_Connection(),
                              ),
                            );
                          },
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: notifier.getContainerBorder)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: notifier.tabBar1),
                                      child: Image.asset(
                                        "assets/images/cloud-connection.png",
                                        fit: BoxFit.contain,
                                        height: 10,
                                        width: 10,
                                        scale: 3,
                                        color: notifier.passwordIcon,
                                      )),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppConstants.Height(12),
                                      Text(
                                        "API Connection",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Manrope_bold",
                                          fontSize: 14,
                                          color: notifier.textColor,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        "Connect to external services",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Manrope_bold",
                                          fontSize: 12,
                                          letterSpacing: 0.2,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: notifier.tabBarText2,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Height(20),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor,
                              fontSize: 16),
                        ),
                        AppConstants.Height(12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Push_Notifications(),
                                ));
                          },
                          child: accountDetails(
                            image: "assets/images/notification.png",
                            name: "Push Notifications",
                            desc: "Notification preferences",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Notifications(),
                                  ));
                            },
                          ),
                        ),
                        Container(
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: notifier.getContainerBorder),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: notifier.tabBar1,
                                    ),
                                    child: Image.asset(
                                      "assets/images/light dark mode.png",
                                      scale: 20,
                                      color: notifier.passwordIcon,
                                    )),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppConstants.Height(20),
                                    Text(
                                      "Light/Dark Mode",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Manrope_bold",
                                        fontSize: 14,
                                        color: notifier.textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    const Text(
                                      "Mode",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Manrope_bold",
                                        fontSize: 12,
                                        letterSpacing: 0.2,
                                        color: Color(0xff64748B),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Switch(
                                  value: notifier.isDark,
                                  onChanged: (bool value) {
                                    notifier.isavalable(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppConstants.Height(12),
                        Text(
                          "Others",
                          style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              color: notifier.textColor,
                              fontSize: 16),
                        ),
                        AppConstants.Height(12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Help_Center(),
                                ));
                          },
                          child: accountDetails(
                            image: "assets/images/question-circle-outlined.png",
                            name: "Help Center",
                            desc: "Get supports",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Help_Center(),
                                  ));
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Terms(),
                                ));
                          },
                          child: accountDetails(
                            image: "assets/images/Terms&condition.png",
                            name: "Terms & Conditions",
                            desc: "Our terms & conditions",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Terms(),
                                  ));
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Policy(),
                                ));
                          },
                          child: accountDetails(
                            image: "assets/images/Lock.png",
                            name: "Privacy Policy",
                            desc: "Our privacy policy",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Policy(),
                                  ));
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Reffle_code(),
                                ));
                          },
                          child: accountDetails(
                            image: "assets/images/card.png",
                            name: "Refferal Code",
                            desc: "Refferal Program",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Reffle_code(),
                                  ));
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const About_App(),
                                ));
                          },
                          child: accountDetails2(
                            image: "assets/images/Crowwn.png",
                            name: "About App",
                            desc: "About Us",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const About_App(),
                                  ));
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: _showLogoutConfirmationDialog,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: notifier.background,
                              border: Border.all(
                                  color: notifier.getContainerBorder),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.logout,
                                      color: notifier.textColor, size: 24),
                                  const SizedBox(width: 15),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Manrope-Bold",
                                      fontSize: 16,
                                      color: notifier.textColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: notifier.tabBarText2,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Height(10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget accountDetails(
      {required String image,
      required String name,
      required String desc,
      required void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: notifier.getContainerBorder)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: notifier.tabBar1),
                    child: Image.asset(
                      image,
                      scale: 3,
                      color: notifier.passwordIcon,
                    )),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstants.Height(20),
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Manrope_bold",
                        fontSize: 14,
                        color: notifier.textColor,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Manrope_bold",
                        fontSize: 12,
                        letterSpacing: 0.2,
                        color: Color(0xff64748B),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onPress,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: notifier.tabBarText2,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget accountDetails_(
      {required String image,
      required String name,
      required String desc,
      required void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: notifier.getContainerBorder)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: notifier.tabBar1),
                  child: Image.asset(
                    image,
                    scale: 3,
                    color: notifier.passwordIcon,
                  )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.Height(20),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope_bold",
                      fontSize: 14,
                      color: notifier.textColor,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Manrope_bold",
                      fontSize: 12,
                      letterSpacing: 0.2,
                      color: Color(0xff64748B),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: onPress,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: notifier.tabBarText2,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountDetails1(
      {required String image,
      required String name,
      required String desc,
      required void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: notifier.getContainerBorder)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: notifier.tabBar1),
                  child: Image.asset(
                    image,
                    scale: 3,
                    color: notifier.passwordIcon,
                  )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.Height(20),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope_bold",
                      fontSize: 14,
                      color: notifier.textColor,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Manrope_bold",
                      fontSize: 12,
                      letterSpacing: 0.2,
                      color: Color(0xff64748B),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset("assets/images/united-states.png"),
              ),
              IconButton(
                onPressed: onPress,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: notifier.tabBarText2,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountDetails2(
      {required String image,
      required String name,
      required String desc,
      required void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: notifier.getContainerBorder)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: notifier.tabBar1),
                  child: Image.asset(
                    image,
                    scale: 70,
                  )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.Height(20),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope_bold",
                      fontSize: 14,
                      color: notifier.textColor,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Manrope_bold",
                      fontSize: 12,
                      letterSpacing: 0.2,
                      color: Color(0xff64748B),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: onPress,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: notifier.tabBarText2,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountDetails3(
      {required String image,
      required String name,
      required String desc,
      required void Function()? onPress}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: notifier.getContainerBorder)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: notifier.tabBar1),
                  child: Image.asset(
                    image,
                    scale: 20,
                    color: notifier.passwordIcon,
                  )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.Height(20),
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Manrope_bold",
                      fontSize: 14,
                      color: notifier.textColor,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "Manrope_bold",
                      fontSize: 12,
                      letterSpacing: 0.2,
                      color: Color(0xff64748B),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: onPress,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: notifier.tabBarText2,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
