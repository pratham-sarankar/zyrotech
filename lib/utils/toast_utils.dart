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
    late final OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).padding.bottom +
            kBottomNavigationBarHeight +
            10,
        left: 20,
        right: 20,
        child: Material(
          // color: Colors.transparent,
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: type.backgroundColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: type.borderColor),
            ),
            child: Row(
              children: [
                Icon(type.icon, color: type.iconColor, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: type.textColor,
                      fontSize: 14,
                      fontFamily: "Manrope-Regular",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: type.iconColor, size: 20),
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
    backgroundColor: Colors.red,
    borderColor: Color(0xFFFF8080), // Brighter red
    iconColor: Color(0xFFFF4040), // More vivid red
    textColor: Color(0xFFFF0000), // Pure red
  ),
  success(
    icon: Icons.check_circle_outline,
    backgroundColor: Colors.green,
    borderColor: Color(0xFFE5F7E5),
    iconColor: Color(0xFF16A34A),
    textColor: Color(0xFF166534),
  ),
  info(
    icon: Icons.info_outline,
    backgroundColor: Colors.blue,
    borderColor: Color(0xFFE5F0FF),
    iconColor: Color(0xFF2563EB),
    textColor: Color(0xFF1E40AF),
  ),
  warning(
    icon: Icons.warning_amber_outlined,
    backgroundColor: Colors.orange,
    borderColor: Color(0xFFFFF7E5),
    iconColor: Color(0xFFD97706),
    textColor: Color(0xFF92400E),
  );

  final IconData icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  const OverlayType({
    required this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });
}
