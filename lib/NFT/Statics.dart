// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Activitys.dart';
import 'Ranking.dart';

class Statics extends StatefulWidget {
  const Statics({super.key});

  @override
  State<Statics> createState() => _StaticsState();
}

class _StaticsState extends State<Statics>with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: notifier.textColor,)),
          ),
          backgroundColor: notifier.background,
          title: Center(
              child: Text("Statistics",
                  style: TextStyle(
                      fontSize: 17,
                      color: notifier.textColor,
                      fontFamily: "Manrope-Bold"))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                color: notifier.textColor,
              ),
            ),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppConstants.Height(20),
                        Container(
                          height: height / 12,
                          width: width / 1,
                          decoration: BoxDecoration(
                              border: Border.all(color: notifier.background),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: TabBar(
                              padding:
                              const EdgeInsets.only(left: 10, right: 10, top: 10),
                              controller: _tabController,
                              dividerColor: Colors.red,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              tabs: [
                                Tab(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Rankings",
                                          style: TextStyle(
                                              color:notifier.textColor, fontSize: 13,fontFamily: "Manrope-Bold"),
                                        ),
                                      ],
                                    )),
                                Tab(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Activity",
                                          style: TextStyle(
                                              color: notifier.textColor, fontSize: 13,fontFamily: "Manrope-Bold"),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(controller: _tabController, children: const [
              rankings(),
              Activity(),
            ])),);
  }
}
