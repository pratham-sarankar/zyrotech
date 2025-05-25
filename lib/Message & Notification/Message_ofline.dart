
// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/common.dart';

class Message_of extends StatefulWidget {
  final String image_;
  final String name_;
  const Message_of({super.key, required this.image_, required this.name_});
  @override
  State<Message_of> createState() => _Message_ofState();
}

class _Message_ofState extends State<Message_of> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 25,
              foregroundImage: AssetImage(widget.image_),
              ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name_,
                style:  TextStyle(fontSize: 14, color: notifier.textColor)),
            AppConstants.Height(6),
            Row(
              children: [
                Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff1DCE5C)),
                ),
                AppConstants.Width(4),
                const Text(
                  "Online",
                  style: TextStyle(color: Color(0xff64748B), fontSize: 10),
                )
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Color(0xff94A3B8),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(20),
              Container(
                height: 84,
                width: width / 1.7,
                // width: 240,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: notifier.onboardBackgroundColor),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                          "Hello Herene!Constecture dipisicnig elit.fames\neros urna fails",
                          style: TextStyle(
                              color: notifier.textColor,
                              fontSize: 14,
                              fontFamily: "Manrope-Regular")),
                    )),
              ),
              AppConstants.Height(10),
              const Text(
                "09:45 AM",
                style: TextStyle(
                    color: Color(0xff94A3B8),
                    fontSize: 12,
                    fontFamily: "Manrope-Regular"),
              ),
              AppConstants.Height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 44,
                    width: width / 2,
                    // width: 185,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff6B39F4)),
                    child: const Center(
                        child: Text("Hello Marielle! Of course.",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 14,
                                fontFamily: "Manrope-Regular"))),
                  ),
                ],
              ),
              AppConstants.Height(10),
              const Center(
                child: Text(
                  "07:00 PM",
                  style: TextStyle(
                      color: Color(0xff94A3B8),
                      fontSize: 12,
                      fontFamily: "Manrope-Regular"),
                ),
              ),
              AppConstants.Height(20),
              Container(
                height: 44,
                width: width / 1.5,
                // width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: notifier.onboardBackgroundColor),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text("Fames eros urna, felis morbi a est est. ",
                          style: TextStyle(
                              color: notifier.textColor,
                              fontSize: 14,
                              fontFamily: "Manrope-Regular")),
                    )),
              ),
              AppConstants.Height(20),
              Container(
                height: 44,
                width:width / 2.7,
                // width: 145,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: notifier.onboardBackgroundColor),
                child: Center(child: Text("felis morbi a est est.",style: TextStyle(color: notifier.textColor),)),
              ),
              AppConstants.Height(10),
                const  Text(
                "07:15 PM",
                style: TextStyle(
                    color: Color(0xff94A3B8),
                    fontSize: 12,
                    fontFamily: "Manrope-Regular"),
              ),
              AppConstants.Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 84,
                    width: width / 1.6,
                    // width: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff6B39F4)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 10),
                        child: Text(
                            "ondimentum nunc porta mi non. Nuncat in id sollicitudin gravida morbicommodo mauris",
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-Regular")),
                      ),
                    ),
                  ),
                ],
              ),
              AppConstants.Height(10),
              const Center(
                child: Text(
                  "08:19 PM",
                  style: TextStyle(
                      color: Color(0xff94A3B8), fontFamily: "Manrope-Regular"),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 70,
        width: double.infinity,
        color: notifier.background,
        child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: notifier.onboardBackgroundColor,
            ),
            child: TextField(
              // maxLines: null,
              // keyboardType: TextInputType.multiline,
              style: TextStyle(color: notifier.textColor),
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.add_circle_outline,
                    color: Color(0xff94A3B8)),
                hintText: "Type message...",
                hintStyle:
                const TextStyle(color: Color(0xff94A3B8), fontSize: 17),
                suffixIcon: Image.asset(
                  "assets/images/Mic.png",
                  scale: 3.5,
                ),
              ),
            )),
      ),

    );
  }
}
