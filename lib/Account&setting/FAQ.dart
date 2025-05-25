// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:crowwn/config/common.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background (2).png"),
                      scale: 2,
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstants.Height(50),
                    const Icon(
                      Icons.menu,
                      color: Color(0xffFFFFFF),
                    ),
                    AppConstants.Height(50),
                    const Text(
                      "Frequently Asked Question",
                      style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    AppConstants.Height(20),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon:
                                Image.asset("assets/images/Search.png", scale: 3),
                            hintText: "Search...",
                            hintStyle: const TextStyle(
                                color: Color(0xff94A3B8),
                                fontSize: 16,
                                fontFamily: "Manrope-Regular"),
                            border:
                                const OutlineInputBorder(borderSide: BorderSide.none)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.Height(20),
                  const Text(
                    "Popular Questions",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff0F172A),
                        fontFamily: "Manrope-Bold"),
                  ),
                  AppConstants.Height(20),
                  const Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xff94A3B8),
                        size: 25,
                      ),
                      Text(
                        "Why didn't I receive the SMS OTP code?",
                        style: TextStyle(
                            fontFamily: "Manrope-Medium",
                            color: Color(0xff6B39F4),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  AppConstants.Height(8),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE2E8F0),
                  ),
                  AppConstants.Height(8),
                  const Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xff94A3B8),
                        size: 25,
                      ),
                      Text(
                        "What is the minimum and maximum amount\nper sale and purchase transaction?",
                        style: TextStyle(
                            fontFamily: "Manrope-Medium",
                            color: Color(0xff6B39F4),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  AppConstants.Height(8),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE2E8F0),
                  ),
                  AppConstants.Height(8),
                  const Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xff94A3B8),
                        size: 25,
                      ),
                      Text(
                        "How much is the balance withdrawal fee?",
                        style: TextStyle(
                            fontFamily: "Manrope-Medium",
                            color: Color(0xff6B39F4),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  AppConstants.Height(8),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE2E8F0),
                  ),
                  AppConstants.Height(8),
                  const Row(
                    children: [
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xff94A3B8),
                        size: 25,
                      ),
                      Text(
                        "How long does it take for account\nverification?",
                        style: TextStyle(
                            fontFamily: "Manrope-Medium",
                            color: Color(0xff6B39F4),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  AppConstants.Height(8),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffE2E8F0),
                  ),
                  AppConstants.Height(10),
                  const Text(
                    "Search by Topics",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff0F172A),
                        fontFamily: "Manrope-Bold"),
                  ),
                  AppConstants.Height(10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.1)),
                      child: ListTile(
                        leading: Image.asset(
                            "assets/images/question-circle-outlined.png",
                            scale: 3,
                            color: const Color(0xff6B39F4)),
                        title: const Text("Getting Started",
                            style: TextStyle(
                                color: Color(0xff0F172A),
                                fontSize: 15,
                                fontFamily: "Manrope-Bold")),
                        trailing: const Icon(Icons.chevron_right,color: Color(0xff94A3B8),size: 25),
                      ),
                    ),
                  ),
                  AppConstants.Height(10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.1)),
                      child: ListTile(
                        leading: Image.asset(
                            "assets/images/Person.png",
                            scale: 3,
                            color: const Color(0xff6B39F4)),
                        title: const Text("My Account",
                            style: TextStyle(
                                color: Color(0xff0F172A),
                                fontSize: 15,
                                fontFamily: "Manrope-Bold")),
                        trailing: const Icon(Icons.chevron_right,color: Color(0xff94A3B8),size: 25),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
