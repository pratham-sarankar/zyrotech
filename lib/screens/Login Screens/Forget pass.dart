// ignore_for_file: file_names

// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../dark_mode.dart';
import '../../services/auth_service.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  ColorNotifire notifier = ColorNotifire();
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = context.read<AuthService>();
  }

  Future<void> _sendForgotPasswordRequest(String email) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authService.forgotPassword(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message']),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send reset link: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: notifier.textColor, size: 25),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: "Manrope-SemiBold",
                    color: notifier.textColor,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Enter your email to receive a password reset link.",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff64748B),
                    fontFamily: "Manrope-Medium",
                  ),
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintStyle: TextStyle(color: notifier.textFieldHintText),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: _isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _sendForgotPasswordRequest(_emailController.text);
                          }
                        },
                  child: Container(
                    height: height / 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _isLoading ? Colors.grey : const Color(0xff6B39F4),
                    ),
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Send Reset Link",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 15,
                                fontFamily: "Manrope-Bold",
                              ),
                            ),
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
}
