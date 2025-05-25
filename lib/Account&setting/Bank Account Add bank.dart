// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Bank Account List.dart';

class Bank_account_add_bank extends StatefulWidget {
  const Bank_account_add_bank({super.key});

  @override
  State<Bank_account_add_bank> createState() => _Bank_account_add_bankState();
}

class _Bank_account_add_bankState extends State<Bank_account_add_bank> {
  bool value = false;
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
        title: Text("Link Your Bank",
            style: TextStyle(
                fontFamily: "Manrope-Bold",
                color: notifier.textColor,
                fontSize: 16)),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(20),
            const Text(
              "Name on card",
              style: TextStyle(
                  fontFamily: "Manrope-Bold",
                  fontSize: 16,
                  color: Color(0xff64748B)),
            ),
            AppConstants.Height(15),
            Container(
              height: height / 14,
              // width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Center(
                child: TextField(
                  style: TextStyle(color: notifier.textColor),
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            AppConstants.Height(15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Expiration",
                      style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          fontSize: 16,
                          color: Color(0xff64748B)),
                    ),
                    AppConstants.Height(15),
                    Container(
                      height: height / 14,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(
                            0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: notifier.textColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "MM/YY",
                            hintStyle: TextStyle(color: notifier.tabBarText2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AppConstants.Width(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CVC",
                      style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        fontSize: 16,
                        color: Color(0xff64748B),
                      ),
                    ),
                    AppConstants.Height(15),
                    Container(
                      height: height / 14,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(
                            0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: notifier.textColor),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "123",
                            hintStyle: TextStyle(color: notifier.tabBarText2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AppConstants.Height(15),
            const Text(
              "Card number",
              style: TextStyle(
                  fontFamily: "Manrope-Bold",
                  fontSize: 16,
                  color: Color(0xff64748B)),
            ),
            AppConstants.Height(15),
            Container(
              height: height / 14,
              // width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(
                    0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
              ),
              child: Center(
                child: TextField(
                  style: TextStyle(color: notifier.textColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "XXXX XXXX XXXX XXXX",
                    hintStyle: TextStyle(color: notifier.tabBarText2),
                  ),
                ),
              ),
            ),
            AppConstants.Height(15),
            const Text(
              "Postal Code",
              style: TextStyle(
                  fontFamily: "Manrope-Bold",
                  fontSize: 16,
                  color: Color(0xff64748B)),
            ),
            AppConstants.Height(15),
            Container(
              height: height / 15,
              // width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(
                    0.1), /*border: Border.all(color: Color(0xff6B39F4))*/
              ),
              child: Center(
                child: TextField(
                  style: TextStyle(color: notifier.textColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            AppConstants.Height(15),
            Row(
              children: [
                Checkbox(
                  side: BorderSide(color: notifier.getContainerBorder),
                  activeColor: notifier.checkBox,
                  checkColor: notifier.textColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By adding a new card, you agree to the .",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Manrope-Medium",
                            color: notifier.textColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Text(
                        "credit/debit card terms",
                        style: TextStyle(
                            color: Color(0xff6B39F4),
                            fontSize: 12,
                            fontFamily: "Manrope-Medium"),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // AppConstants.Height(80),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Bank_list(),
              ),
            );
          },
          child: Container(
            height: 56,
            // width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
              child: Text(
                "Add Card",
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
