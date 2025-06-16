// ignore_for_file: file_names

// Flutter imports:
import 'package:crowwn/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Add this import for Timer

// Package imports:
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/features/onboarding/presentation/kyc/kyc_screen.dart';
import '../../dark_mode.dart';
import '../../services/auth_service.dart';
import '../../services/auth_storage_service.dart';
import '../../utils/api_error.dart';
import '../config/common.dart';

class EmailVerification extends StatefulWidget {
  final String email;
  final String password;
  const EmailVerification({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  ColorNotifire notifier = ColorNotifire();
  late final AuthService _authService;
  final AuthStorageService _authStorage = AuthStorageService();
  bool _isLoading = false;
  bool _isSendingOtp = false;
  bool _canResendOtp = false;
  int _resendCountdown = 60;
  Timer? _resendTimer;
  bool _isFirstSend = true;
  String _currentOtp = '';
  final int _otpLength = 6;

  @override
  void initState() {
    super.initState();
    _authService = context.read<AuthService>();
    _sendInitialOtp();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _startResendCountdown() {
    setState(() {
      _canResendOtp = false;
      _resendCountdown = 60;
    });

    _resendTimer?.cancel();

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        if (_resendCountdown > 0) {
          _resendCountdown--;
        } else {
          _canResendOtp = true;
          timer.cancel();
        }
      });
    });
  }

  Future<void> _sendInitialOtp() async {
    if (_isSendingOtp) return;

    setState(() {
      _isSendingOtp = true;
    });

    try {
      await _authService.sendEmailOtp(widget.email);
      if (mounted) {
        ToastUtils.showSuccess(
          context: context,
          message: 'Verification code sent to your email',
        );
        _startResendCountdown();
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
          message: 'Failed to send verification code. Please try again.',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSendingOtp = false;
          _isFirstSend = false;
        });
      }
    }
  }

  Future<void> _sendEmailOtp() async {
    if (_isSendingOtp || (!_canResendOtp && !_isFirstSend)) return;

    if (_isFirstSend) {
      await _sendInitialOtp();
      return;
    }

    setState(() {
      _isSendingOtp = true;
    });

    try {
      await _authService.sendEmailOtp(widget.email);
      if (mounted) {
        ToastUtils.showSuccess(
          context: context,
          message: 'Verification code sent to your email',
        );
        _startResendCountdown();
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
          message: 'Failed to send verification code. Please try again.',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSendingOtp = false;
        });
      }
    }
  }

  Future<void> _verifyOtp() async {
    if (_isLoading || _currentOtp.length != _otpLength) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response =
          await _authService.verifyEmailOtp(widget.email, _currentOtp);

      if (response['message'] == 'Email verified successfully') {
        final loginResponse =
            await _authService.login(widget.email, widget.password);
        await _authStorage.setToken(loginResponse['token']);

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const KYCOnboarding(),
            ),
          );
        }
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
          message: 'Failed to verify email. Please try again.',
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

  Widget _buildLoadingScreen(String message) {
    return Container(
      color: notifier.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom animated loading indicator
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: notifier.background,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff6B39F4).withValues(alpha: 0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer rotating circle
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        const Color(0xff6B39F4).withValues(alpha: 0.2),
                      ),
                      strokeWidth: 3,
                    ),
                  ),
                  // Inner pulsing circle
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.8, end: 1.0),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                const Color(0xff6B39F4).withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.email_outlined,
                              color: const Color(0xff6B39F4),
                              size: 24,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Animated text
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: Column(
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                            color: notifier.textColor,
                            fontSize: 18,
                            fontFamily: "Manrope-SemiBold",
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please wait...',
                          style: TextStyle(
                            color: notifier.textColor.withValues(alpha: 0.7),
                            fontSize: 14,
                            fontFamily: "Manrope-Medium",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width = MediaQuery.of(context).size.width;

    // Show full screen loading when sending OTP
    if (_isSendingOtp) {
      return Scaffold(
        backgroundColor: notifier.background,
        body: _buildLoadingScreen(
            'Sending verification code to ${widget.email}...'),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: notifier.textColor, size: 25),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Email Verification",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Manrope-SemiBold",
                    color: notifier.textColor,
                  ),
                ),
                AppConstants.Height(10),
                const Text(
                  "We've sent a verification code to your email address.\nPlease enter the 6-digit code below.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff64748B),
                    fontFamily: "Manrope-Medium",
                  ),
                ),
                AppConstants.Height(30),
                OTPTextField(
                  length: _otpLength,
                  width: width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 10,
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: notifier.textField,
                    borderColor: notifier.getContainerBorder,
                  ),
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: notifier.textColor,
                  ),
                  onChanged: (pin) {
                    setState(() {
                      _currentOtp = pin;
                    });
                  },
                  onCompleted: (pin) {
                    setState(() {
                      _currentOtp = pin;
                    });
                  },
                ),
                AppConstants.Height(20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Didn't receive the code?",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Manrope-SemiBold",
                          color: notifier.textColor,
                        ),
                      ),
                      TextButton(
                        onPressed: _canResendOtp ? _sendEmailOtp : null,
                        child: Text(
                          _canResendOtp
                              ? "Resend Code"
                              : "Resend in $_resendCountdown s",
                          style: TextStyle(
                            fontSize: 14,
                            color: _canResendOtp
                                ? const Color(0xff6B39F4)
                                : const Color(0xff64748B),
                            fontFamily: "Manrope-SemiBold",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppConstants.Height(20),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: (_currentOtp.length == _otpLength && !_isLoading)
                        ? _verifyOtp
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6B39F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      disabledBackgroundColor:
                          const Color(0xff6B39F4).withValues(alpha: 0.5),
                      disabledForegroundColor:
                          Colors.white.withValues(alpha: 0.5),
                    ),
                    child: Text(
                      _isLoading ? "Verifying..." : "Verify Email",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Manrope-Bold",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: notifier.background,
              child: _buildLoadingScreen('Verifying your email...'),
            ),
        ],
      ),
    );
  }
}
