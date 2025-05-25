// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Detail_stock.dart';

class top_gainers_see extends StatefulWidget {
  const top_gainers_see({super.key});

  @override
  State<top_gainers_see> createState() => _top_gainers_seeState();
}

class _top_gainers_seeState extends State<top_gainers_see> {
  List data3 = [
    {
      "image": "assets/images/SHIB.png",
      "name": "SHIB",
      "subtitle": "Shiba Inu",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.09854",
      "percentage": "2.03%",
    },
    {
      "image": "assets/images/cardano.png",
      "name": "ADA",
      "subtitle": "Cardano",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.3391",
      "percentage": "0.95%",
    },
    {
      "image": "assets/images/amazon.png",
      "name": "AMAZON",
      "subtitle": "amazon",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.91",
      "percentage": "0.99%",
    },
    {
      "image": "assets/images/Bitcoin.png",
      "name": "BITCOIN",
      "subtitle": "Bitcoin",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.0954",
      "percentage": "9.03%",
    },
    {
      "image": "assets/images/BTC_USDT.png",
      "name": "BTC_USDT",
      "subtitle": "btc_usdt",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.098",
      "percentage": "2.09%",
    },
    {
      "image": "assets/images/cashback.png",
      "name": "CASHBACK",
      "subtitle": "cashback",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.391",
      "percentage": "0.99%",
    },
    {
      "image": "assets/images/DAI.png",
      "name": "DAI",
      "subtitle": "dai",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.51",
      "percentage": "0.69%",
    },
    {
      "image": "assets/images/cashback.png",
      "name": "CASHBACK",
      "subtitle": "cashback",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.391",
      "percentage": "0.99%",
    },
    {
      "image": "assets/images/SHIB.png",
      "name": "SHIB",
      "subtitle": "Shiba Inu",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.09854",
      "percentage": "2.03%",
    },
    {
      "image": "assets/images/cardano.png",
      "name": "ADA",
      "subtitle": "Cardano",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.3391",
      "percentage": "0.95%",
    },
    {
      "image": "assets/images/cashback.png",
      "name": "CASHBACK",
      "subtitle": "cashback",
      "badge": "assets/images/Down_red_arrow.png",
      "price": " \$0.391",
      "percentage": "0.99%",
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
            child: Image.asset(
                "assets/images/arrow-narrow-left (1).png", scale: 3,color: notifier.textColor,)),
        title: Text("Top gainers see all", style: TextStyle(fontSize: 17,
            fontFamily: "Manrope-Bold",
            color: notifier.textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data3.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 0.6,
                crossAxisSpacing: 1,
              ),
            itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail_stock(),));
                    },
                    child: Container(
                      height: 106,
                      // width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: notifier.getContainerBorder, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10,right: 10,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                    image:
                                    AssetImage(data3[index]['image']),
                                    height: 30,width: 30),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data3[index]['name'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                    ),
                                    Text(data3[index]['subtitle'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Color(0xff64748B),
                                            fontSize: 12)),
                                    // SizedBox(height: 10),

                                  ],
                                ),
                              ],
                            ),
                            AppConstants.Height(10),
                            Row(
                              children: [
                                Text(
                                  data3[index]['price'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: notifier.textColor,fontFamily: "Manrope-Bold"),
                                ),
                                const Spacer(),
                                Image.asset(data3[index]['badge'],height: 10,width: 10,color: const Color(0xff1DCE5C),),
                                AppConstants.Width(3),
                                Text(data3[index]['percentage'],style: const TextStyle(fontSize: 14,color: Color(0xff1DCE5C))),
                              ],
                            )
                          ],
                        ),
                      ),
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
