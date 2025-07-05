import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/models/signal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SignalCard extends StatelessWidget {
  const SignalCard({
    super.key,
    required this.signal,
  });
  final Signal signal;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ColorNotifire>(context);
    return GestureDetector(
      onTap: () {
        _showTradingDetailsBottomSheet(
          context: context,
          signal: signal,
          notifier: notifier,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
                    signal.bot?.name ?? "Bot",
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
                          text: signal.entryPrice.toStringAsFixed(2),
                          style: TextStyle(
                            color: notifier.textColorGrey,
                          ),
                        )
                      ],
                    ),
                    style: TextStyle(
                      color: signal.direction == "SHORT"
                          ? Colors.red
                          : const Color(0xff3794ff),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${signal.profitLoss.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: signal.profitLoss.isNegative
                        ? Colors.red
                        : Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (signal.entryTime != null)
                  Text(
                    DateFormat('dd MMM yyyy hh:mm:ss a')
                        .format(signal.entryTime!),
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

  void _showTradingDetailsBottomSheet({
    required BuildContext context,
    required Signal signal,
    required ColorNotifire notifier,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: notifier.background,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.3,
          maxChildSize: 0.5,
          expand: false,
          builder: (context, scrollController) {
            return Column(
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
                // Trade ID
                Text(
                  "#${signal.tradeId}",
                  style: TextStyle(
                    color: notifier.textColor.withValues(alpha: 0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top section with Pair, Action/Price, PnL, and Close Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    signal.bot?.name ?? 'Bot',
                                    style: TextStyle(
                                      color: notifier.textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
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
                                          text: signal.entryPrice
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                            color: notifier.textColorGrey,
                                          ),
                                        )
                                      ],
                                    ),
                                    style: TextStyle(
                                      color: signal.direction == "SHORT"
                                          ? Colors.red
                                          : const Color(0xff3794ff),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${signal.profitLoss.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: signal.profitLoss.isNegative
                                        ? Colors.red
                                        : Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (signal.entryTime != null)
                                  Text(
                                    DateFormat('dd MMM yyyy hh:mm:ss a')
                                        .format(signal.entryTime!),
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

                        if (signal.entryTime != null)
                          _buildDetailRow(
                            "Open time",
                            DateFormat('dd MMM yyyy hh:mm:ss a')
                                .format(signal.entryTime!),
                            notifier: notifier,
                          ),
                        _buildDetailRow(
                          "Open Price",
                          signal.entryPrice.toStringAsFixed(2),
                          notifier: notifier,
                        ),
                        if (signal.exitTime != null)
                          _buildDetailRow(
                            "Close time",
                            DateFormat('dd MMM yyyy hh:mm:ss a')
                                .format(signal.exitTime!),
                            notifier: notifier,
                          ),
                        if (signal.exitPrice != null)
                          _buildDetailRow(
                            "Close Price",
                            signal.exitPrice!.toStringAsFixed(2),
                            notifier: notifier,
                          ),
                        const SizedBox(height: 32),
                        // Close Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 204, 47, 47),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
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
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    required ColorNotifire notifier,
  }) {
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
