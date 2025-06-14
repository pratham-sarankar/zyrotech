import 'package:flutter/material.dart';
import '../constants/kyc_constants.dart';

class RequirementCard extends StatelessWidget {
  final String title;
  final String description;
  final String subDescription;
  final IconData icon;
  final Color? backgroundColor;
  final Color? textColor;

  const RequirementCard({
    super.key,
    required this.title,
    required this.description,
    required this.subDescription,
    required this.icon,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: (textColor ?? Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black).withOpacity(0.1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: KYCConstants.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: KYCConstants.primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Manrope-Bold",
                    color: textColor ?? Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Manrope-Regular",
                    color: (textColor ?? Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black).withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subDescription,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: "Manrope-Regular",
                    color: (textColor ?? Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black).withOpacity(0.5),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 