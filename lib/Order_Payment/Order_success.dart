// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/Home/bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/common.dart';

class Order_success extends StatefulWidget {
  const Order_success({super.key});

  @override
  State<Order_success> createState() => _Order_successState();
}

class _Order_successState extends State<Order_success> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
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
              ],
            ),
            AppConstants.Height(90),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Succesfully.png"),
                    scale: 3,
                  ),
                ),
              ),
            ),
            AppConstants.Height(20),
            Text(
              "Successfully purchased",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Manrope-SemiBold",
                color: notifier.textFieldHintText,
              ),
            ),
            AppConstants.Height(10),
            Text(
              "0.061 BTC",
              style: TextStyle(
                  fontSize: 24,
                  color:notifier.textColor,
                  fontFamily: "Manrope-Bold"),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomBarScreen(),
                  ),
                );
              },
              child: Container(
                height: height / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff6B39F4),
                ),
                child: const Center(
                  child: Text(
                    "Show Details",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Manrope-Bold",
                    ),
                  ),
                ),
              ),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomBarScreen(),
                    ));
              },
              child: Container(
                height: height/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifier.textField,
                ),
                child: const Center(
                  child: Text(
                    "Done",
                    style: TextStyle(color: Color(0xff6B39F4), fontSize: 17,fontFamily: "Manrope-Bold"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
