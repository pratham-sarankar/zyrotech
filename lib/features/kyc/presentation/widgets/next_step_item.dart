import 'package:flutter/material.dart';

class NextStepItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? iconColor;
  final Color? textColor;

  const NextStepItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultIconColor = Colors.blue;
    final defaultTextColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: (iconColor ?? defaultIconColor).withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            icon,
            size: 16,
            color: iconColor ?? defaultIconColor,
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
                  fontSize: 13,
                  fontFamily: "Manrope-Bold",
                  color: textColor ?? defaultTextColor,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Manrope-Regular",
                  color: (textColor ?? defaultTextColor).withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 