// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Activity&History/Transaction Chart.dart';
import '../Activity&History/Transaction History.dart';
import '../Dark mode.dart';
import '../config/common.dart';
import 'bottom.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  bool _password = true;
  int _index = 0;
  ColorNotifire notifier = ColorNotifire();
  late List<_ChartData1> data1;
  late TooltipBehavior _tooltip1;

  @override
  void initState() {
    data1 = [
      _ChartData1(5, 20),
      _ChartData1(10, 40),
      _ChartData1(15, 10),
      _ChartData1(17, 15),
      _ChartData1(30, 40),
      _ChartData1(40, 20),
      _ChartData1(49, 60),
      _ChartData1(55, 80),
      _ChartData1(80, 100),
    ];
    _tooltip1 = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    final List<ChartData> chartData = [
      ChartData('', 80, const Color(0xff6B39F4)),
      ChartData('', 38, const Color(0xff0153FF)),
      ChartData('', 38, const Color(0xff1DCE5C)),
    ];
    return Scaffold(
      backgroundColor: const Color(0xff0F172A),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomBarScreen(),
              ),
            );
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: const Color(0xffFFFFFF),
          ),
        ),
        title: const Text("Portfolio",
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16)),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Trans_chart(),
                ),
              );
            },
            child: Image.asset(
              "assets/images/Portfolio.png",
              color: const Color(0xff64748B),
              scale: 3,
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Transaction(),
                ),
              );
            },
            child: Image.asset(
              "assets/images/receipt.png",
              scale: 3,
              color: const Color(0xff64748B),
            ),
          ),SizedBox(width: 10),
        ],
        backgroundColor: const Color(0xff0F172A),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total asset value",
                    style: TextStyle(
                        color: Color(0xff94A3B8),
                        fontSize: 15,
                        fontFamily: "Manrope-Regular"),
                  ),
                  AppConstants.Height(10),
                  Row(
                    children: [
                      _password
                          ? const Text(
                              "\$56,890.00",
                              style: TextStyle(
                                  fontSize: 32, color: Color(0xffFFFFFF)),
                            )
                          : const Text(
                              '  **********',
                              style: TextStyle(
                                  fontSize: 32, color: Color(0xffFFFFFF)),
                            ),
                      AppConstants.Width(10),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _password = !_password;
                            });
                          },
                          child: _password
                              ? const Icon(Icons.remove_red_eye_outlined,
                                  size: 24, color: Color(0xff94A3B8))
                              : const Icon(Icons.visibility_off_outlined,
                                  size: 24, color: Color(0xff94A3B8))),
                      // Expand
                      const Spacer(),
                      // Expanded(child: AppConstants.Width(90)),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 33,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff1DCE5C),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/up-arrow.png",
                                height: 15,
                                width: 15,
                                color: Colors.white,
                              ),
                              AppConstants.Width(5),
                              const Text(
                                "23.00%",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontFamily: "Manrope-Medium"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppConstants.Height(20),
                  portFolioChart(),
                  AppConstants.Height(20),
                  Container(
                    height: height / 17,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff64748B))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
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
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xff0F172A),
                                border: Border.all(
                                  width: 1,
                                  color: _index == 0
                                      ? const Color(0xff64748B)
                                      : const Color(0xff0F172A),
                                ),
                              ),
                              child: Center(
                                  child: Text("24H",
                                      style: TextStyle(
                                          color: _index == 0
                                              ? const Color(0xffFFFFFF)
                                              : const Color(0xff64748B),
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
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xff0F172A),
                                border: Border.all(
                                  width: 1,
                                  color: _index == 1
                                      ? const Color(0xff64748B)
                                      : const Color(0xff0F172A),
                                ),
                              ),
                              child: Center(
                                  child: Text("1W",
                                      style: TextStyle(
                                          color: _index == 1
                                              ? const Color(0xffFFFFFF)
                                              : const Color(0xff64748B),
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
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xff0F172A),
                                border: Border.all(
                                  width: 1,
                                  color: _index == 2
                                      ? const Color(0xff64748B)
                                      : const Color(0xff0F172A),
                                ),
                              ),
                              child: Center(
                                  child: Text("1M",
                                      style: TextStyle(
                                          color: _index == 2
                                              ? const Color(0xffFFFFFF)
                                              : const Color(0xff64748B),
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
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xff0F172A),
                                border: Border.all(
                                  width: 1,
                                  color: _index == 3
                                      ? const Color(0xff64748B)
                                      : const Color(0xff0F172A),
                                ),
                              ),
                              child: Center(
                                  child: Text("1Y",
                                      style: TextStyle(
                                          color: _index == 3
                                              ? const Color(0xffFFFFFF)
                                              : const Color(0xff64748B),
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
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xff0F172A),
                                border: Border.all(
                                  width: 1,
                                  color: _index == 4
                                      ? const Color(0xff64748B)
                                      : const Color(0xff0F172A),
                                ),
                              ),
                              child: Center(
                                  child: Text("ALL",
                                      style: TextStyle(
                                          color: _index == 4
                                              ? const Color(0xffFFFFFF)
                                              : const Color(0xff64748B),
                                          fontSize: 12,
                                          fontFamily: "Manrope-Bold"))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppConstants.Height(30),
                      const Text(
                        "Overview",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffFFFFFF),
                            fontFamily: "Manrope-Bold"),
                      ),
                      AppConstants.Height(20),
                      Container(
                        height: height / 4.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: notifier.textField,
                          border:
                              Border.all(color: notifier.textField, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.purpleAccent
                                            .withOpacity(0.1),
                                        image: DecorationImage(
                                            image: AssetImage(notifier.isDark
                                                ? "assets/images/crypto_dark.png"
                                                : "assets/images/Crypto.png"),
                                            scale: 3)),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Crypto",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: notifier.textColor,
                                              fontFamily: "Manrope-Bold",
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppConstants.Height(5),
                                      const Text("10 Assets",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 12,
                                              fontFamily: "Manrope-Regular")),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 42,
                                      width: 100,
                                      color: Colors.green),
                                ],
                              ),
                              AppConstants.Height(15),
                              Container(
                                height: 1,
                                width: 500,
                                color: notifier.getContainerBorder,
                              ),
                              AppConstants.Height(15),
                              const Row(
                                children: [
                                  Text(
                                    " Balance",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff64748B),
                                        fontFamily: "Manrope-Regular"),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Gain/Loss",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 12,
                                        fontFamily: "Manrope-Regular"),
                                  )
                                ],
                              ),
                              AppConstants.Height(5),
                              Row(
                                children: [
                                  Text("\$20,321.00",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: notifier.textColor)),
                                  const Spacer(),
                                  const Text(
                                    "+1,897.00",
                                    style: TextStyle(
                                        fontFamily: "Manrope-Bold",
                                        fontSize: 14,
                                        color: Color(0xff1DCE5C)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      AppConstants.Height(20),
                      Container(
                        height: height / 4.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: notifier.textField,
                          border:
                              Border.all(color: notifier.textField, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.purpleAccent
                                            .withOpacity(0.1),
                                        image: DecorationImage(
                                            image: AssetImage(notifier.isDark
                                                ? "assets/images/nft_dark.png"
                                                : "assets/images/NFTs.png"),
                                            scale: 3)),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "NFTs",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: notifier.textColor,
                                              fontFamily: "Manrope-Bold",
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppConstants.Height(5),
                                      const Text("8 Assets",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff64748B),
                                              fontSize: 12,
                                              fontFamily: "Manrope-Regular")),
                                    ],
                                  ),
                                  const Spacer(),
                                  Image.asset("assets/images/ABNB Chart.png",
                                      height: 42,
                                      width: 100,
                                      color: Colors.green),
                                ],
                              ),
                              AppConstants.Height(15),
                              Container(
                                height: 1,
                                width: 500,
                                color: notifier.getContainerBorder,
                              ),
                              AppConstants.Height(15),
                              const Row(
                                children: [
                                  Text(
                                    " Balance",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff64748B),
                                        fontFamily: "Manrope-Regular"),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Gain/Loss",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 12,
                                        fontFamily: "Manrope-Regular"),
                                  )
                                ],
                              ),
                              AppConstants.Height(5),
                              Row(
                                children: [
                                  Text(" \$5,687.99",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Manrope-Bold",
                                          color: notifier.textColor)),
                                  const Spacer(),
                                  const Text(
                                    " -567.00",
                                    style: TextStyle(
                                        fontFamily: "Manrope-Bold",
                                        fontSize: 14,
                                        color: Color(0xff1DCE5C)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      AppConstants.Height(20),
                      Row(
                        children: [
                          const Text(
                            "Asset Allocation",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffFFFFFF),
                                fontFamily: "Manrope-Bold"),
                          ),
                          AppConstants.Width(5),
                          Image.asset(
                            "assets/images/Alert_circle.png",
                            scale: 2.6,
                          )
                        ],
                      ),
                      AppConstants.Height(20),
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: notifier.textField,
                            border: Border.all(color: notifier.textField)),
                        child: SfCircularChart(
                          annotations: [
                            CircularChartAnnotation(
                                widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text("\$56,890.00",
                                        style: TextStyle(
                                            color: notifier.textColor,
                                            fontSize: 14,
                                            fontFamily: "Manrope-Bold")),
                                    const Text(" Your position",
                                        style: TextStyle(
                                            color: Color(0xff64748B),
                                            fontSize: 14,
                                            fontFamily: "Manrope-Regular")),
                                  ],
                                ),
                              ],
                            ))
                          ],
                          series: <CircularSeries>[
                            // Renders doughnut chart
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            AppConstants.Height(30),
          ],
        ),
      ),
    );
  }

  Widget portFolioChart() {
    return Container(
      decoration: const BoxDecoration(),
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
            backgroundColor: const Color(0xff0F172A),
            palette: const [
              Color(0xff6B39F4),
            ],
            // primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 5),
            tooltipBehavior: _tooltip1,
            series: <ChartSeries>[
              ColumnSeries<_ChartData1, double>(
                dataSource: data1,
                xValueMapper: (_ChartData1 data1, _) => data1.x,
                yValueMapper: (_ChartData1 data1, _) => data1.y,
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

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
