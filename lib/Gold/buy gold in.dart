// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';

class buy_gold extends StatefulWidget {
  const buy_gold({super.key});

  @override
  State<buy_gold> createState() => _buy_goldState();
}

class _buy_goldState extends State<buy_gold> {
  List data3 = [
    {
      "image": "assets/images/united-states.png",
      "name": "USA",
    },
    {
      "image": "assets/images/ukraine.png",
      "name": "Ukraine",
    },
    {
      "image": "assets/images/united-kingdom.png",
      "name": "UK",
    },
    {
      "image": "assets/images/uruguay.png",
      "name": "Uruguay",
    },
    {
      "image": "assets/images/china.png",
      "name": "China",
    },
    {
      "image": "assets/images/germany.png",
      "name": "Germany",
    },
    {
      "image": "assets/images/india.png",
      "name": "India",
    },
    {
      "image": "assets/images/indonesia.png",
      "name": "Indonesia",
    },
    {
      "image": "assets/images/italy.png",
      "name": "Italy",
    },
    {
      "image": "assets/images/spain.png",
      "name": "Spain",
    },
    {
      "image": "assets/images/france.png",
      "name": "France",
    },
  ];
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
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
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: notifier.textColor,)),
        title: Text("Buy gold in",style: TextStyle(fontSize: 17,fontFamily: "Manrope-Bold",color: notifier.textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data3.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_,index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      data3[index]['image'],
                      height: 60,
                      width: 60,
                    ),
                    AppConstants.Height(5),
                      Text(data3[index]['name'],
                        style: TextStyle(
                            fontSize: 15,
                            color: notifier.textColor,
                            fontFamily: "Manrope-SemiBold",
                        ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
