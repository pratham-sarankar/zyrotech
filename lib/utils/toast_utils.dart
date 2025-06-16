import 'package:flutter/material.dart';

class ToastUtils {
  static void showError({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 5),
  }) {
    _showOverlay(
      context: context,
      message: message,
      type: OverlayType.error,
      duration: duration,
    );
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showOverlay(
      context: context,
      message: message,
      type: OverlayType.success,
      duration: duration,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showOverlay(
      context: context,
      message: message,
      type: OverlayType.info,
      duration: duration,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _showOverlay(
      context: context,
      message: message,
      type: OverlayType.warning,
      duration: duration,
    );
  }

  static void _showOverlay({
    required BuildContext context,
    required String message,
    required OverlayType type,
    required Duration duration,
  }) {
    final overlay = Overlay.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    late final OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).padding.bottom +
            kBottomNavigationBarHeight +
            10,
        left: 20,
        right: 20,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: type.getBackgroundColor(isDark),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: type.getBorderColor(isDark)),
            ),
            child: Row(
              children: [
                Icon(type.icon, color: type.getIconColor(isDark), size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: type.getTextColor(isDark),
                      fontSize: 14,
                      fontFamily: "Manrope-Regular",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close,
                      color: type.getIconColor(isDark), size: 20),
                  onPressed: () => overlayEntry.remove(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

enum OverlayType {
  error(
    icon: Icons.error_outline,
    lightBackgroundColor: Color(0xFFFFF5F5),
    darkBackgroundColor: Color(0xFF2D1B1B),
    lightBorderColor: Color(0xFFFF8080),
    darkBorderColor: Color(0xFF7F4040),
    lightIconColor: Color(0xFFFF4040),
    darkIconColor: Color(0xFFFF8080),
    lightTextColor: Color(0xFF7F2020),
    darkTextColor: Color(0xFFFFCCCC),
  ),
  success(
    icon: Icons.check_circle_outline,
    lightBackgroundColor: Color(0xFFF0FFF0),
    darkBackgroundColor: Color(0xFF1B2D1B),
    lightBorderColor: Color(0xFFE5F7E5),
    darkBorderColor: Color(0xFF408040),
    lightIconColor: Color(0xFF4ADE80),
    darkIconColor: Color(0xFF80FF80),
    lightTextColor: Color(0xFF206020),
    darkTextColor: Color(0xFFCCFFCC),
  ),
  info(
    icon: Icons.info_outline,
    lightBackgroundColor: Color(0xFFF0F7FF),
    darkBackgroundColor: Color(0xFF1B1B2D),
    lightBorderColor: Color(0xFFE5F0FF),
    darkBorderColor: Color(0xFF404080),
    lightIconColor: Color(0xFF60A5FA),
    darkIconColor: Color(0xFF80B0FF),
    lightTextColor: Color(0xFF204060),
    darkTextColor: Color(0xFFCCDDFF),
  ),
  warning(
    icon: Icons.warning_amber_outlined,
    lightBackgroundColor: Color(0xFFFFF7E5),
    darkBackgroundColor: Color(0xFF2D2B1B),
    lightBorderColor: Color(0xFFFFF7E5),
    darkBorderColor: Color(0xFF807F40),
    lightIconColor: Color(0xFFFBBF24),
    darkIconColor: Color(0xFFFFD700),
    lightTextColor: Color(0xFF806020),
    darkTextColor: Color(0xFFFFE5CC),
  );

  final IconData icon;
  final Color lightBackgroundColor;
  final Color darkBackgroundColor;
  final Color lightBorderColor;
  final Color darkBorderColor;
  final Color lightIconColor;
  final Color darkIconColor;
  final Color lightTextColor;
  final Color darkTextColor;

  const OverlayType({
    required this.icon,
    required this.lightBackgroundColor,
    required this.darkBackgroundColor,
    required this.lightBorderColor,
    required this.darkBorderColor,
    required this.lightIconColor,
    required this.darkIconColor,
    required this.lightTextColor,
    required this.darkTextColor,
  });

  Color getBackgroundColor(bool isDark) =>
      isDark ? darkBackgroundColor : lightBackgroundColor;
  Color getBorderColor(bool isDark) =>
      isDark ? darkBorderColor : lightBorderColor;
  Color getIconColor(bool isDark) => isDark ? darkIconColor : lightIconColor;
  Color getTextColor(bool isDark) => isDark ? darkTextColor : lightTextColor;
}
