// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';
import 'Nemus Genesis.dart';

class Hot_collection extends StatefulWidget {
  const Hot_collection({super.key});

  @override
  State<Hot_collection> createState() => _Hot_collectionState();
}

class _Hot_collectionState extends State<Hot_collection> {
  List data4 = [
    {
      "image": "assets/images/Nemus 1.png",
      "name": "Nemus Ge...",
      "price": "\$95,987.00",
    },
    {
      "image": "assets/images/Stories 2.png",
      "name": "Stories from...",
      "price": "\$50,670",
    },
    {
      "image": "assets/images/Crystal 3.png",
      "name": "Crystal Do...",
      "price": "\$10,450",
    },
    {
      "image": "assets/images/Stories 2.png",
      "name": "Stories from...",
      "price": "\$50,670",
    },
    {
      "image": "assets/images/Nemus 1.png",
      "name": "Nemus Ge...",
      "price": "\$95,987.00",
    },
    {
      "image": "assets/images/Crystal 3.png",
      "name": "Crystal Do...",
      "price": "\$10,450",
    },
    {
      "image": "assets/images/Stories 2.png",
      "name": "Stories from...",
      "price": "\$50,670",
    },
    {
      "image": "assets/images/Crystal 3.png",
      "name": "Crystal Do...",
      "price": "\$10,450",
    },
    {
      "image": "assets/images/Stories 2.png",
      "name": "Stories from...",
      "price": "\$50,670",
    },
    {
      "image": "assets/images/Nemus 1.png",
      "name": "Nemus Ge...",
      "price": "\$95,987.00",
    },
    {
      "image": "assets/images/Nemus 1.png",
      "name": "Nemus Ge...",
      "price": "\$95,987.00",
    },
    {
      "image": "assets/images/Crystal 3.png",
      "name": "Crystal Do...",
      "price": "\$10,450",
    },
    {
      "image": "assets/images/Crystal 3.png",
      "name": "Crystal Do...",
      "price": "\$10,450",
    },
    {
      "image": "assets/images/Nemus 1.png",
      "name": "Nemus Ge...",
      "price": "\$95,987.00",
    },
    {
      "image": "assets/images/Stories 2.png",
      "name": "Stories from...",
      "price": "\$50,670",
    },
    {
      "image": "assets/images/Nemus 1.png",
      "name": "Nemus Ge...",
      "price": "\$95,987.00",
    },
    {
      "image": "assets/images/Stories 2.png",
      "name": "Stories from...",
      "price": "\$50,670",
    },
    {
      "image": "assets/images/Crystal 3.png",
      "name": "Crystal Do...",
      "price": "\$10,450",
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
        title: const Text("Hot Collections",style: TextStyle(fontSize: 17,fontFamily: "Manrope-Bold",color: Color(0xff6B39F4))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppConstants.Height(20),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data4.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_,index){
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Nemus(),));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 56,
                        width: 56,
                        child: Image.asset(data4[index]['image']),
                      ),
                      Text(data4[index]['name'],
                          style: TextStyle(
                              fontSize: 13,
                              color: notifier.textColor,
                              fontFamily: "Manrope-SemiBold")),
                      Text(
                        data4[index]['price'],
                        style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xff64748B),
                            fontFamily: "Manrope-Medium"),
                      ),
                    ],
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
