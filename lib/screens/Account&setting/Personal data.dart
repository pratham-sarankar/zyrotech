// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/config/common.dart';
import '../../dark_mode.dart';
import '../../features/profile/presentation/providers/profile_provider.dart';
import '../../features/profile/data/models/profile_model.dart';

class Personal_data extends StatefulWidget {
  const Personal_data({super.key});

  @override
  State<Personal_data> createState() => _Personal_dataState();
}

class _Personal_dataState extends State<Personal_data> {
  ColorNotifire notifier = ColorNotifire();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    // Fetch profile data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileProvider = context.read<ProfileProvider>();
      if (profileProvider.profile == null) {
        profileProvider.fetchProfile();
      } else {
        _populateFields(profileProvider.profile!);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _populateFields(ProfileModel profile) {
    _nameController.text = profile.fullName;
    _emailController.text = profile.email;
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        // Reset fields to current profile data
        final profile = context.read<ProfileProvider>().profile;
        if (profile != null) {
          _populateFields(profile);
        }
      }
    });
  }

  Future<void> _saveChanges() async {
    if (!_isEditing) {
      _toggleEdit();
      return;
    }

    // TODO: Implement update profile API call
    // For now, just toggle back to view mode
    _toggleEdit();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: notifier.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 10),
          child: SafeArea(
            child: AppBar(
              leadingWidth: 60,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/arrow-narrow-left (1).png",
                    scale: 3,
                    color: notifier.textColor,
                  ),
                ),
              ),
              title: Text(
                "Personal Data",
                style: TextStyle(
                  fontFamily: "Manrope-Bold",
                  color: notifier.textColor,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: _toggleEdit,
                    icon: Icon(
                      _isEditing ? Icons.close : Icons.edit,
                      color: const Color(0xff6B39F4),
                      size: 24,
                    ),
                  ),
                ),
              ],
              backgroundColor: notifier.background,
              elevation: 0,
              toolbarHeight: kToolbarHeight + 10,
            ),
          ),
        ),
        body: Consumer<ProfileProvider>(
          builder: (context, profileProvider, child) {
            if (profileProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
      
            if (profileProvider.error != null) {
              return Center(
                child: Text(
                  'Error: ${profileProvider.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
      
            final profile = profileProvider.profile;
            if (profile == null) {
              return const Center(child: Text('No profile data available'));
            }
      
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstants.Height(40),
                    Center(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xff6B39F4),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                              image: const DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (_isEditing)
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff6B39F4),
                                border: Border.all(
                                  color: notifier.isDark
                                      ? const Color(0xff0F172A)
                                      : Colors.white,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    AppConstants.Height(40),
                    Text(
                      "Full name",
                      style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        fontSize: 16,
                        color: notifier.textColor.withOpacity(0.7),
                      ),
                    ),
                    AppConstants.Height(10),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: notifier.isDark
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.05),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      child: TextField(
                        controller: _nameController,
                        enabled: _isEditing,
                        style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 16,
                          fontFamily: "Manrope-Regular",
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter your full name",
                          hintStyle: TextStyle(
                            color: notifier.textColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                    AppConstants.Height(20),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        fontSize: 16,
                        color: notifier.textColor.withOpacity(0.7),
                      ),
                    ),
                    AppConstants.Height(10),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: notifier.isDark
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.05),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      child: TextField(
                        controller: _emailController,
                        enabled: _isEditing,
                        style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 16,
                          fontFamily: "Manrope-Regular",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          hintStyle: TextStyle(
                            color: notifier.textColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                    AppConstants.Height(40),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff6B39F4).withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: _saveChanges,
                child: Center(
                  child: Text(
                    _isEditing ? "Save Changes" : "Edit Profile",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Manrope-Bold",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
