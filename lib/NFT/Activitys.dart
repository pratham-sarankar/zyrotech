// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List data2 = [
    {
      "image": "assets/images/Genesis_artiku.png",
      "name": "Genesis Art...",
      "subtitle": "Sales",
      "Eth": "0.450 ETH",
      "second": "23 sec ago",
    },
    {
      "image": "assets/images/Chypher.png",
      "name": "Chypher #000",
      "subtitle": "Collection offer",
      "Eth": "0.009 ETH",
      "second": "3m ago",
    },
    {
      "image": "assets/images/Genesis_art.png",
      "name": "Genesis Arti...",
      "subtitle": "Offer",
      "Eth": "0.450 ETH",
      "second": "40 sec ago",
    },
    {
      "image": "assets/images/Genesis_artiku2.png",
      "name": "Liquid Rumi...",
      "subtitle": "Listing",
      "Eth": "0.029 ETH",
      "second": "1m ago",
    },
    {
      "image": "assets/images/Offer.png",
      "name": "Chypher #000",
      "subtitle": "Collection offer",
      "Eth": "0.009 ETH",
      "second": "3m ago",
    },
    {
      "image": "assets/images/Moonbirds.png",
      "name": "Ostored Go...",
      "subtitle": "Sales",
      "Eth": "0.190 ETH",
      "second": "3m ago",
    },
    {
      "image": "assets/images/Manuelaveux.png",
      "name": "Moonbirds",
      "subtitle": "offer",
      "Eth": "0.190 ETH",
      "second": "3m ago",
    },
  ];
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 153,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Event Type", style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              color: Color(0xff94A3B8)),),
                          AppConstants.Width(5),
                          Image.asset("assets/images/angle-down.png", width: 16,
                              height: 16,
                              color: const Color(0xff94A3B8)),
                        ],
                      ),
                    ),
                    AppConstants.Width(10),
                    Container(
                      height: 40,
                      width: 153,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Collections", style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              color: Color(0xff94A3B8)),),
                          AppConstants.Width(5),
                          Image.asset("assets/images/angle-down.png", width: 16,
                              height: 16,
                              color: const Color(0xff94A3B8)),
                        ],
                      ),
                    ),
                    AppConstants.Width(10),
                    Container(
                      height: 40,
                      width: 153,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Event", style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              color: Color(0xff94A3B8)),),
                          AppConstants.Width(5),
                          Image.asset("assets/images/angle-down.png", width: 16,
                              height: 16,
                              color: const Color(0xff94A3B8)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data2.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      // width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: notifier.getContainerBorder, width: 1)),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height:45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage(data2[index]['image']),
                                      fit: BoxFit.cover,),
                                  ),
                                ),
                                // Image(
                                //     image: AssetImage(data2[index]['image']),
                                //     height: 45,
                                //     width: 45),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data2[index]['name'],
                                      style:  TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor),
                                    ),
                                    AppConstants.Height(10),
                                    Text(data2[index]['subtitle'],
                                        style: const TextStyle(
                                            color: Color(0xff64748B),
                                            fontSize: 13)),
                                  ],
                                ),
                                AppConstants.Width(60),
                                Column(
                                  children: [
                                    Text(
                                      data2[index]['Eth'],
                                      style:  TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope-Bold"),
                                    ),
                                    AppConstants.Height(10),
                                    Text(
                                      data2[index]['second'],
                                      style: const TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
