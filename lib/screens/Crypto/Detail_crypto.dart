// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Project imports:
import '../../dark_mode.dart';
import '../config/common.dart';
import 'Portfolio_crypto.dart';

class Detail_crypto extends StatefulWidget {
  const Detail_crypto({super.key});

  @override
  State<Detail_crypto> createState() => _Detail_cryptoState();
}

class _Detail_cryptoState extends State<Detail_crypto> {
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
    ];
    _tooltip1 = TooltipBehavior(enable: true);
    super.initState();
  }

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
                size: 23, color: notifier.textFieldHintText),
          ),
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(20),
              const Text("Polygon (MATIC)",
                  style: TextStyle(fontSize: 14, color: Color(0xff64748B))),
              Row(
                children: [
                  Text(
                    " \$0.8269",
                    style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 32,
                        fontFamily: "Manrope-Bold"),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/polygon.png",
                    height: 56,
                    width: 56,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/Down_red_arrow.png",
                    height: 15,
                    width: 15,
                  ),
                  const Text(
                    " 0.54% (-1.20%)",
                    style: TextStyle(color: Color(0xffE82C81)),
                  ),
                  const Text(
                    " Past 24 Hours",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                ],
              ),
              AppConstants.Height(30),
              // Container(
              //   height: 266,
              //   width: 375,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage("assets/images/Chart.png"))),
              // ),
              cryptochart(),
              AppConstants.Height(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 0;
                      });
                    },
                    child: Container(
                      height: height / 20,
                      width: width / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 0
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
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
                      height: height / 20,
                      width: width / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 1
                            ? const Color(0xff6B39F4)
                            : notifier
                                .tabBar4, /*? Color(0xff6B39F4) : Color(0xffF8F9FD),*/
                      ),
                      child: Center(
                          child: Text("1W",
                              style: TextStyle(
                                  color: _index == 1
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff94A3B8),
                                  /*? notifier.tabBarText1
                                      : Colors.white,*/
                                  /* ? Colors.white
                                      : Color(0xff94A3B8),*/
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
                      height: height / 20,
                      width: width / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 2
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
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
                      height: height / 20,
                      width: width / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 3
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
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
                      height: height / 20,
                      width: width / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _index == 4
                            ? const Color(0xff6B39F4)
                            : notifier.tabBar4,
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
                    height: height / 20,
                    width: width / 8,
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
                        width: width / 2.4,
                        child: Row(
                          children: [
                            const Text("Open",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text("0.8321",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 44,
                        width: width / 2.4,
                        child: Row(
                          children: [
                            const Text("Volume",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
                            const Spacer(),
                            Text(" 220.00M",
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
                        width: width / 2.4,
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
                            Text("0.8393",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: width / 2.4,
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
                            Text(" 57.19M",
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
                        width: width / 2.4,
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
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: width / 2.4,
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
                        width: width / 2.4,
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: 0,
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
                            Text("101 - 188",
                                style: TextStyle(
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
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
                            const Text("PE Ratio",
                                style: TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",
                                    fontSize: 16)),
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
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Portfolio_crypto(),
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
                child: Text("Buy MATIC",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontFamily: "Manrope-Bold"))),
          ),
        ),
      ),
    );
  }

  Widget cryptochart() {
    return Container(
      // margin: const EdgeInsets.only(top: 0,bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
