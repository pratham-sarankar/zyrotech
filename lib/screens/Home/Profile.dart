// ignore_for_file: file_names
// import 'package:Crowwn/Home/bottom.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crowwn/screens/Login%20Screens/login_screen.dart';
import '../../dark_mode.dart';
import '../Account&setting/API_Connection.dart';
import '../Account&setting/About App.dart';
import '../Account&setting/Help Center.dart';
import '../Account&setting/Personal data.dart';
import '../Account&setting/Privacy&Policy.dart';
import '../Account&setting/Push Notification.dart';
import '../Account&setting/Refferal Code.dart';
import '../Account&setting/Terms&conditions.dart';
import '../Message & Notification/Notifications.dart';
import '../config/common.dart';
import 'bottom.dart';
import 'package:crowwn/features/profile/presentation/providers/profile_provider.dart';
import 'package:crowwn/features/profile/data/models/profile_model.dart';
import '../Account&setting/ChangePassword.dart';
import '../../features/kyc/presentation/screens/identify_verification_screen.dart';

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
    // Only fetch if we don't have data or it's expired
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().fetchProfile();
    });
  }

  // Add a refresh method for pull-to-refresh
  Future<void> _refreshProfile() async {
    await context.read<ProfileProvider>().refreshProfile();
  }

  Future<void> _logout() async {
    try {
      // Clear SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Sign out from Google
      GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      // Navigate to login screen or show a logout success message
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } catch (e) {
      print('Error logging out: $e');
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
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: notifier.background,
        body: RefreshIndicator(
          onRefresh: _refreshProfile,
          child: Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
              return SingleChildScrollView(
                physics:
                    const AlwaysScrollableScrollPhysics(), // Required for RefreshIndicator
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Background (2).png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: statusBarHeight * 0.2,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BottomBarScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white
                                              .withValues(alpha: 0.15),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Personal_data(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (profileProvider.isLoading)
                                const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    strokeWidth: 2,
                                  ),
                                )
                              else if (profileProvider.error != null)
                                Center(
                                  child: Text(
                                    'Error: ${profileProvider.error}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              else if (profileProvider.profile != null) ...[
                                Center(
                                  child: Container(
                                    height: height * 0.07,
                                    width: width * 0.18,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/profile.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Center(
                                  child: Text(
                                    profileProvider.profile!.fullName,
                                    style: const TextStyle(
                                      fontFamily: "Manrope-Bold",
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Center(
                                  child: Text(
                                    profileProvider.profile!.email,
                                    style: const TextStyle(
                                      fontFamily: "Manrope-Regular",
                                      color: Color.fromARGB(255, 214, 200, 255),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                              const SizedBox(height: 6),
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
                                                  color:
                                                      const Color(0xffE8F5E9),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: const Text(
                                                  "Verified",
                                                  style: TextStyle(
                                                    color: Color(0xff2E7D32),
                                                    fontSize: 10,
                                                    fontFamily:
                                                        "Manrope-Regular",
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
                                      const IdentifyVerificationScreen(),
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
                                      builder: (context) =>
                                          const Notifications(),
                                    ));
                              },
                            ),
                          ),
                          Container(
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: notifier.getContainerBorder),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChangePassword(),
                                ),
                              );
                            },
                            child: Container(
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
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: notifier.tabBar1,
                                      ),
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: notifier.passwordIcon,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppConstants.Height(20),
                                        Text(
                                          "Change Password",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Manrope_bold",
                                            fontSize: 14,
                                            color: notifier.textColor,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          "Update your password",
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
                              image:
                                  "assets/images/question-circle-outlined.png",
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
              );
            },
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
