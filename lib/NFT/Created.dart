// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';

class Created extends StatefulWidget {
  const Created({super.key});

  @override
  State<Created> createState() => _CreatedState();
}

class _CreatedState extends State<Created> {
  List data2 = [
    {
      "image": "assets/images/Liquid.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis #0013",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.090 ETH",
      "Et1": "0.050 ETH",
    },
    {
      "image": "assets/images/Genesis.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis Artiku #02",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.100ETH",
      "Et1": "0.83ETH",
    },
    {
      "image": "assets/images/Genesis_artiku2.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis #0012",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.250ETH",
      "Et1": "0.190ETH",
    },
    {
      "image": "assets/images/Genesis_artiku.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis Artiku #01",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.500ETH",
      "Et1": "0.450ETH",
    },
    {
      "image": "assets/images/Genesis.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis #0013",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.500ETH",
      "Et1": "0.450ETH",
    },
    {
      "image": "assets/images/Genesis_artiku2.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis #0014",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.500ETH",
      "Et1": "0.450ETH",
    },
  ];
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data2.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.9,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (_, index) {
                  return Container(
                    // height: 235,
                    // width: 156,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: notifier.getContainerBorder)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              data2[index]['image'],
                              height: height / 4.5,
                              // width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),

                          AppConstants.Height(5),
                          Row(
                            children: [
                              Text(
                                data2[index]['name'],
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: "Manrope-SemiBold",
                                    color: Color(0xff64748B)),
                              ),
                              AppConstants.Width(3),
                              Image.asset(
                                data2[index]['badge'],
                                height: height / 40,
                              )
                            ],
                          ),
                          Text(
                            data2[index]['subtitle'],
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Manrope-Bold",
                                color: notifier.textColor),
                          ),
                          AppConstants.Height(20),
                          Container(
                            height: 50,
                            width: 178,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: notifier.textField),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        data2[index]['label'],
                                        style: const TextStyle(
                                            fontSize: 9,
                                            color: Color(0xff64748B)),
                                      ),
                                      const Spacer(),
                                      Text(
                                        data2[index]['label1'],
                                        style: const TextStyle(
                                            fontSize: 9,
                                            color: Color(0xff64748B)),
                                      )
                                    ],
                                  ),
                                  AppConstants.Height(5),
                                  Row(
                                    children: [
                                      Text(
                                        data2[index]['Et'],
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xff6B39F4),
                                            fontFamily: "Manrope-SemiBold"),
                                      ),
                                      const Spacer(),
                                      Text(
                                        data2[index]['Et1'],
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-SemiBold"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              AppConstants.Height(20),


            ],
          ),
        ),
      ),
    );
  }
}
