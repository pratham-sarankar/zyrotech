// ignore_for_file: file_names

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../Dark mode.dart';
import '../config/common.dart';
import 'Password update.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  ColorNotifire notifier = ColorNotifire();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _confirmPasswordFocusNode.addListener(_handleConfirmPasswordFocusChange);
  }

  void _handleConfirmPasswordFocusChange() {
    if (!_confirmPasswordFocusNode.hasFocus) {
      if (_confirmPasswordController.text.isNotEmpty &&
          _newPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text == _newPasswordController.text) {
        FocusScope.of(context).unfocus();
      }
    }
  }

  void _checkAndDismissKeyboard(String value) {
    if (value.isNotEmpty &&
        _newPasswordController.text.isNotEmpty &&
        value == _newPasswordController.text) {
      FocusScope.of(context).unfocus();
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement actual password reset logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulated API call

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Password(),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error resetting password: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
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
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.removeListener(_handleConfirmPasswordFocusChange);
    _confirmPasswordFocusNode.dispose();
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
                  "Create New Password",
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: "Manrope-SemiBold",
                    color: notifier.textColor,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Your new password must be different from \nprevious password.",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff64748B),
                    fontFamily: "Manrope-Medium",
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height / 13,
                  decoration: BoxDecoration(
                    color: notifier.textField,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _newPasswordController,
                    style: TextStyle(color: notifier.textColor),
                    obscureText: _obscureNewPassword,
                    validator: _validatePassword,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(color: notifier.textFieldHintText),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureNewPassword = !_obscureNewPassword;
                          });
                        },
                        icon: Icon(
                          _obscureNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: notifier.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  height: height / 13,
                  decoration: BoxDecoration(
                    color: notifier.textField,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocusNode,
                    style: TextStyle(color: notifier.textColor),
                    obscureText: _obscureConfirmPassword,
                    validator: _validateConfirmPassword,
                    onChanged: _checkAndDismissKeyboard,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(color: notifier.textFieldHintText),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: notifier.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: _isLoading ? null : _resetPassword,
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
                              "Reset Password",
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
