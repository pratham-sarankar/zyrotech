// ignore_for_file: file_names
import 'package:crowwn/screens/Login%20Screens/Verify%20success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import '../../Dark mode.dart';
import '../config/Liner_indicator.dart';
import '../config/common.dart';
import 'Verify identi.dart';

class Proof extends StatefulWidget {
  const Proof({super.key});

  @override
  State<Proof> createState() => _ProofState();
}

class _ProofState extends State<Proof> {
  int selectedFilter = 0;
  ColorNotifire notifier = ColorNotifire();
  File? selectedFile;
  String? fileName;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
      );

      if (result != null) {
        setState(() {
          selectedFile = File(result.files.single.path!);
          fileName = result.files.single.name;
        });
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: notifier.textColor,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(10),
            indicator(value: 1),
            AppConstants.Height(10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Select and upload",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Manrope-Bold",
                  color: notifier.textColor,
                ),
              ),
            ),
            AppConstants.Height(10),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "We need this to verify your identity. Please upload either your Aadhar Card or PAN Card. Data is processed securely.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff64748B),
                  fontFamily: "Manrope-Regular",
                ),
              ),
            ),
            AppConstants.Height(30),
            Container(
              height: height / 10.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: notifier.textField,
                  border: Border.all(
                      color: selectedFilter == 0
                          ? const Color(0xff6B39F4)
                          : notifier.background)),
              child: Center(
                child: ListTile(
                  onTap: () {
                    setState(
                      () {
                        selectedFilter = 0;
                      },
                    );
                  },
                  leading: const Image(
                      image: AssetImage("assets/images/identycard.png"),
                      height: 40,
                      width: 40),
                  title: Text("Aadhar Card",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Manrope-Bold",
                          color: notifier.textColor)),
                  trailing: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xff6B39F4)),
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
                ),
              ),
            ),
            AppConstants.Height(20),
            Container(
              height: height / 10.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: notifier.textField,
                border: Border.all(
                  color: selectedFilter == 1
                      ? const Color(0xff6B39F4)
                      : notifier.background,
                ),
              ),
              child: Center(
                child: ListTile(
                  onTap: () {
                    setState(
                      () {
                        selectedFilter = 1;
                      },
                    );
                  },
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/images/digital_document.png",
                      scale: 2.9,
                    ),
                  ),
                  title: Text(
                    "PAN Card",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Manrope-Bold",
                      color: notifier.textColor,
                    ),
                  ),
                  trailing: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xff6B39F4),
                    ),
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
                ),
              ),
            ),
            AppConstants.Height(30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: notifier.textField,
                  border: Border.all(
                    color: const Color(0xff6B39F4),
                    width: 2,
                  ),
                ),
                child: selectedFile != null
                    ? Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff6B39F4)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Icon(
                                    Icons.description,
                                    size: 50,
                                    color: Color(0xff6B39F4),
                                  ),
                                ),
                                AppConstants.Height(20),
                                Text(
                                  fileName!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Manrope-Bold",
                                    color: notifier.textColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                AppConstants.Height(10),
                                Text(
                                  "Tap to change document",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-Regular",
                                    color: notifier.textColor.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFile = null;
                                  fileName = null;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : GestureDetector(
                        onTap: pickFile,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff6B39F4).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  Icons.upload_file,
                                  size: 50,
                                  color: Color(0xff6B39F4),
                                ),
                              ),
                              AppConstants.Height(20),
                              Text(
                                "Upload Document",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Manrope-Bold",
                                  color: notifier.textColor,
                                ),
                              ),
                              AppConstants.Height(10),
                              Text(
                                "Supported formats: JPG, PNG, PDF",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Manrope-Regular",
                                  color: notifier.textColor.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            AppConstants.Height(20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              backgroundColor: const Color(0xff6B39F4),
            ),
            onPressed: selectedFile != null
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Success(),
                      ),
                    );
                  }
                : null,
            child: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Manrope-SemiBold",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/* const Spacer(),
            Center(
              child: Container(
                height: 50,
                // width: 330,
                decoration: BoxDecoration(
                    color: const Color(0xff6B39F4),
                    borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Verify(),
                        )
                      );
                    },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6B39F4),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 300),
                          borderRadius: BorderRadius.circular(15))),
                  child: const Center(
                      child: Text("Continue",
                          style: TextStyle(color: Colors.white, fontSize: 19))),
                ),
              ),
            ),
            AppConstants.Height(10),*/
