// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';

class Select_language extends StatefulWidget {
  const Select_language({super.key});

  @override
  State<Select_language> createState() => _Select_languageState();
}

class _Select_languageState extends State<Select_language> {
  int selectedFilter = 0;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: notifier.textColor,
          ),
        ),
        title: Text("Language",
            style: TextStyle(
                fontFamily: "Manrope-Bold",
                color: notifier.textColor,
                fontSize: 16)),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(20),
              Container(
                height: height / 15,
                // width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifier
                      .onboardBackgroundColor, /*border: Border.all(color: Color(0xff6B39F4))*/
                ),
                child: Center(
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image(
                              image:
                                  const AssetImage("assets/images/Search.png"),
                              height: 20,
                              width: 20,
                              color: notifier.tabBarText2),
                        ),
                        hintText: "Search language",
                        hintStyle: TextStyle(
                            color: notifier.tabBarText2,
                            fontFamily: "Manrope-Regular",
                            fontSize: 16)),
                  ),
                ),
              ),
              AppConstants.Height(20),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedFilter = 0;
                    },
                  );
                },
                child: Container(
                  height: height / 10,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedFilter == 0
                              ? const Color(0xff6B39F4)
                              : notifier.getContainerBorder,
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage(
                                    "assets/images/united-states.png"),
                                height: 25,
                                width: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "English (USA)",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            AppConstants.Height(10),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 0,
                                    groupValue: selectedFilter,
                                    onChanged: (index) {
                                      setState(
                                        () {
                                          selectedFilter = 0;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(15),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedFilter = 1;
                    },
                  );
                },
                child: Container(
                  height: height / 10,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedFilter == 1
                              ? const Color(0xff6B39F4)
                              : notifier.getContainerBorder,
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage(
                                    "assets/images/united-kingdom.png"),
                                height: 25,
                                width: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "English (UK)",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            AppConstants.Height(10),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 1,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 1;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(15),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedFilter = 2;
                    },
                  );
                },
                child: Container(
                  height: height / 10,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedFilter == 2
                              ? const Color(0xff6B39F4)
                              : notifier.getContainerBorder,
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image:
                                    AssetImage("assets/images/indonesia.png"),
                                height: 25,
                                width: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Indonesia",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            AppConstants.Height(10),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 2,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 2;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(15),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedFilter = 3;
                    },
                  );
                },
                child: Container(
                  height: height / 10,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedFilter == 3
                              ? const Color(0xff6B39F4)
                              : notifier.getContainerBorder,
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage("assets/images/ukraine.png"),
                                height: 25,
                                width: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Ukraine",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            AppConstants.Height(10),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 3,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 3;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(15),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedFilter = 4;
                    },
                  );
                },
                child: Container(
                  height: height / 10,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedFilter == 4
                              ? const Color(0xff6B39F4)
                              : notifier.getContainerBorder,
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage("assets/images/uruguay.png"),
                                height: 25,
                                width: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Uruguay",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            AppConstants.Height(10),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 4,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 4;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(15),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedFilter = 5;
                    },
                  );
                },
                child: Container(
                  height: height / 10,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedFilter == 5
                              ? const Color(0xff6B39F4)
                              : notifier.getContainerBorder,
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage("assets/images/france.png"),
                                height: 25,
                                width: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "France",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            AppConstants.Height(10),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 5,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 5;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(15),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedFilter = 6;
                    },
                  );
                },
                child: Container(
                  height: height / 10,
                  // width: 365,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: selectedFilter == 6
                              ? const Color(0xff6B39F4)
                              : notifier.getContainerBorder,
                          width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage("assets/images/italy.png"),
                                height: 25,
                                width: 25),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Italy",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            AppConstants.Height(10),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 6,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 6;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 56,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
              child: Text(
                "Change Language",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "̌Manrope-Bold",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
