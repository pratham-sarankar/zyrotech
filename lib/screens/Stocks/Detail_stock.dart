// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Project imports:
import '../../dark_mode.dart';
import '../config/common.dart';
import 'Portfolio_stock.dart';

class Detail_stock extends StatefulWidget {
  const Detail_stock({super.key});

  @override
  State<Detail_stock> createState() => _Detail_stockState();
}

class _Detail_stockState extends State<Detail_stock> {
  int _index = 0;
  late List<_ChartData1> data1;
  late TooltipBehavior _tooltip1;
  ColorNotifire notifier = ColorNotifire();

  @override
  void initState() {
    // TODO: implement initState
    data1 = [
      _ChartData1(5, 10),
      _ChartData1(8, 20),
      _ChartData1(10, 3),
      _ChartData1(20, 40),
      _ChartData1(22, 10),
      _ChartData1(30, 30),
      _ChartData1(39, 60),
      _ChartData1(40, 20),
      _ChartData1(21, 80),
      _ChartData1(21, 80),
      _ChartData1(31, 30),
      _ChartData1(50, 50),
      _ChartData1(71, 20),
      _ChartData1(78, 50),
    ];
    _tooltip1 = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
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
                size: 23, color: notifier.textFieldHintText),
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
              const Text("Amazon, Inc (AMZN)",
                  style: TextStyle(fontSize: 14, color: Color(0xff64748B))),
              Row(
                children: [
                  Text(
                    "\$112,85.00",
                    style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 32,
                        fontFamily: "Manrope-Bold"),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/amazon.png",
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
                    " Past 24 Hours",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                ],
              ),
              AppConstants.Height(10),
              // Container(
              //   height: 266,
              //   width: 375,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage("assets/images/Chart.png"))),
              // ),
              cryptoChart(),
              AppConstants.Height(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 0;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 0
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                        // border: Border.all(
                        //   width: 1,
                        //   color: _index == 0
                        //       ? notifier.tabBar1
                        //       : notifier.tabBar2,
                        // ),
                      ),
                      child: Center(
                          child: Text("24H",
                              style: TextStyle(
                                  color: _index == 0
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold"))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 1;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 1
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                        // border: Border.all(
                        //   width: 1,
                        //   color: _index == 1
                        //       ? notifier.tabBar1
                        //       : notifier.tabBar2,
                        // ),
                      ),
                      child: Center(
                          child: Text("1W",
                              style: TextStyle(
                                  color: _index == 1
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold"))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 2;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 2
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                        // border: Border.all(
                        //   width: 1,
                        //   color: _index == 2
                        //       ? notifier.tabBar1
                        //       : notifier.tabBar2,
                        // ),
                      ),
                      child: Center(
                          child: Text("1M",
                              style: TextStyle(
                                  color: _index == 2
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold"))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 3;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 3
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                        // border: Border.all(
                        //   width: 1,
                        //   color: _index == 3
                        //       ? notifier.tabBar1
                        //       : notifier.tabBar2,
                        // ),
                      ),
                      child: Center(
                          child: Text("1Y",
                              style: TextStyle(
                                  color: _index == 3
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold"))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 4;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 4
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
                        // border: Border.all(
                        //   width: 1,
                        //   color: _index == 4
                        //       ? notifier.tabBar1
                        //       : notifier.tabBar2,
                        // ),
                      ),
                      child: Center(
                          child: Text("ALL",
                              style: TextStyle(
                                  color: _index == 4
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Bold"))),
                    ),
                  ),
                  Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: notifier.textFieldHintText)),
                    child:
                        Image.asset("assets/images/chart-line.png", scale: 2.6),
                  )
                ],
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Text(
                    "Market Statistics",
                    style: TextStyle(
                        fontSize: 17,
                        color: notifier.textColor,
                        fontFamily: "Manrope-Bold"),
                  ),
                  AppConstants.Width(5),
                  Image.asset(
                    "assets/images/question-circle-outlined.png",
                    scale: 4,
                    color: notifier.textFieldHintText,
                  ),
                ],
              ),
              AppConstants.Height(10),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 44,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Row(
                          children: [
                            const Text("Open",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text("119.0",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                      AppConstants.Width(20),
                      SizedBox(
                        height: 44,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Row(
                          children: [
                            const Text("Volume",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text("43.00M",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: notifier.getContainerBorder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text("High",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text("115.00",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                      AppConstants.Width(20),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: notifier.getContainerBorder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text("Avg. Vol",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text("57.19 M",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: notifier.getContainerBorder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text("Low",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text("110.00",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                      AppConstants.Width(20),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: notifier.getContainerBorder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text("Mkt. Cap",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text("1.118B",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: notifier.getContainerBorder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text("52W Range",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text(
                              "101 - 188",
                              style: TextStyle(
                                color: notifier.textColor,
                                fontFamily: "Manrope-Bold",
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppConstants.Width(20),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0.5,
                              color: notifier.getContainerBorder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "PE Ratio",
                              style: TextStyle(
                                color: Color(0xff64748B),
                                fontFamily: "Manrope-Regular",
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "98.85",
                              style: TextStyle(
                                color: notifier.textColor,
                                fontFamily: "Manrope-Bold",
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Portfolio(),
                ));
          },
          child: Container(
            height: 56,
            // width: 327,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff6B39F4),
            ),
            child: const Center(
              child: Text(
                "Buy AMZN",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                  fontFamily: "Manrope-Bold",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cryptoChart() {
    return Container(
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
                // isVisibleInLegend: false,
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
