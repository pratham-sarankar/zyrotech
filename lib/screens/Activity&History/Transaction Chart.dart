// ignore_for_file: file_names, camel_case_types

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Project imports:
import 'package:crowwn/screens/config/common.dart';
import '../../dark_mode.dart';
import 'History Report.dart';

class Trans_chart extends StatefulWidget {
  const Trans_chart({super.key});

  @override
  State<Trans_chart> createState() => _Trans_chartState();
}

class _Trans_chartState extends State<Trans_chart> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final List<ChartData> chartData = [
      ChartData('', 80, const Color(0xff6B39F4)),
      ChartData('', 38, const Color(0xff0153FF)),
      ChartData('', 38, const Color(0xff1DCE5C)),
    ];
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
        title: Center(
            child: Text("Details",
                style: TextStyle(fontSize: 16, color: notifier.textColor))),
        actions: [
          Image.asset(
            "assets/images/chart-bar.png",
            scale: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/receipt.png",
              height: 25,
              width: 25,
            ),
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
              Container(
                height: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: notifier.getContainerBorder)),
                child: Column(
                  children: [
                    SfCircularChart(
                      annotations: [
                        CircularChartAnnotation(
                            widget: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(" 1,590.00",
                                    style: TextStyle(
                                        color: Color(0xff0F172A),
                                        fontSize: 14,
                                        fontFamily: "Manrope-Bold")),
                                Text(" Total spent",
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
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          // cornerStyle: CornerStyle.bothCurve,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: height / 20,
                            width: width / 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: notifier.textField),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff6B39F4)),
                                  ),
                                  AppConstants.Width(5),
                                  Text(
                                    "Buy",
                                    style: TextStyle(
                                        color: notifier.textColor,
                                        fontSize: 12,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Width(5),
                                  const Text(
                                    "60%",
                                    style: TextStyle(
                                        color: Color(0xff94A3B8),
                                        fontSize: 12,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: height / 20,
                            width: width / 3.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: notifier.textField),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff0153FF)),
                                  ),
                                  AppConstants.Width(5),
                                  Text(
                                    "Send",
                                    style: TextStyle(
                                        color: notifier.textColor,
                                        fontSize: 12,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Width(5),
                                  const Text(
                                    "10%",
                                    style: TextStyle(
                                        color: Color(0xff94A3B8),
                                        fontSize: 12,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: height / 20,
                            width: width / 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: notifier.textField),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xff1DCE5C)),
                                  ),
                                  AppConstants.Width(5),
                                  Text(
                                    "Recevied",
                                    style: TextStyle(
                                        color: notifier.textColor,
                                        fontSize: 12,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                  AppConstants.Width(5),
                                  const Text(
                                    "30%",
                                    style: TextStyle(
                                        color: Color(0xff94A3B8),
                                        fontSize: 12,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(20),
              Text(
                "History",
                style: TextStyle(
                    fontFamily: "Manrope-Bold",
                    fontSize: 18,
                    color: notifier.textColor),
              ),
              AppConstants.Height(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const History_report(),
                      ));
                },
                child: Container(
                  height: height / 9.5,
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
                          children: [
                            const Image(
                                image: AssetImage("assets/images/cardano.png"),
                                height: 40,
                                width: 40),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sell ADA",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text("04:00 PM",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            const Spacer(),
                            Column(
                              children: [
                                const Text(
                                  "- 250",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xffE82C81),
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text(
                                  " 87.69",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const History_report(),
                      ));
                },
                child: Container(
                  height: height / 9.5,
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
                          children: [
                            const Image(
                                image: AssetImage("assets/images/cardano.png"),
                                height: 40,
                                width: 40),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Purchase ADA",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text("10 Sep at 02:00 PM",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  "+ 1,250",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text(
                                  " 105.00",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const History_report(),
                      ));
                },
                child: Container(
                  height: height / 9.5,
                  // width: 365,
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
                          children: [
                            const Image(
                                image: AssetImage("assets/images/amazon.png"),
                                height: 40,
                                width: 40),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Send (ADA)",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text("22 Aug at 10:00 AM",
                                    style: TextStyle(
                                        color: Color(0xff64748B),
                                        fontSize: 13)),
                              ],
                            ),
                            // AppConstants.Width(60),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  "- 2.00",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Height(10),
                                const Text(
                                  " 5.90",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppConstants.Height(20),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
