// ignore_for_file: file_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/common.dart';
import 'Collection_item_detail.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 3,
              color: notifier.textColor,
            )),
        backgroundColor: notifier.background,
        title: Center(
            child: Text("Place Bid",
                style: TextStyle(
                    fontSize: 17,
                    color: notifier.textColor,
                    fontFamily: "Manrope-Bold"))),
        actions: [
          Icon(
            Icons.more_vert,
            color: notifier.textColor,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                // fit: StackFit.expand,
                children:[
                  Container(
                  height: height / 2.8,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: notifier.getContainerBorder, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.center,
                      height: height / 2.8,
                      // width: width,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/images/Liquid.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),),
                      child: Align(
                        alignment: const Alignment(0, 0.8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 10,sigmaX: 10),blendMode: BlendMode.luminosity/*luminosity*/,
                            child: Container(
                              height: height / 15,
                              width: width / 1.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Ends in",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 0),
                                      child: SizedBox(
                                        height: 20,
                                        width: 150,
                                        child: TweenAnimationBuilder<Duration>(
                                          duration: const Duration(hours: 5),
                                          tween: Tween(
                                              begin: const Duration(hours: 5),
                                              end: Duration.zero),
                                          onEnd: () {},
                                          builder: (BuildContext context,
                                              Duration value, Widget? child) {
                                            final houres = value.inHours % 40;
                                            final day = value.inDays + 31;
                                            final minutes = value.inMinutes % 30;
                                            final seconds = value.inSeconds % 60;
                                            return Row(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("${day}d ",
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15)),
                                                          const Text(": ",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15)),
                                                          Text("${houres}h ",
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15)),
                                                          const Text(": ",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15)),
                                                          Text("${minutes}m ",
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15)),
                                                          const Text(": ",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15)),
                                                          Text("${seconds}s ",
                                                              style: const TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset("",width: width/1.1,)),*/
                    ),
                  ),
                ),
              ],
              ),
              AppConstants.Height(10),
              Row(
                children: [
                  const Text(
                    "Nemus Genesis",
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff64748B),
                        fontFamily: "Manrope-SemiBold"),
                  ),
                  AppConstants.Width(3),
                  Image.asset(
                    "assets/images/verification.png",
                    width: 12,
                    height: 12,
                  ),
                ],
              ),
              AppConstants.Height(3),
              Text(
                "Genesis Artikulugis",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Manrope-Bold",
                    color: notifier.textColor),
              ),
              AppConstants.Height(7),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                    "Unique invocations of this algorithm consist of any  number of several core components including waves that  rise and fall, a flow field powered mist.",
                    style: TextStyle(color: Color(0xff64748B), fontSize: 12)),
                subtitle: Text(
                  "Read more",
                  style: TextStyle(
                    color: Color(0xff6B39F4),
                    fontFamily: "Manrope-SemiBold",
                  ),
                ),
              ),
              AppConstants.Height(10),
              Container(
                height: 60,
                // width: 327,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifier.onboardBackgroundColor,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Container(
                      height: height / 17,
                      width: width / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: notifier.iconButton,
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.remove, color: notifier.textColor),
                        onPressed: _decrementCounter,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/Ethereum (ETH).png",
                      height: 24,
                      width: 24,
                    ),
                    AppConstants.Width(10),
                    Text(
                      '$_counter ETH',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Manrope-SemiBold",
                          color: notifier.textColor),
                    ),
                    const Spacer(),
                    Container(
                      height: height / 17,
                      width: width / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff6B39F4),
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: const Icon(Icons.add, color: Color(0xffFFFFFF)),
                        onPressed: _incrementCounter,
                      ),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                  ],
                ),
              ),
              AppConstants.Height(10),
              Text(
                "History of Bid",
                style: TextStyle(
                    fontFamily: "Manrope-Bold", color: notifier.textColor),
              ),
              AppConstants.Height(10),
              Container(
                height: MediaQuery.of(context).size.height / 9,
                // width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: notifier.getContainerBorder, width: 1),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
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
                              image: DecorationImage(
                                image: AssetImage("assets/images/Krishna.jpg"),
                                fit: BoxFit.cover,
                              ),
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
                                const Text(
                                  "Expiration in 7 days",
                                  style: TextStyle(
                                      color: Color(0xff64748B),
                                      fontSize: 13,
                                      fontFamily: "Manrope-Regular"),
                                ),
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
                                    fontFamily: "Manrope-SemiBold"),
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
              AppConstants.Height(10),
              Container(
                height: MediaQuery.of(context).size.height / 9,
                // width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: notifier.getContainerBorder, width: 1),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Image(
                              image: AssetImage("assets/images/Krishna1.png"),
                              height: 40,
                              width: 40),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rio",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-SemiBold"),
                                ),
                                AppConstants.Height(10),
                                const Text("Expiration in 5 days",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 13,
                                        fontFamily: "Manrope-Regular")),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                "0.50 ETH",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-SemiBold"),
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
                  builder: (context) => const Colle_detail(),
                ));
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
                "Place a Bid",
                style: TextStyle(
                    fontFamily: "Manrope-Bold",
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
