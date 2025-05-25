// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Detail_crypto.dart';

class Trending_see extends StatefulWidget {
  const Trending_see({super.key});

  @override
  State<Trending_see> createState() => _Trending_seeState();
}

class _Trending_seeState extends State<Trending_see> {
  List data2 = [
    {
      "image": "assets/images/SHIB.png",
      "name": "SHIB",
      "subtitle": "Shiba Inu",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.09854",
      "percentage": "2.03%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/cardano.png",
      "name": "ADA",
      "subtitle": "Cardano",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.3391",
      "percentage": "0.95%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/amazon.png",
      "name": "AMAZON",
      "subtitle": "amazon",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.91",
      "percentage": "0.99%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/Bitcoin.png",
      "name": "BITCOIN",
      "subtitle": "Bitcoin",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.0954",
      "percentage": "9.03%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/BTC_USDT.png",
      "name": "BTC_USDT",
      "subtitle": "btc_usdt",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.098",
      "percentage": "2.09%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/chase.png",
      "name": "CASHBACK",
      "subtitle": "cashback",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.391",
      "percentage": "0.99%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/chase.png",
      "name": "CHASE",
      "subtitle": "Chase",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.31",
      "percentage": "0.19%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/citi bank.png",
      "name": "CITI BANK",
      "subtitle": "Citi bank",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.91",
      "percentage": "0.29%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/DAI.png",
      "name": "DAI",
      "subtitle": "dai",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.51",
      "percentage": "0.69%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/SHIB.png",
      "name": "SHIB",
      "subtitle": "Shiba Inu",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.09854",
      "percentage": "2.03%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/cardano.png",
      "name": "ADA",
      "subtitle": "Cardano",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.3391",
      "percentage": "0.95%",
      "chart": "assets/images/ABNB Chart.png",
    },
    {
      "image": "assets/images/cashback.png",
      "name": "CASHBACK",
      "subtitle": "cashback",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.391",
      "percentage": "0.99%",
      "chart": "assets/images/ABNB Chart.png",
    },
  ];
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              Image.asset("assets/images/arrow-narrow-left (1).png", scale: 3,color: notifier.textColor),
        ),
        title: const Text("See All Treding",
            style: TextStyle(
                color: Color(0xff6B39F4),
                fontSize: 17,
                fontFamily: "Manrope-Bold")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data2.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail_crypto(),));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: notifier.getContainerBorder, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  height: MediaQuery.of(context).size.height / 19,
                                  width: MediaQuery.of(context).size.height / 19,
                                  image: AssetImage(data2[index]['image']),
                                ),
                                AppConstants.Width(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data2[index]['name'],
                                      style:  TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor,
                                          fontFamily: "Manrope-Bold"),
                                    ),
                                    Text(
                                      data2[index]['subtitle'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xff64748B), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AppConstants.Height(17),
                            Text(
                              data2[index]['price'],
                              style:  TextStyle(
                                  fontSize: 13,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  data2[index]['badge'],
                                  height: 10,
                                  width: 10,
                                ),
                                AppConstants.Width(3),
                                Text(data2[index]['percentage'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Manrope-Bold",
                                        color: Color(0xffE82C81))),
                                const Spacer(),
                                Image.asset(data2[index]['chart'],
                                    height: 33,
                                    width: 80,
                                    color: const Color(0xffE82C81)),
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
