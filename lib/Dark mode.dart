// ignore_for_file: file_names, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';

class ColorNotifire with ChangeNotifier {
  get textColorGrey =>
      isDark ? const Color(0xff94A3B8) : const Color(0xff64748B);
  get imageColor => isDark ? Colors.white : const Color(0xff0056D2);
  get buttonBorder => isDark ? Colors.white : const Color(0xffEBEBEB);
  get textColor_1 => isDark ? const Color(0xff94A3B8) : const Color(0xff0056D2);
  get dotColor => isDark ? const Color(0xff1E293B) : const Color(0xffEDF5FF);
  get tabColor => isDark ? Colors.white10 : Colors.grey.shade100;
  get tabTextColor => isDark ? const Color(0xff1E293B) : Colors.white;
  get iconColor => isDark ? const Color(0xff64748B) : const Color(0xffCBD5E1);
  get floatingAction =>
      isDark ? const Color(0xff1E293B) : const Color(0xff0F172A);
  get bottomNavigationColor => isDark ? const Color(0xff1E293B) : Colors.white;
  get messageBackColor =>
      isDark ? const Color(0xff1E293B) : const Color(0xffF8F8F8);
  get messageTextColor => isDark ? Colors.white : const Color(0xff0F172A);
  get tabBorder => isDark ? const Color(0xff334155) : const Color(0xffF1F5F9);
  get bottomSheetColor => isDark ? const Color(0xff1E293B) : Colors.white;
  get mentorDetailTextColor =>
      isDark ? const Color(0xffCBD5E1) : const Color(0xff64748B);
  get paymentCardColor => isDark ? Colors.white : Colors.transparent;
  get dividedColor =>
      isDark ? const Color(0xff334155) : const Color(0xffE2E8F0);
  get containerDividedColor =>
      isDark ? const Color(0xff1E293B) : const Color(0xffF1F5F9);

  get outlinedButtonColor =>
      isDark ? const Color(0xff6B39F4) : const Color(0xff6B39F4);
  get background => isDark
      ? const Color(0xff0F172A)
      : const Color.fromARGB(255, 244, 244, 244);
  get onboardBackgroundColor =>
      isDark ? const Color(0xff1E293B) : const Color(0xffF8F9FD);
  get textColor => isDark ? Colors.white : const Color(0xff0F172A);
  get getContainerBorder =>
      isDark ? const Color(0xff334155) : const Color(0xffE2E8F0);
  get checkBox => isDark ? const Color(0xff6B39F4) : const Color(0xffCBD5E1);
  get radioButton => isDark ? const Color(0xff6B39F4) : const Color(0xffCBD5E1);
  get textField => isDark ? const Color(0xff1E293B) : const Color(0xffF8F9FD);
  get textField1 => isDark ? Colors.red : Colors.blue;
  get textFieldHintText =>
      isDark ? const Color(0xff164748b) : const Color(0xff94A3B8);
  get passwordIcon =>
      isDark ? const Color(0xff64748B) : const Color(0xff94A3B8);
  get tabBar1 => isDark ? const Color(0xff1E293B) : const Color(0xffF8F5FF);
  get tabBar3 => isDark ? const Color(0xff6B39F4) : const Color(0xffF8F5FF);
  get tabBar4 => isDark ? const Color(0xff0F172A) : const Color(0xffFFFFFF);
  get tabBar2 => isDark ? const Color(0xff1E293B) : const Color(0xffF8F9FD);
  get tabBarText1 => isDark ? const Color(0xff6B39F4) : const Color(0xff6B39F4);
  get tabBarText2 => isDark ? Colors.grey : Colors.grey;
  get bottom => isDark ? const Color(0xffFFFFFF) : const Color(0xff0F172A);
  get earn => isDark ? Colors.transparent : const Color(0xffFFFFFF);
  get container => isDark ? const Color(0xff334155) : const Color(0xffFFFFFF);
  get divider => isDark ? const Color(0xff334155) : const Color(0xffE2E8F0);
  get linerIndicator =>
      isDark ? const Color(0xff334155) : const Color(0xffF1F5F9);
  get sort => isDark ? const Color(0xff1E293B) : const Color(0xffE2E8F0);
  get iconButton => isDark ? const Color(0xff334155) : const Color(0xffFFFFFF);

  bool _isDark = false;
  bool get isDark => _isDark;

  void isavalable(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
