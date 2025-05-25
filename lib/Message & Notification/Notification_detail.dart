// ignore_for_file: file_names, camel_case_types
import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';

class Notification_detail extends StatefulWidget {
  final String image;
  final String name;

  const Notification_detail(
      {super.key, required this.image, required this.name});

  @override
  State<Notification_detail> createState() => _Notification_detailState();
}

class _Notification_detailState extends State<Notification_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6B39F4),
      appBar: AppBar(
        backgroundColor: const Color(0xff6B39F4),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(70),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width / 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff7A4DF5),
                ),
                // decoration:BoxDecoration(borderRadius: BorderRadius.circular(80),color: Color(0xff7A4DF5),) ,
                child: Image.asset(
                  widget.image,
                  scale: 2,
                ),
              ),
            ),
            AppConstants.Height(30),
            Center(
                child: Text(
              widget.name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Manrope-Bold"),
            )),
            AppConstants.Height(70),
            const Row(
              children: [
                Text("Hi,",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Manrope-Bold",
                        color: Colors.white)),
                Text("Rio",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Manrope-Bold",
                        color: Colors.white)),
              ],
            ),
            AppConstants.Height(10),
            const Text(
              "Thank you for registering in financial. Hit the\nverification button below before 48 hours to\nverify your email!",
              style: TextStyle(
                  color: Color(0xffB59CFA),
                  fontSize: 14,
                  fontFamily: "Manrope-Regular"),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: const Center(
                    child: Text("Verify Email",
                        style: TextStyle(
                            color: Color(0xff6B39F4),
                            fontSize: 14,
                            fontFamily: "Manrope-Bold"))),
              ),
            ),
            AppConstants.Height(20),
            const Text(
              "If you have any questions, please call us +91234568 or email Rio@mail.com.",
              style: TextStyle(
                  fontFamily: "Manrope-Regular",
                  fontSize: 14,
                  color: Color(0xffB59CFA)),
            )
          ],
        ),
      ),
    );
  }
}
