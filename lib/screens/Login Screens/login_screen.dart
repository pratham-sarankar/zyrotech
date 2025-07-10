// Flutter imports:
import 'package:crowwn/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/features/home/presentation/home_screen.dart';
import 'package:crowwn/screens/Login%20Screens/Email%20verification.dart';
import 'package:crowwn/services/auth_service.dart';
import 'package:crowwn/services/auth_storage_service.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/features/profile/presentation/providers/profile_provider.dart';

import '../../dark_mode.dart';
import '../config/common.dart';
import 'Forget pass.dart';
import 'Sign up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool value = false;
  bool _obsecuretext = true;
  bool _isLoading = false;
  ColorNotifire notifier = ColorNotifire();
  late final AuthService _authService;
  final AuthStorageService _authStorage = AuthStorageService();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _authService = context.read<AuthService>();
  }

  Future<void> _login() async {
    if (_isLoading) return;
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      final formData = _formKey.currentState!.value;

      final email = formData['email'].toString().trim();
      final password = formData['password'].toString().trim();

      try {
        final response = await _authService.login(
          email,
          password,
        );
        final token = response['token'];

        await _authStorage.setToken(token);

        // Reload profile after successful login
        if (mounted) {
          await context.read<ProfileProvider>().fetchProfile(force: true);
        }

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      } on ApiError catch (e) {
        if (e.code == "email-not-verified") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmailVerification(
                email: email,
                password: password,
              ),
            ),
          );
          return;
        }
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
            message: 'An unexpected error occurred. Please try again.',
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } else {
      ToastUtils.showInfo(
        context: context,
        message: 'Please fill in all required fields correctly.',
      );
    }
  }

  Future<void> _loginWithGoogle() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final response = await _authService.loginWithGoogle();
      await _authStorage.setToken(response['token']);

      // Reload profile after successful Google login
      if (mounted) {
        await context.read<ProfileProvider>().fetchProfile(force: true);
      }

      if (mounted) {
        ToastUtils.showSuccess(
          context: context,
          message: 'Google login successful! Welcome back.',
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
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
          message: 'An unexpected error occurred. Please try again.',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: notifier.background,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                        height: height / 2.6,
                        width: width,
                        color: const Color(0xff0F172A),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 10),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: notifier.textColor,
                                        size: 25,
                                      )),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Image.asset("assets/images/app-icon.png",
                                color: notifier.isDark ? Colors.white : null,
                                height: height / 6),
                            const Spacer(),
                            const Text('Welcome Back!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: "Manrope-Bold")),
                            const Text('Sign in to your account',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "Manrope-Medium")),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )),
                    AppConstants.Height(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppConstants.Height(10),
                            FormBuilderTextField(
                              name: 'email',
                              style: TextStyle(color: notifier.textColor),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Email",
                                fillColor: notifier.textField,
                                prefixIcon: Icon(IconlyLight.message),
                                prefixIconColor: notifier.textFieldHintText,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintStyle: TextStyle(
                                  color: notifier.textFieldHintText,
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Email is required'),
                                FormBuilderValidators.email(
                                    errorText: 'Please enter a valid email'),
                              ]),
                            ),
                            AppConstants.Height(15),
                            FormBuilderTextField(
                              name: 'password',
                              style: TextStyle(color: notifier.textColor),
                              obscureText: _obsecuretext,
                              decoration: InputDecoration(
                                hintText: "Password",
                                fillColor: notifier.textField,
                                prefixIcon: Icon(IconlyLight.lock),
                                prefixIconColor: notifier.textFieldHintText,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintStyle: TextStyle(
                                    color: notifier.textFieldHintText),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obsecuretext = !_obsecuretext;
                                    });
                                  },
                                  icon: _obsecuretext
                                      ? const Icon(
                                          IconlyLight.show,
                                        )
                                      : const Icon(
                                          IconlyLight.hide,
                                        ),
                                ),
                                suffixIconColor: notifier.textFieldHintText,
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Password is required'),
                                FormBuilderValidators.minLength(6,
                                    errorText:
                                        'Password must be at least 6 characters'),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: AppConstants.Width(60)),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Forget(),
                                          ));
                                    },
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff6B39F4),
                                          fontFamily: "Manrope-Bold"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff6B39F4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                              ),
                              child: Center(
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 15,
                                    fontFamily: "Manrope-Bold",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppConstants.Height(20),
                    const Text(
                      "--------------- Or sign in with ---------------",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff64748B),
                          fontFamily: "Manrope-Medium"),
                    ),
                    AppConstants.Height(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          side: BorderSide(color: notifier.getContainerBorder),
                          minimumSize: Size(double.infinity, 56),
                        ),
                        onPressed: _loginWithGoogle,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/google.png"),
                              height: 19,
                              width: 16,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Google",
                              style: TextStyle(
                                color: notifier.isDark
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: "Manrope-SemiBold",
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppConstants.Height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontFamily: "Manrope-Medium",
                              color: Color(0xff64748B)),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Sign(),
                                  ));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff6B39F4),
                                  fontFamily: "Manrope-Bold"),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Loading Overlay
            if (_isLoading)
              Container(
                color: Colors.black.withValues(alpha: 0.5),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: notifier.background,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xff6B39F4),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Signing in...',
                          style: TextStyle(
                            color: notifier.textColor,
                            fontSize: 16,
                            fontFamily: "Manrope-Medium",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
