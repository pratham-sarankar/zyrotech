// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../Home/bottom.dart';
import '../config/common.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _Succcess();
}

class _Succcess extends State<Success> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20,left: 10,right: 10),
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
                      child: Icon(Icons.close,color:notifier.textColor,size: 25,)),
                ),
              ],
            ),
            AppConstants.Height(90),
            Center(
              child: Container(
                height: height/3.6,
                // width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/verify success.png"),
                  ),
                ),
              ),
            ),
            AppConstants.Height(20),
             Text(
              "Thanks for submitting your \n Selfie with ID Card",
              style: TextStyle(fontSize: 24, fontFamily: "Manrope-Bold",color: notifier.textColor),
            ),
            AppConstants.Height(10),
            const Text(
              "We can review it now, Wait a few moments\n we will verify it as soon as possible.",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Manrope-Regular",
                color: Color(0xff64748B)
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),),);
              },
              child: Container(
                // width: 327,
                height: 56,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4)),
                child: const Center(child: Text("Continue",style: TextStyle(fontFamily: "Manrope-Bold",fontSize: 18,color: Color(0xffFFFFFF)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}