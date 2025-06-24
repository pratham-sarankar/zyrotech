// Flutter imports:
import 'package:crowwn/features/brokers/presentation/screens/brokers_screen.dart';
import 'package:crowwn/features/profile/presentation/personal_data.dart';
import 'package:crowwn/features/profile/presentation/widgets/profile_tile.dart';
import 'package:crowwn/features/settings/change-password/presentation/change_password.dart';
import 'package:crowwn/screens/Message%20&%20Notification/Notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Login%20Screens/login_screen.dart';
import '../../../dark_mode.dart';
import '../../../screens/Account&setting/About App.dart';
import '../../../screens/Account&setting/Help Center.dart';
import '../../../screens/Account&setting/Identify_Verification.dart';
import '../../../screens/Account&setting/Privacy&Policy.dart';
import '../../../screens/Account&setting/Push Notification.dart';
import '../../../screens/Account&setting/Refferal Code.dart';
import '../../../screens/Account&setting/Terms&conditions.dart';
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

      // Clear profile data when logging out
      if (mounted) {
        context.read<ProfileProvider>().clearProfile();
      }

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
                        ProfileTile.withBadge(
                          image: 'assets/images/Person.png',
                          name: 'Personal Details',
                          description: 'Your account information',
                          badge: ProfileTileBadge.verified,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PersonalData(),
                              ),
                            );
                          },
                        ),
                        ProfileTile.regular(
                          image: 'assets/images/Identycard_.png',
                          name: 'Identify Verification',
                          description: 'Verify your identity',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Identify_Verification(),
                              ),
                            );
                          },
                        ),
                        ProfileTile.regular(
                          image: 'assets/images/cloud-connection.png',
                          name: 'API Connection',
                          description: 'Connect to external services',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BrokersScreen(),
                              ),
                            );
                          },
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
                        ProfileTile.regular(
                          image: "assets/images/notification.png",
                          name: "Notifications",
                          description: "All notifications",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Notifications(),
                              ),
                            );
                          },
                        ),
                        ProfileTile.withSwitch(
                          image: "assets/images/light dark mode.png",
                          name: "Light/Dark Mode",
                          description: "Mode",
                          switchValue: notifier.isDark,
                          onSwitchChanged: (bool value) {
                            notifier.isavalable(value);
                          },
                          imageScale: 20,
                          centerImage: true,
                        ),
                        ProfileTile.regular(
                          image: "assets/images/notification.png",
                          name: "Change Password",
                          description: "Change your password",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChangePassword(),
                              ),
                            );
                          },
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
                        ProfileTile.regular(
                          image: "assets/images/question-circle-outlined.png",
                          name: "Help Center",
                          description: "Get supports",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Help_Center(),
                              ),
                            );
                          },
                        ),
                        ProfileTile.regular(
                          image: "assets/images/Terms&condition.png",
                          name: "Terms & Conditions",
                          description: "Our terms & conditions",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Terms(),
                                ));
                          },
                        ),
                        ProfileTile.regular(
                          image: "assets/images/Lock.png",
                          name: "Privacy Policy",
                          description: "Our privacy policy",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Policy(),
                                ));
                          },
                        ),
                        ProfileTile.regular(
                          image: "assets/images/card.png",
                          name: "Refferal Code",
                          description: "Refferal Program",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Reffle_code(),
                                ));
                          },
                        ),
                        ProfileTile.regular(
                          image: "assets/images/144.png",
                          name: "About App",
                          description: "About Us",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const About_App(),
                              ),
                            );
                          },
                          centerImage: true,
                        ),
                        ProfileTile.logout(
                          onTap: _showLogoutConfirmationDialog,
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
}
