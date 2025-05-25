// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Collections.dart';

class Hot_bids extends StatefulWidget {
  const Hot_bids({super.key});

  @override
  State<Hot_bids> createState() => _Hot_bidsState();
}

class _Hot_bidsState extends State<Hot_bids> {
  List data5 = [
    {
      "image": "assets/images/Liquid.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
    {
      "image": "assets/images/Genesis.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
    {
      "image": "assets/images/Genesis_artiku2.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
    {
      "image": "assets/images/Genesis13.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
    {
      "image": "assets/images/Genesis.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
    {
      "image": "assets/images/Liquid.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
    {
      "image": "assets/images/Genesis12.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
    {
      "image": "assets/images/Liquid.png",
      "name": "Nemus Genesis",
      "badge": "assets/images/verification.png",
      "subtitle": "Genesis Artikulugis",
      "price": "Price",
      "bid": "Current bid",
      "Et": "500",
      "Et1": "700",
    },
  ];
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 3,
              color: notifier.textColor,
            )),
        title: Text("Hot Bids",
            style: TextStyle(
                fontSize: 17,
                fontFamily: "Manrope-Bold",
                color: notifier.textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data5.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Collections(),
                      ),
                    );
                  },
                  child: Container(
                    height: height / 5,
                    // width: 194,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: notifier.getContainerBorder, width: 1.5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 7, top: 7, right: 7),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              data5[index]['image'],
                              height: height / 5.3,
                              width: width / 2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        AppConstants.Height(5),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: Row(
                            children: [
                              Text(
                                data5[index]['name'],
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Manrope-Regular",
                                  color: Color(0xff64748B),
                                ),
                              ),
                              AppConstants.Width(3),
                              Image.asset(
                                data5[index]['badge'],
                                width: width / 18,
                                height: height / 55,
                              )
                            ],
                          ),
                        ),
                        AppConstants.Height(5),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            data5[index]['subtitle'],
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Manrope-Bold",
                                color: notifier.textColor),
                          ),
                        ),
                        AppConstants.Height(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: height / 13,
                            width: width / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: notifier.tabBar2),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 13, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        data5[index]['price'],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        data5[index]['bid'],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff64748B),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                AppConstants.Height(5),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        data5[index]['Et'],
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff6B39F4),
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      const Spacer(),
                                      Text(
                                        data5[index]['Et1'],
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
