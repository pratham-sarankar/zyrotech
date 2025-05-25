// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Dark mode.dart';

class Policy extends StatefulWidget {
  const Policy({super.key});

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0.9,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: notifier.textColor,)),
        actions: [
          Icon(Icons.menu, size: 25, color: notifier.textColor),
          const SizedBox(width: 20,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(30),
              Text(
                "Privacy Policy",
                style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 33,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(10),
              Container(
                height: 56,
                width: double.infinity,
                // color: Colors.black,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: notifier.tabBar2),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text("Last update: 12 October 2022",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 16,
                          fontFamily: "Manrope-Regular")),
                ),
              ),
              AppConstants.Height(10),
              Text(
                "The protection and confidentiality of your personal information is very important to us. Therefore, Financial Company with the website financial.com and the Financial mobile application (hereinafter referred to as “Financial”) set the privacy policy as follows:",
                style: TextStyle(
                    fontFamily: "Manrope-Regular",
                    fontSize: 14,
                    color: notifier.tabBarText2),
              ),
              AppConstants.Height(20),
              Text(
                "Our Commitment",
                style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 18,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(10),
              Text(
                "We collect and use your personal information in accordance with the relevant provisions of the personal data protection law. This privacy policy describes the collection, use, storage and protection of your personal information. This applies to applications, all websites, sites and related services of the Financial regardless of how you access or use it.",
                style: TextStyle(
                    fontFamily: "Manrope-regular",
                    fontSize: 14,
                    color: notifier.tabBarText2),
              ),
              AppConstants.Height(20),
              Text(
                "Scope and Approval",
                style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 18,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(10),
              Text(
                "You accept this privacy policy when you register, access, or use our products, services, content, features, technology or functions offered on the application, all websites, sites and related services (collectively called “Financial Services”). We can upload policy changes on this page periodically, the revised version will take effect on the effective date of publication. You are responsible for reviewing this privacy policy as often as possible.",
                style: TextStyle(
                    fontFamily: "Manrope-regular",
                    fontSize: 14,
                    color: notifier.tabBarText2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
