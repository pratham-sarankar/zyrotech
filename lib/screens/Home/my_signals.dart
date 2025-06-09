// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/models/bot.dart';
import 'package:crowwn/models/signal.dart';
import 'package:crowwn/screens/Home/performance/performance_screen.dart';
import '../../Dark mode.dart';

class MySignals extends StatefulWidget {
  const MySignals({super.key});

  @override
  State<MySignals> createState() => _MySignalsState();
}

class _MySignalsState extends State<MySignals>
    with SingleTickerProviderStateMixin {
  ColorNotifire notifier = ColorNotifire();
  late TabController _tabController;

  final List<Bot> bots = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                notifier.container.withOpacity(0.8),
                notifier.background,
              ],
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              'My Signals',
              style: TextStyle(
                color: notifier.textColor,
                fontFamily: 'Manrope_bold',
                fontSize: 24,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${bots.length} Active Bots',
              style: TextStyle(
                color: notifier.textColor.withOpacity(0.7),
                fontSize: 14,
                fontFamily: 'Manrope',
              ),
            ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              color: notifier.container.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: notifier.textColor.withOpacity(0.1)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff6B39F4).withOpacity(0.1),
                border:
                    Border.all(color: const Color(0xff6B39F4).withOpacity(0.3)),
              ),
              labelColor: const Color(0xff6B39F4),
              unselectedLabelColor: notifier.textColor.withOpacity(0.7),
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.radio_button_checked, size: 18),
                      const SizedBox(width: 8),
                      const Text('Open'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: 18),
                      const SizedBox(width: 8),
                      const Text('Closed'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Open Signals Tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: bots.map((bot) => _buildBotCard(bot, false)).toList(),
            ),
          ),
          // Closed Signals Tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: bots.map((bot) => _buildBotCard(bot, true)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBotCard(Bot bot, bool showClosed) {
    final filteredSignals =
        bot.signals.where((signal) => signal.isClosed == showClosed).toList();
    if (filteredSignals.isEmpty) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        _showTradingDetailsBottomSheet(
          name: bot.name,
          winRate: bot.winRate,
          price: bot.profit,
          pnlColor: Colors.blue,
          volume: 'volume',
          roi: 'roi',
          strategyType: 'strategyType',
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: notifier.container.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: notifier.textColor.withOpacity(0.1),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bot.name,
                    style: TextStyle(
                      color: notifier.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bot.description,
                    style: TextStyle(
                      color: notifier.textColor.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  bot.winRate,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bot.profit,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignalItem(Signal signal) {
    //Temp
    return Container();
    // return Container(
    //   margin: const EdgeInsets.only(bottom: 12),
    //   padding: const EdgeInsets.all(16),
    //   decoration: BoxDecoration(
    //     color: notifier.background,
    //     borderRadius: BorderRadius.circular(12),
    //     border: Border.all(
    //       color: notifier.textColor.withOpacity(0.1),
    //       width: 1,
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             signal.pair,
    //             style: TextStyle(
    //               color: notifier.textColor,
    //               fontSize: 14,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    //             decoration: BoxDecoration(
    //               color: signal.typeColor.withOpacity(0.1),
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: Text(
    //               signal.type,
    //               style: TextStyle(
    //                 color: signal.typeColor,
    //                 fontSize: 12,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(height: 12),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           _buildSignalMetric('Entry', signal.entryPrice),
    //           _buildSignalMetric('Target', signal.targetPrice),
    //           _buildSignalMetric('Stop Loss', signal.stopLoss),
    //         ],
    //       ),
    //       const SizedBox(height: 12),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             signal.timeAgo,
    //             style: TextStyle(
    //               color: notifier.textColor.withOpacity(0.7),
    //               fontSize: 12,
    //             ),
    //           ),
    //           Text(
    //             'Risk: ${signal.riskLevel}',
    //             style: TextStyle(
    //               color: Colors.orange,
    //               fontSize: 12,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildSignalMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: notifier.textColor.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _showTradingDetailsBottomSheet({
    required String name,
    required String winRate,
    required String price,
    required Color pnlColor,
    required String volume,
    required String roi,
    required String strategyType,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: notifier.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle bar
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: notifier.textColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 10),
            // Order ID
            Text(
              "#915765224",
              style: TextStyle(
                color: notifier.textColor.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top section with Pair, Action/Price, PnL, and Close Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Buy 0.01 at 3294.554",
                                style: TextStyle(
                                  color: notifier.textColor.withOpacity(0.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "+\$29.83 USD",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "3324.381",
                            style: TextStyle(
                              color: notifier.textColor.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Trading details list
                  _buildDetailRow("Open time", "30 May 2025 10:45:00 pm"),
                  _buildDetailRow("Open Price", "3294.554"),
                  _buildDetailRow("Close time", "2 Jun 2025 11:15:25 am"),
                  _buildDetailRow("Close Price", "3324.381"),
                  _buildDetailRow("P&L Price", "--"),
                  const SizedBox(height: 32),

                  // View Chart Button
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 204, 47, 47),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Close",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: notifier.textColor.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: notifier.textColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
