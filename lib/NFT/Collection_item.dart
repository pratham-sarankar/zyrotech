// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import '../config/common.dart';
import 'Activity.dart';
import 'Items.dart';

class Collec_item extends StatefulWidget {
  const Collec_item({super.key});

  @override
  State<Collec_item> createState() => _Collec_itemState();
}

class _Collec_itemState extends State<Collec_item>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            Image.asset("assets/images/arrow-narrow-left (1).png", scale: 3),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nemus Genesis",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff0F172A),
                    fontFamily: "Manrope-Bold")),
            AppConstants.Width(3),
            Image.asset(
              "assets/images/verification.png",
              width: 12,
              height: 12,
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.ios_share,
              color: Color(0xff0F172A),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          AppConstants.Height(10),
          Container(
            height: 55,
            width: 330,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF1F5F9)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: TabBar(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                      const Icon(Icons.grid_view_outlined,
                          color: Colors.black, size: 13),
                      AppConstants.Width(3),
                      const Text(
                        "Items",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      )
                    ],
                  )),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.trending_up,
                            color: Colors.black, size: 13),
                        AppConstants.Width(3),
                        const Text(
                          "Activity",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Items(),
                activity(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
