
// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';
import '../Home/bottom.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  String? selectedOption;

  List mapvalue = [
    {
      "name": "ETH",
      "image": "assets/images/Ethereum blue.png",
    },
    {
      "name": "Crypto",
      "image": "assets/images/Ethereum blue.png",
    },
    {
      "name": "Bitcoin",
      "image": "assets/images/Ethereum blue.png",
    },
    {
      "name": "US",
      "image": "assets/images/Ethereum blue.png",
    },
  ];
  int selectIndex = 0;
  int SelectIndex = 0;
  List data = [
    {
      "image": "assets/images/Liquid.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis Artikulugis",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.500ETH",
      "Et1": "0.450ETH",
    },
    {
      "image": "assets/images/Genesis.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis #0011",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.100ETH",
      "Et1": "0.96ETH",
    },
    {
      "image": "assets/images/Genesis12.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis #0012",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.250ETH",
      "Et1": "0.190ETH",
    },
    {
      "image": "assets/images/Genesis_artiku.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis Artiku #01",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.500ETH",
      "Et1": "0.450ETH",
    },
    {
      "image": "assets/images/Genesis.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis Artikulugis",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.500ETH",
      "Et1": "0.450ETH",
    },
    {
      "image": "assets/images/Liquid.png",
      "name": "Nemus Genesis",
      "subtitle": "Genesis Artikulugis",
      "badge": "assets/images/verification.png",
      "label": "Price",
      "label1": "Current Bid",
      "Et": "0.500ETH",
      "Et1": "0.450ETH",
    },
  ];
  int selected = 0;
  bool items1 = true;
  bool items = true;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppConstants.Height(10),
              Row(
                children: [
                  Text("2,456 items",
                      style: TextStyle(
                          fontFamily: "Manrope-Bold",
                          color: notifier.textColor,
                          fontSize: 17)),
                  const Spacer(),
                  Image.asset(
                    "assets/images/Search.png",
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              AppConstants.Height(10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.9,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (_, index) {
                  return Container(
                    // height: MediaQuery.of(context).size.height / 10,
                    // width: 156,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: notifier.getContainerBorder)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              data[index]['image'],
                               height: height / 4.5,
                              // width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          AppConstants.Height(10),
                          Row(
                            children: [
                              Text(
                                data[index]['name'],
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Manrope-SemiBold",
                                  color: Color(0xff64748B),
                                ),
                              ),
                              AppConstants.Width(3),
                              Image.asset(
                                data[index]['badge'],
                                height: MediaQuery.of(context).size.height / 40,
                              )
                            ],
                          ),
                          Text(
                            data[index]['subtitle'],
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Manrope-Bold",
                                color: notifier.textColor),
                          ),
                          AppConstants.Height(10),
                          Container(
                            height: MediaQuery.of(context).size.height / 12.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: notifier.onboardBackgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  AppConstants.Height(5),
                                  Row(
                                    children: [
                                      Text(
                                        data[index]['label'],
                                        style: const TextStyle(
                                          fontSize: 9,
                                          color: Color(0xff64748B),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        data[index]['label1'],
                                        style: const TextStyle(
                                            fontSize: 9,
                                            color: Color(0xff64748B)),
                                      )
                                    ],
                                  ),
                                  AppConstants.Height(5),
                                  Row(
                                    children: [
                                      Text(
                                        data[index]['Et'],
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xff6B39F4),
                                            fontFamily: "Manrope-Bold"),
                                      ),
                                      const Spacer(),
                                      Text(
                                        data[index]['Et1'],
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: notifier.textColor,
                                            fontFamily: "Manrope-Bold"),
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xff0F172A),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              isScrollControlled: true,
              constraints:
                  const BoxConstraints(maxHeight: 530, maxWidth: 600, minHeight: 200),
              builder: (context) {
                return StatefulBuilder(builder: (context, setState) {
                  return Container(

                    // height: 700,
                    // width: double.infinity,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),),color: notifier.background,),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                      fontFamily: "Manrope-Bold",
                                      fontSize: 16,
                                      color: notifier.textColor),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.close_sharp,
                                    color: Color(0xff94A3B8),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: notifier.getContainerBorder,
                          ),
                          Text(
                            "Status",
                            style: TextStyle(
                                fontFamily: "Manrope-Bold",
                                fontSize: 15,
                                color: notifier.textColor),
                          ),
                          AppConstants.Height(15),
                          Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectIndex = 0;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 56,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectIndex == 0
                                            ? notifier.tabBar1
                                            : notifier.tabBar1,
                                        border: Border.all(
                                          color: selectIndex == 0
                                              ? const Color(0xff6B39F4)
                                              : Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "All",
                                          style: TextStyle(
                                              fontFamily: "Manrope-SemiBold",
                                              fontSize: 12,
                                              color: selectIndex == 0
                                                  ? const Color(0xff6B39F4)
                                                  : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppConstants.Width(10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectIndex = 1;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 83,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectIndex == 1
                                            ? notifier.tabBar1
                                            : notifier.tabBar1,
                                        border: Border.all(
                                          color: selectIndex == 1
                                              ? const Color(0xff6B39F4)
                                              : Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Buy now",
                                          style: TextStyle(
                                              fontFamily: "Manrope-SemiBold",
                                              fontSize: 12,
                                              color: selectIndex == 1
                                                  ? const Color(0xff6B39F4)
                                                  : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppConstants.Width(10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectIndex = 2;
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 123,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectIndex == 2
                                            ? notifier.tabBar1
                                            : notifier.tabBar1,
                                        border: Border.all(
                                          color: selectIndex == 2
                                              ? const Color(0xff6B39F4)
                                              : Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Open for Offers",
                                          style: TextStyle(
                                              fontFamily: "Manrope-SemiBold",
                                              fontSize: 12,
                                              color: selectIndex == 2
                                                  ? const Color(0xff6B39F4)
                                                  : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppConstants.Height(15),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectIndex = 4;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 113,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectIndex == 4
                                            ? notifier.tabBar1
                                            : notifier.tabBar1,
                                        border: Border.all(
                                          color: selectIndex == 4
                                              ? const Color(0xff6B39F4)
                                              : Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Live Auctions",
                                          style: TextStyle(
                                              fontFamily: "Manrope-SemiBold",
                                              fontSize: 12,
                                              color: selectIndex == 4
                                                  ? const Color(0xff6B39F4)
                                                  : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppConstants.Width(10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectIndex = 5;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 103,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectIndex == 5
                                            ? notifier.tabBar1
                                            : notifier.tabBar1,
                                        border: Border.all(
                                          color: selectIndex == 5
                                              ? const Color(0xff6B39F4)
                                              : Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Not for Sale",
                                          style: TextStyle(
                                              fontFamily: "Manrope-SemiBold",
                                              fontSize: 12,
                                              color: selectIndex == 5
                                                  ? const Color(0xff6B39F4)
                                                  : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppConstants.Height(20),
                          Text(
                            "Type",
                            style: TextStyle(
                              fontFamily: "Manrope-Bold",
                              fontSize: 15,
                              color: notifier.textColor,
                            ),
                          ),
                          AppConstants.Height(15),
                          Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        SelectIndex = 0;
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 156,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: SelectIndex == 0
                                            ? notifier.tabBar1
                                            : notifier.tabBar1,
                                        border: Border.all(
                                          color: SelectIndex == 0
                                              ? const Color(0xff6B39F4)
                                              : Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Multiple Editions",
                                        style: TextStyle(
                                            fontFamily: "Manrope-SemiBold",
                                            fontSize: 12,
                                            color: SelectIndex == 0
                                                ? const Color(0xff6B39F4)
                                                : Colors.grey),
                                      )),
                                    ),
                                  ),
                                  AppConstants.Width(10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          SelectIndex = 1;
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 156,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: SelectIndex == 1
                                              ? notifier.tabBar1
                                              : notifier.tabBar1,
                                          border: Border.all(
                                              color: SelectIndex == 1
                                                  ? const Color(0xff6B39F4)
                                                  : Colors.black
                                                      .withOpacity(0.1))),
                                      child: Center(
                                        child: Text(
                                          "Single Editions",
                                          style: TextStyle(
                                              fontFamily: "Manrope-SemiBold",
                                              fontSize: 12,
                                              color: SelectIndex == 1
                                                  ? const Color(0xff6B39F4)
                                                  : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppConstants.Height(20),
                          Text(
                            "Price Range",
                            style: TextStyle(
                                fontFamily: "Manrope-Bold",
                                fontSize: 15,
                                color: notifier.textColor),
                          ),
                          dropdownbuton(),
                          AppConstants.Height(10),
                          Row(
                            children: [
                              Container(
                                height: 48,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: notifier.tabBar2, /*border: Border.all(color: Color(0xff6B39F4))*/
                                ),
                                child: TextField(
                                  style: TextStyle(color: notifier.textColor),
                                  autocorrect: true,
                                  // textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(left: 55),

                                      border: OutlineInputBorder(

                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none),
                                    hintText: "Min",
                                    hintStyle: TextStyle(color: notifier.textColor)
                                  ),
                                ),
                              ),
                              AppConstants.Width(10),
                              const Text(
                                "to",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Manrope-SemiBold",
                                    color: Color(0xff64748B)),
                              ),
                              AppConstants.Width(10),
                              Container(
                                height: 48,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: notifier.tabBar2, /*border: Border.all(color: Color(0xff6B39F4))*/
                                ),
                                child: TextField(
                                  style: TextStyle(color: notifier.textColor),
                                  autocorrect: true,
                                  // textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.only(top: 19),
                                    contentPadding: const EdgeInsets.only(left: 55),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
                                    ),
                                    hintText: "Max",
                                    hintStyle: TextStyle(color: notifier.textColor)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppConstants.Height(17),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BottomBarScreen(),
                                  ));
                            },
                            child: Container(
                              height: 56,
                              // width: 327,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xff6B39F4)),
                              child: const Center(
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Manrope-SemiBold",
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          },
          label: const Text(
            "Filter",
            style: TextStyle(fontSize: 15),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Image(
              image: AssetImage("assets/images/Filter.png"),
              height: 14,
              width: 14,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget dropdownbuton({TextStyle? stle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: notifier.getContainerBorder),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: notifier.background,
            value: selectedOption,
            padding: const EdgeInsets.only(left: 10),
            items: mapvalue.map(
              (e) {
                return DropdownMenuItem<String>(
                  value: e["name"],
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: Image.asset(
                          e["image"],
                          scale: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(e["name"],
                          style: TextStyle(color: notifier.textColor, fontSize: 14)),
                    ],
                  ),
                );
              },
            ).toList(),
            onChanged: (String? newValue) {
              setState(
                () {
                  selectedOption = newValue;
                },
              );
            },
            decoration: InputDecoration(
              hintText: 'Select Price',
              hintStyle: TextStyle(color: notifier.textColor),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
