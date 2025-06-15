// ignore_for_file: file_names
// import 'package:Crowwn/Home/bottom.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Login%20Screens/login_screen.dart';
import '../../../dark_mode.dart';
import '../../../screens/Account&setting/API_Connection.dart';
import '../../../screens/Account&setting/About App.dart';
import '../../../screens/Account&setting/Help Center.dart';
import '../../../screens/Account&setting/Identify_Verification.dart';
import '../../../screens/Account&setting/Personal data.dart';
import '../../../screens/Account&setting/Privacy&Policy.dart';
import '../../../screens/Account&setting/Push Notification.dart';
import '../../../screens/Account&setting/Refferal Code.dart';
import '../../../screens/Account&setting/Terms&conditions.dart';
import '../../../screens/Message & Notification/Notifications.dart';
import '../../../screens/config/common.dart';
import '../../../services/auth_service.dart';
import '../../../utils/api_error.dart';
import '../../../utils/snackbar_utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ColorNotifire notifier = ColorNotifire();

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
        SnackbarUtils.showError(
          context: context,
          message: e.message,
        );
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showError(
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
                                    builder: (context) => const Personal_data(),
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
                              image: DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        AppConstants.Height(3),
                        const Center(
                          child: Text(
                            "John Doe",
                            style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              color: Color(0xffFFFFFF),
                              fontSize: 18,
                              height: 1.8,
                            ),
                          ),
                        ),
                        AppConstants.Height(1),
                        const Center(
                          child: Text(
                            "johndoe@mail.com",
                            style: TextStyle(
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
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Reffle_code(),
                    //       ),
                    //     );
                    //   },
                    //   child: Container(
                    //     height: 70,
                    //     decoration: BoxDecoration(
                    //       color: notifier.background,
                    //       borderRadius: BorderRadius.circular(15),
                    //       border: Border.all(
                    //         color: const Color(0xffB59CFA),
                    //       ),
                    //     ),
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Expanded(
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.only(left: 10),
                    //                 child: Text(
                    //                   "Invite your friends and win free asset up to 100",
                    //                   style: TextStyle(
                    //                     fontSize: 16,
                    //                     fontFamily: "Manrope-Regular",
                    //                     color: notifier.textColor,
                    //                     wordSpacing: 2,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           alignment: Alignment.center,
                    //           height: height / 9,
                    //           width: width / 5,
                    //           child: Image.asset(
                    //             "assets/images/Gift_1.png",
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
                            builder: (context) => const Personal_data(),
                          ),
                        );
                      },
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: notifier.getContainerBorder)),
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
                                    "assets/images/Person.png",
                                    scale: 3,
                                    color: notifier.passwordIcon,
                                  )),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
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
                            builder: (context) => const Identify_Verification(),
                          ),
                        );
                      },
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: notifier.getContainerBorder)),
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
                                    "assets/images/Identycard_.png",
                                    scale: 3,
                                    color: notifier.passwordIcon,
                                  )),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            border:
                                Border.all(color: notifier.getContainerBorder)),
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
                                    "assets/images/cloud-connection.png",
                                    fit: BoxFit.contain,
                                    height: 10,
                                    width: 10,
                                    scale: 3,
                                    color: notifier.passwordIcon,
                                  )),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Transaction(),
                    //       ),
                    //     );
                    //   },
                    //   child: accountDetails(
                    //     image: "assets/images/receipt.png",
                    //     name: "Transaction History",
                    //     desc: "Your transaction details",
                    //     onPress: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const Transaction(),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Bank_account(),
                    //       ),
                    //     );
                    //   },
                    //   child: accountDetails(
                    //     image: "assets/images/card.png",
                    //     name: "Bank Account",
                    //     desc: "Manage your bank account",
                    //     onPress: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const Bank_account(),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // Text(
                    //   "Features",
                    //   style: TextStyle(
                    //     color: notifier.textColor,
                    //     fontSize: 16,
                    //     fontFamily: "Manrope-Bold",
                    //   ),
                    // ),
                    // AppConstants.Height(20),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: accountDetails_(
                    //     image: "assets/images/gift.png",
                    //     name: "Mission",
                    //     desc: "Get more rewards",
                    //     onPress: () {},
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: accountDetails_(
                    //     image: "assets/images/refresh-circle.png",
                    //     name: "Auto Invest",
                    //     desc: "Manage auto investment",
                    //     onPress: () {},
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Social_media(),
                    //       ),
                    //     );
                    //   },
                    //   child: accountDetails_(
                    //     image: "assets/images/Instagram outlined.png",
                    //     name: "Social Media",
                    //     desc: "All Social Media",
                    //     onPress: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const Social_media(),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    AppConstants.Height(20),
                    Text(
                      "Settings",
                      style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          color: notifier.textColor,
                          fontSize: 16),
                    ),
                    AppConstants.Height(12),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const Push_Notifications(),
                    //         ));
                    //   },
                    //   child: accountDetails(
                    //     image: "assets/images/notification.png",
                    //     name: "Push Notifications",
                    //     desc: "Notification preferences",
                    //     onPress: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => const Notifications(),
                    //           ));
                    //     },
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Push_Notifications(),
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
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const Select_language(),
                    //         ));
                    //   },
                    //   child: accountDetails1(
                    //     image: "assets/images/Translate.png",
                    //     name: "Languange",
                    //     desc: "English (USA)",
                    //     onPress: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => const Select_language(),
                    //           ));
                    //     },
                    //   ),
                    // ),
                    // ),
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: notifier.getContainerBorder),
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
                          border:
                              Border.all(color: notifier.getContainerBorder),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
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
