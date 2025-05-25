// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../Home/bottom.dart';

class rankings extends StatefulWidget {
  const rankings({super.key});

  @override
  State<rankings> createState() => _rankingsState();
}

class _rankingsState extends State<rankings> {
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

  List data1 = [
    {
      "image": "assets/images/Nemus.png",
      "name": "Nemus Genesis",
      "subtitle": "by Spacybox",
      "badge": "assets/images/up-arrow.png",
      "Eth": "217.3 ETH",
      "Et%": "53.9%",
    },
    {
      "image": "assets/images/Stories.png",
      "name": "Stories from JX",
      "subtitle": "by Andre Mix",
      "badge": "assets/images/up-arrow.png",
      "Eth": "209.0 ETH",
      "Et%": "153.0%",
    },
    {
      "image": "assets/images/Crystal.png",
      "name": "Crystal Doomed",
      "subtitle": "by Akarasaka",
      "badge": "assets/images/up-arrow.png",
      "Eth": "186.5 ETH",
      "Et%": "213.5%",
    },
    {
      "image": "assets/images/Expressions.png",
      "name": "Expressions",
      "subtitle": "by expression",
      "badge": "assets/images/up-arrow.png",
      "Eth": "168.5 ETH",
      "Et%": "17.4%",
    },
    {
      "image": "assets/images/Nemus.png",
      "name": "Nemus Genesis",
      "subtitle": "by Spacybox",
      "badge": "assets/images/up-arrow.png",
      "Eth": "217.3 ETH",
      "Et%": "53.9%",
    },
    {
      "image": "assets/images/Visionxxx.png",
      "name": "Visionxxx",
      "subtitle": "by Grondigen",
      "badge": "assets/images/up-arrow.png",
      "Eth": "128.2 ETH",
      "Et%": "153.0%",
    },
    {
      "image": "assets/images/Manuelaveux.png",
      "name": "Manuelaveux",
      "subtitle": "by alesiaLuxx",
      "badge": "assets/images/up-arrow.png",
      "Eth": "98.4 ETH",
      "Et%": "17.4%",
    },
  ];
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          isScrollControlled: true,
                          constraints: const BoxConstraints(
                              maxHeight: 550, maxWidth: 700, minHeight: 200),
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  height: 700,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: notifier.background,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15, top: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Category",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 16,
                                                  color: notifier.textColor,
                                                ),
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(10),
                                        Divider(
                                          thickness: 1,
                                          color: notifier.divider,
                                        ),
                                        AppConstants.Height(15),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value = !value;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "All Category",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 16,
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                  Colors.transparent,
                                                ),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                value: value,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      this.value = value!;
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(20),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value1 = !value1;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Art",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 16,
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                value: value1,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value1 = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(20),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value2 = !value2;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Collectibles",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 15,
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                  Colors.transparent,
                                                ),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                value: value2,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value2 = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(20),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value3 = !value3;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Domain Names",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 15,
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                  Colors.transparent,
                                                ),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                value: value3,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value3 = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(20),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value4 = !value4;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Music",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 15,
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                  Colors.transparent,
                                                ),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                value: value4,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value4 = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(20),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value5 = !value5;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Photography",
                                                style: TextStyle(
                                                  fontFamily: "Manrope-Bold",
                                                  fontSize: 15,
                                                  color: notifier.textColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                  Colors.transparent,
                                                ),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                    width: 1.0,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                value: value5,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value5 = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(20),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value6 = !value6;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Sports",
                                                style: TextStyle(
                                                    fontFamily: "Manrope-Bold",
                                                    fontSize: 15,
                                                    color: notifier.textColor),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                      width: 1.0,
                                                      color:
                                                          Colors.transparent),
                                                ),
                                                value: value6,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value6 = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        // AppConstants.Height(20),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              value7 = !value7;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Trading Card",
                                                style: TextStyle(
                                                    fontFamily: "Manrope-Bold",
                                                    fontSize: 15,
                                                    color: notifier.textColor),
                                              ),
                                              const Spacer(),
                                              Checkbox(
                                                fillColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                checkColor:
                                                    const Color(0xff6B39F4),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                      width: 1.0,
                                                      color:
                                                          Colors.transparent),
                                                ),
                                                value: value7,
                                                onChanged: (value) {
                                                  setState(() {
                                                    value7 = value!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        AppConstants.Height(30),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BottomBarScreen(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 56,
                                              // width: 340,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color:
                                                      const Color(0xff6B39F4)),
                                              child: const Center(
                                                  child: Text(
                                                "Apply",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        "Manrope-SemiBold",
                                                    fontSize: 16),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: notifier.getContainerBorder),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "All Category",
                                  style: TextStyle(
                                      color: notifier.textColor,
                                      fontSize: 14,
                                      fontFamily: "Manrope-Bold"),
                                ),
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_drop_down,
                                  color: Colors.grey.shade600),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // AppConstants.Width(20),
                    const Spacer(),
                    dropdownbuton(),
                  ],
                ),
              ),
              AppConstants.Height(10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data1.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      // width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: notifier.getContainerBorder, width: 1)),
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
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(data1[index]['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data1[index]['name'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor),
                                    ),
                                    AppConstants.Height(10),
                                    Text(data1[index]['subtitle'],
                                        style: const TextStyle(
                                            color: Color(0xff64748B),
                                            fontSize: 13)),
                                  ],
                                ),
                                AppConstants.Width(60),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      data1[index]['subtitle'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: notifier.textColor),
                                    ),
                                    AppConstants.Height(10),
                                    Row(
                                      children: [
                                        Image.asset(data1[index]['badge'],
                                            height: 10, width: 12),
                                        Text(
                                          data1[index]['Et%'],
                                          style: const TextStyle(
                                              color: Color(0xff1DCE5C),
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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

  Widget dropdownbuton({TextStyle? stl}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 2.4,
          decoration: BoxDecoration(
            border: Border.all(color: notifier.getContainerBorder),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: notifier.background,
            value: selectedOption,
            padding: const EdgeInsets.only(left: 10),
            items: mapvalue.map((e) {
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
                          style: TextStyle(
                              color: notifier.textColor, fontSize: 14)),
                    ],
                  ));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue;
              });
            },
            decoration: InputDecoration(
              hintText: 'All Price',
              hintStyle: TextStyle(
                  color: notifier.textColor,
                  fontFamily: "Manrope-Bold",
                  fontSize: 14),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
