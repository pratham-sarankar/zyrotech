// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/screens/Gold/sell_buy_gold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:crowwn/screens/config/common.dart';

import '../../Dark mode.dart';
import 'Auto invest.dart';
import 'Loan_gold.dart';
import 'Reedem_gold.dart';

class Detail_gold extends StatefulWidget {
  const Detail_gold({super.key});

  @override
  State<Detail_gold> createState() => _Detail_goldState();
}

class _Detail_goldState extends State<Detail_gold> {
  late List<_ChartData1> data1;
  late TooltipBehavior _tooltip1;
  int index6 = 0;

  @override
  void initState() {
    data1 = [
      _ChartData1(5, 10),
      _ChartData1(10, 14),
      _ChartData1(15, 20),
      _ChartData1(17, 30),
      _ChartData1(30, 20),
      _ChartData1(40, 10),
      _ChartData1(49, 30),
      _ChartData1(55, 40),
      _ChartData1(70, 50),
      _ChartData1(80, 80),
      _ChartData1(90, 70),
    ];
    _tooltip1 = TooltipBehavior(enable: true);
    super.initState();
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
            scale: 2.9,
            color: notifier.textColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset("assets/images/bell-plus.png",
                height: 23, width: 23, color: notifier.textFieldHintText),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset("assets/images/receipt.png",
                height: 23, width: 23, color: notifier.textFieldHintText),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.star_border,
                color: notifier.textFieldHintText, size: 23),
          ),
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(20),
              const Text("Gold",
                  style: TextStyle(fontSize: 14, color: Color(0xff64748B))),
              Row(
                children: [
                  Text(
                    "\$87,65.00",
                    style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 32,
                        fontFamily: "Manrope-Bold"),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/gold_icon.png",
                    height: 56,
                    width: 56,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/up-arrow.png",
                    height: 15,
                    width: 15,
                  ),
                  const Text(
                    " 0.35% (+1.50%)",
                    style: TextStyle(color: Color(0xff1DCE5C)),
                  ),
                  const Text(
                    " Past 5 years",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                ],
              ),
              AppConstants.Height(30),
              goldchart(),
              AppConstants.Height(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index6 = 0;
                      });
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index6 == 0
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                      ),
                      child: Center(
                          child: Text("24H",
                              style: TextStyle(
                                  color: index6 == 0
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 14))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index6 = 1;
                      });
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index6 == 1
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                      ),
                      child: Center(
                          child: Text("1W",
                              style: TextStyle(
                                  color: index6 == 1
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 14))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index6 = 2;
                      });
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index6 == 2
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                      ),
                      child: Center(
                          child: Text("1M",
                              style: TextStyle(
                                  color: index6 == 2
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 14))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index6 = 3;
                      });
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index6 == 3
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                      ),
                      child: Center(
                          child: Text("1Y",
                              style: TextStyle(
                                  color: index6 == 3
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 14))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index6 = 4;
                      });
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index6 == 4
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                      ),
                      child: Center(
                          child: Text("ALL",
                              style: TextStyle(
                                  color: index6 == 4
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 14))),
                    ),
                  ),
                ],
              ),
              AppConstants.Height(20),
              Text(
                "Do more with gold",
                style: TextStyle(
                    fontSize: 17,
                    color: notifier.textColor,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(20),
              Container(
                height: 94,
                // width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: notifier.getContainerBorder)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Invest(),
                            ));
                      },
                      child: Column(
                        children: [
                          AppConstants.Height(20),
                          Image.asset("assets/images/refresh-circle.png",
                              height: 28, width: 28),
                          AppConstants.Height(10),
                          const Text(
                            "Auto Invest",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Invest(),
                            ));
                      },
                      child: Column(
                        children: [
                          AppConstants.Height(20),
                          Image.asset("assets/images/gift.png",
                              height: 28, width: 28),
                          AppConstants.Height(10),
                          const Text(
                            "Gifts",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loan(),
                            ));
                      },
                      child: Column(
                        children: [
                          AppConstants.Height(20),
                          Image.asset("assets/images/calendar.png",
                              height: 28, width: 28),
                          AppConstants.Height(10),
                          const Text(
                            "Loans",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Reedem(),
                            ));
                      },
                      child: Column(
                        children: [
                          AppConstants.Height(20),
                          Image.asset("assets/images/arrow-bar-up.png",
                              height: 28, width: 28),
                          AppConstants.Height(10),
                          const Text(
                            "Reedem",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(20),
              Text(
                "About Gold",
                style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 16,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(20),
              const Text(
                "Gold investment generally provides good\nprotection against dollar deprecation, and infla-\ntion and thus acts as a store of value.",
                style: TextStyle(
                    fontFamily: "Manrope-Regular",
                    fontSize: 16,
                    color: Color(0xff64748B)),
              ),
              AppConstants.Height(20),
              const Text(
                "View more",
                style: TextStyle(
                    color: Color(0xff6B39F4),
                    fontSize: 16,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Text("Market Overview",
                      style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 16,
                          fontFamily: "Manrope-Bold")),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(45),
                                    topRight: Radius.circular(45))),
                            isScrollControlled: true,
                            constraints: const BoxConstraints(
                                maxHeight: 480, maxWidth: 700, minHeight: 200),
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(30),
                                      ),
                                      color: notifier.background,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: Column(
                                        children: [
                                          AppConstants.Height(10),
                                          Row(
                                            children: [
                                              Text(
                                                "Market Overview",
                                                style: TextStyle(
                                                    color: notifier.textColor,
                                                    fontSize: 16,
                                                    fontFamily: "Manrope-Bold"),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Color(0xff94A3B8),
                                                    size: 20,
                                                  ))
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Close",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "87.65",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "High",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "88.00",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Low",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "87.00",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "52W Range",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "86.00 - 87.00",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Month",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "October 22",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Contract Size",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "100 Troy Ounces",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Settlement Type",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "Physical",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Settlement Day",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "12/28/2022",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                          Row(
                                            children: [
                                              const Text(
                                                "Last Rollover Day",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xff64748B)),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "07/31/2022",
                                                style: TextStyle(
                                                    color: notifier.textColor),
                                              )
                                            ],
                                          ),
                                          AppConstants.Height(5),
                                          Divider(
                                            color: notifier.getContainerBorder,
                                            thickness: 1,
                                          ),
                                          AppConstants.Height(5),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Text(
                        "View more",
                        style: TextStyle(
                            color: notifier.textColor,
                            fontSize: 15,
                            fontFamily: "Manrope-Bold"),
                      )),
                ],
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  const Text(
                    "Close",
                    style: TextStyle(fontSize: 15, color: Color(0xff64748B)),
                  ),
                  const Spacer(),
                  Text(
                    "87.65",
                    style: TextStyle(color: notifier.textColor, fontSize: 15),
                  )
                ],
              ),
              AppConstants.Height(5),
              Divider(
                color: notifier.getContainerBorder,
                thickness: 1,
              ),
              AppConstants.Height(5),
              Row(
                children: [
                  const Text(
                    "High",
                    style: TextStyle(fontSize: 15, color: Color(0xff64748B)),
                  ),
                  const Spacer(),
                  Text(
                    "88.00",
                    style: TextStyle(color: notifier.textColor, fontSize: 15),
                  )
                ],
              ),
              AppConstants.Height(5),
              Divider(
                color: notifier.getContainerBorder,
                thickness: 1,
              ),
              AppConstants.Height(5),
              Row(
                children: [
                  const Text(
                    "Low",
                    style: TextStyle(fontSize: 15, color: Color(0xff64748B)),
                  ),
                  const Spacer(),
                  Text(
                    "87.00",
                    style: TextStyle(color: notifier.textColor, fontSize: 15),
                  )
                ],
              ),
              AppConstants.Height(5),
              Divider(
                color: notifier.getContainerBorder,
                thickness: 1,
              ),
              AppConstants.Height(5),
              Row(
                children: [
                  const Text(
                    "52W Range",
                    style: TextStyle(fontSize: 15, color: Color(0xff64748B)),
                  ),
                  const Spacer(),
                  Text(
                    "86.00 - 87.00",
                    style: TextStyle(color: notifier.textColor, fontSize: 15),
                  )
                ],
              ),
              AppConstants.Height(5),
              Divider(
                color: notifier.getContainerBorder,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const sell_buy(),
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
              "Buy Gold",
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

  Widget goldchart() {
    return Container(
      // margin: const EdgeInsets.only(top: 0,bottom: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(
              isVisible: false,
            ),
            primaryYAxis: CategoryAxis(
              isVisible: false,
            ),
            backgroundColor: notifier.background,
            palette: const [
              Color(0xff1DCE5C),
            ],
            // primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 5),
            tooltipBehavior: _tooltip1,
            series: <CartesianSeries>[
              FastLineSeries<_ChartData1, double>(
                dataSource: data1,
                xValueMapper: (_ChartData1 data1, _) => data1.x,
                yValueMapper: (_ChartData1 data1, _) => data1.y,
                // animationDelay: 5,
                // animationDuration: 10,
                // markerSettings: MarkerSettings(borderColor: Colors.red)
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartData1 {
  _ChartData1(this.x, this.y);

  final double x;
  final double y;
}
