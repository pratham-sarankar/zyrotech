// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:crowwn/screens/Home/bottom.dart';
import 'package:crowwn/services/auth_service.dart';
import '../../Dark mode.dart';
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
  final AuthService _authService = AuthService();

  // Add controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authService.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      final message = response['message'];
      final token = response['token'];
      final user = response['user'];

      print('Login successful: $message');
      print('Token: $token');
      print('User: $user');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('token', token);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBarScreen(),
        ),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red.shade600,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loginWithGoogle() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final response = await _authService.loginWithGoogle();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('token', response['token']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBarScreen(),
        ),
      );
    } on Exception catch (e) {
      print('Error: $e');
      // Show error message to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red.shade600,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
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
                            Image.asset("assets/images/144.png",
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
                      child: Column(
                        children: [
                          AppConstants.Height(10),
                          Container(
                            decoration: BoxDecoration(
                              color: notifier.textField,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: _emailController,
                              style: TextStyle(color: notifier.textColor),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Email",
                                fillColor: notifier.textField,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintStyle: TextStyle(
                                    color: notifier.textFieldHintText),
                              ),
                            ),
                          ),
                          AppConstants.Height(15),
                          TextField(
                            controller: _passwordController,
                            style: TextStyle(color: notifier.textColor),
                            obscureText: _obsecuretext,
                            decoration: InputDecoration(
                              hintText: "Password",
                              fillColor: notifier.textField,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintStyle:
                                  TextStyle(color: notifier.textFieldHintText),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obsecuretext = !_obsecuretext;
                                  });
                                },
                                icon: _obsecuretext
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.visibility_off_outlined),
                              ),
                            ),
                          ),
                          // AppConstants.Height(10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  // checkColor: Colors.blue,
                                  side: const BorderSide(
                                      color: Color(0xff334155)),
                                  activeColor: const Color(0xff6B39F4),
                                  checkColor: const Color(0xffFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  value: value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  },
                                ),
                                Text("Remember me",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Manrope-Medium",
                                        color: notifier.textColor)),
                                Expanded(child: AppConstants.Width(60)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Forget(),
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
                          // AppConstants.Height(5),
                          TextButton(
                            onPressed: _isLoading ? null : _login,
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
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text(
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
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
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
