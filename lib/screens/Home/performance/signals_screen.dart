// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/models/signal.dart';
import 'package:crowwn/repositories/signal_repository.dart';
import 'package:provider/provider.dart';

class SignalsScreen extends StatefulWidget {
  const SignalsScreen({super.key});

  @override
  State<SignalsScreen> createState() => _SignalsScreenState();
}

class _SignalsScreenState extends State<SignalsScreen> {
  ColorNotifire notifier = ColorNotifire();
  final SignalRepository signalRepository = SignalRepository();
  bool isLoading = false;
  List<Signal> signals = [];

  @override
  void initState() {
    super.initState();
    _fetchSignals();
  }

  Future<void> _fetchSignals() async {
    setState(() {
      isLoading = true;
    });
    signals = await signalRepository.getSignalsByBotId('1');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildSignalList(),
    );
  }

  Widget _buildSignalList() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: notifier.textColor,
        ),
      );
    }

    if (signals.isEmpty) {
      return Center(
        child: Text(
          'No signals found',
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 16,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _buildPerformanceCard(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: signals.length,
              itemBuilder: (context, index) {
                final signal = signals[index];
                return _buildSignalItem(signal);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Overview',
            style: TextStyle(
              color: notifier.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPerformanceMetric(
                  'Total PnL', '\$100', const Color(0xff6B39F4)),
              _buildPerformanceMetric(
                  'Win Rate', '16%', const Color(0xff6B39F4)),
              _buildPerformanceMetric('ROI', '20%', const Color(0xff6B39F4)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetric(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: notifier.textColor.withValues(alpha: 0.7),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSignalItem(Signal signal) {
    return GestureDetector(
      onTap: () {
        _showTradingDetailsBottomSheet(signal: signal);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: notifier.container,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BTC/USDT',
                    style: TextStyle(
                      color: notifier.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      text: "${signal.direction == "SHORT" ? "Sell" : "Buy"}",
                      children: [
                        TextSpan(
                          text: " at ",
                          style: TextStyle(
                            color: notifier.textColor,
                          ),
                        ),
                        TextSpan(
                          text: signal.entryPrice.toString(),
                          style: TextStyle(
                            color: notifier.textColorGrey,
                          ),
                        )
                      ],
                    ),
                    style: TextStyle(
                      color: signal.direction == "SHORT"
                          ? Colors.red
                          : Color(0xff3794ff),
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
                  '\$${signal.profitAndLoss.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: signal.profitAndLoss.isNegative
                        ? Colors.red
                        : Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('dd MMM yyyy hh:mm:ss a').format(signal.entryTime),
                  style: TextStyle(
                    color: notifier.textColorGrey,
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

  void _showTradingDetailsBottomSheet({required Signal signal}) {
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
                color: notifier.textColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 10),
            // Order ID
            Text(
              "#915765224",
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
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
                                'ZBT BTC Scalper',
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text.rich(
                                TextSpan(
                                  text:
                                      "${signal.direction == "SHORT" ? "Sell" : "Buy"}",
                                  children: [
                                    TextSpan(
                                      text: " at ",
                                      style: TextStyle(
                                        color: notifier.textColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: signal.entryPrice.toString(),
                                      style: TextStyle(
                                        color: notifier.textColorGrey,
                                      ),
                                    )
                                  ],
                                ),
                                style: TextStyle(
                                  color: signal.direction == "SHORT"
                                      ? Colors.red
                                      : Color(0xff3794ff),
                                  fontSize: 12,
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
                            '\$${signal.profitAndLoss.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: signal.profitAndLoss.isNegative
                                  ? Colors.red
                                  : Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('dd MMM yyyy hh:mm:ss a')
                                .format(signal.entryTime),
                            style: TextStyle(
                              color: notifier.textColorGrey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Trading details list
                  _buildDetailRow(
                      "Open time",
                      DateFormat('dd MMM yyyy hh:mm:ss a')
                          .format(signal.entryTime)),
                  _buildDetailRow(
                      "Open Price", signal.entryPrice.toStringAsFixed(2)),
                  _buildDetailRow(
                      "Close time",
                      DateFormat('dd MMM yyyy hh:mm:ss a')
                          .format(signal.exitTime)),
                  _buildDetailRow(
                      "Close Price", signal.exitPrice.toStringAsFixed(2)),
                  _buildDetailRow("P&L Price",
                      "\$${signal.profitAndLoss.toStringAsFixed(2)}"),
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
              color: notifier.textColor.withValues(alpha: 0.7),
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
