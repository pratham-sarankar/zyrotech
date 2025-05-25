// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';
import 'Activity.dart';
import 'Items.dart';

class Nemus extends StatefulWidget {
  const Nemus({super.key});

  @override
  State<Nemus> createState() => _NemusState();
}

class _NemusState extends State<Nemus> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }
  ColorNotifire notifier = ColorNotifire();
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: const Color(0xff6B39F4),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 3,
              color: Colors.white),
        ),
        actions: [
          Image.asset("assets/images/Filter.png",
              height: 15, width: 16,color: Colors.white,),
          AppConstants.Width(20),
          const Icon(Icons.ios_share,
              size: 20, color: Colors.white),
          const SizedBox(width: 20,),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 4,
                            // width: 415,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Background (2).png"),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                              left: 0,
                              right: 0,
                              top: 120,
                              bottom: -50,
                            child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white,width: 4),
                              image: const DecorationImage(image: AssetImage("assets/images/Genesis_artiku.png"),
                                fit: BoxFit.cover,),
                            ),
                          ),
                              /*child: Image.asset("assets/images/Icon.png",
                                  width: 106, height: 106)*/),
                        ],
                      ),
                      AppConstants.Height(65),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Nemus Genesis",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold")),
                          AppConstants.Width(3),
                          Image.asset(
                            "assets/images/verification.png",
                            width: 12,
                            height: 12,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Created by',
                              style:
                                  TextStyle(color: notifier.textFieldHintText, fontSize: 12),
                              children: const <InlineSpan>[
                                TextSpan(
                                  text: ' Spacybox',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff6B39F4),
                                      fontFamily: "Manrope-SemiBold"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      AppConstants.Height(20),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "45.5K",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold"),
                            ),
                            const Text("items",
                                style: TextStyle(
                                    color: Color(0xff64748B), fontSize: 12)),
                          ],
                        ),
                        Container(
                          color: notifier.divider,
                          height: 30,
                          width: 1.5,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    "assets/images/Ethereum (ETH)icon.png",
                                    height: 14,
                                    width: 8),
                                AppConstants.Width(5),
                                Text(
                                  "35.6",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                              ],
                            ),
                            const Text("Floor price",
                                style: TextStyle(
                                    color: Color(0xff64748B), fontSize: 12)),
                          ],
                        ),
                        Container(
                          color: notifier.divider,
                          height: 30,
                          width: 1.5,
                        ),
                        // Spacer(),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    "assets/images/Ethereum (ETH)icon.png",
                                    height: 14,
                                    width: 8),
                                AppConstants.Width(5),
                                Text(
                                  "292.2K",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                              ],
                            ),
                            const Text("Volume",
                                style: TextStyle(
                                    color: Color(0xff64748B), fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppConstants.Height(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 50,
                      // width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: notifier.getContainerBorder),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: TabBar(
                          // onTap: (value) {
                          //   setState(() {
                          //     tab = 1;
                          //   });
                          // },
                          padding:
                              const EdgeInsets.only(left: 10, right: 10, top: 10),
                          controller: _tabController,
                          // dividerColor: Colors.red,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          tabs: [
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.grid_view_outlined,
                                    color: Color(0xff94A3B8), size: 13),
                                AppConstants.Width(3),
                                const Text(
                                  "Items",
                                  style: TextStyle(
                                      color: Color(0xff94A3B8), fontSize: 13),
                                )
                              ],
                            )),
                            Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.trending_up,
                                      color: Color(0xff94A3B8), size: 13),
                                  AppConstants.Width(3),
                                  const Text(
                                    "Activity",
                                    style: TextStyle(
                                        color: Color(0xff94A3B8), fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          // physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [
            Items(),
            activity(),
          ],
        ),
      ),
    );
  }
}

/*
NestedScrollView(
headerSliverBuilder: (context, innerBoxIsScrolled) {
return [
const SliverToBoxAdapter(child: ComunTitle(title: 'Pricing', path: "E-Commerce"),),
SliverToBoxAdapter(child: _buildui(count: 1),),
SliverToBoxAdapter(child: _buildui2(count: 1),),
];
},
body: _tabbars(width: constraints.maxWidth))
*/
