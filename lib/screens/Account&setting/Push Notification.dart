// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/config/Push_notification.dart';
import '../../dark_mode.dart';

class Push_Notifications extends StatefulWidget {
  const Push_Notifications({super.key});

  @override
  State<Push_Notifications> createState() => _Push_NotificationsState();
}

class _Push_NotificationsState extends State<Push_Notifications> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",
                scale: 3, color: notifier.textColor)),
        title: Text("Notification",
            style: TextStyle(
                color: notifier.textColor,
                fontSize: 16,
                fontFamily: "Manrope-Bold")),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 750, child: PushNotification()),
          ],
        ),
      ),
    );
  }
}
