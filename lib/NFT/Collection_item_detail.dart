// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';
import '../Dark mode.dart';
import '../Order_Payment/Order NFT.dart';

class Colle_detail extends StatefulWidget {
  const Colle_detail({super.key});

  @override
  State<Colle_detail> createState() => _Colle_detailState();
}

class _Colle_detailState extends State<Colle_detail>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;

  @override

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/arrow-narrow-left (1).png",
                scale: 3,color: notifier.textColor,
              )),
        ),
        backgroundColor: notifier.background,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert,
              color: notifier.textColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              AppConstants.Height(10),
              Container(
                height: height / 2,
                width: width / 1.1,
                decoration: BoxDecoration(
                    border: Border.all(color: notifier.getContainerBorder),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/Liquid.png",
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              AppConstants.Height(10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Text(
                      "Genesis Artikulugis",
                      style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 20,
                          fontFamily: "Manrope-Bold"),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                        _controller
                            .reverse()
                            .then((value) => _controller.forward());
                      },
                      child: ScaleTransition(
                        scale: Tween(begin: 0.7, end: 1.0).animate(
                            CurvedAnimation(
                                parent: _controller, curve: Curves.linear)),
                        child: _isFavorite
                            ? const Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.red,
                              )
                            :  Icon(
                                Icons.favorite_border,
                                size: 30,
                          color: notifier.textColor,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/Nemus.png"),
                      radius: 10,
                    ),
                    AppConstants.Width(5),
                    const Text(
                      "Nemus Genesis",
                      style: TextStyle(
                          color: Color(0xff64748B),
                          fontSize: 12,
                          fontFamily: "Manrope-SemiBold"),
                    ),
                    AppConstants.Width(5),
                    Image.asset(
                      "assets/images/verification.png",
                      height: 14,
                      width: 14,
                    ),
                  ],
                ),
              ),
              // AppConstants.Height(10),
              const ListTile(
                title: Text(
                    "Unique invocations of this algorithm consist of any \nnumber of several core components including waves that rise and fall, a flow field powered mist",
                    style: TextStyle(color: Color(0xff64748B), fontSize: 12)),
                subtitle: Text("Read more",
                    style: TextStyle(
                        color: Color(0xff6B39F4),
                        fontFamily: "Manrope-SemiBold",
                        fontSize: 12)),
              ),
              AppConstants.Height(5),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
              AppConstants.Height(10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 78,
                  // width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: notifier.getContainerBorder, width: 1)),
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
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage("assets/images/Krishna.jpg"),
                                  fit: BoxFit.cover,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    "Krishna Barbe",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-SemiBold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text("Expiration in 7 days",
                                      style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13,
                                          fontFamily: "Manrope-Regular")),
                                ],
                              ),
                            ),
                            const Spacer(),
                            // AppConstants.Width(60),
                            Column(
                              children: [
                                 Text(
                                  "0.450 ETH",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 78,
                  // width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: notifier.getContainerBorder, width: 1)),
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
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage("assets/images/Nemus.png"),
                                  fit: BoxFit.cover,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    "Barbe",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.textColor,
                                        fontFamily: "Manrope-SemiBold"),
                                  ),
                                  AppConstants.Height(10),
                                  const Text("Expiration in 9 days",
                                      style: TextStyle(
                                          color: Color(0xff64748B),
                                          fontSize: 13,
                                          fontFamily: "Manrope-Regular")),
                                ],
                              ),
                            ),
                            const Spacer(),
                            // AppConstants.Width(60),
                            Column(
                              children: [
                                 Text(
                                  "0.550 ETH",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Order_nft() /*BottomBarScreen()*/,
                ),);
          },
          child: Container(
            height: 56,
            width: 327,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
                child: Text(
              "Buy Now for 0.500 ETH",
              style: TextStyle(
                  fontFamily: "Manrope-Bold",
                  color: Colors.white,
                  fontSize: 16),
            )),
          ),
        ),
      ),
    );
  }
}
