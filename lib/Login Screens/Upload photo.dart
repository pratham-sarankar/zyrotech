// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Verify success.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: height,
                width: 450,
                color: const Color(0xff0F172A),
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Take a Selfie with ID Card",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      AppConstants.Height(10),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Please look at the camera and hold still",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Women.png"),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 200, left: 200),
                              child: SizedBox(
                                height: 120,
                                width: 181,
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/women1.png",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -130,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: notifier.textField,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Success(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: width / 1.1,
                                            height: height / 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xff6B39F4),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Take Picture",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 18,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 95, left: 20),
                                        child: SizedBox(
                                          height: height / 15,
                                          width: width / 1.1,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Success(),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              "Retake Picture",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff6B39F4),
                                                fontFamily: "Manrope-Bold",
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
