// Flutter imports:
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/models/signal.dart';
import 'package:crowwn/features/bot/presentation/providers/signals_provider.dart';

class BotSignalsScreen extends StatefulWidget {
  const BotSignalsScreen({super.key, required this.bot});
  final BotModel bot;
  @override
  State<BotSignalsScreen> createState() => _BotSignalsScreenState();
}

class _BotSignalsScreenState extends State<BotSignalsScreen> {
  ColorNotifire notifier = ColorNotifire();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Fetch signals for this specific bot
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SignalsProvider>().fetchSignalsByBotId(widget.bot.id);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final signalsProvider = context.read<SignalsProvider>();
      if (signalsProvider.canLoadMore) {
        signalsProvider.loadMoreSignals();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<SignalsProvider>(
        builder: (context, signalsProvider, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await signalsProvider.refreshSignals();
            },
            child: _buildSignalList(signalsProvider),
          );
        },
      ),
    );
  }

  Widget _buildSignalList(SignalsProvider signalsProvider) {
    if (signalsProvider.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: notifier.textColor,
        ),
      );
    }

    if (signalsProvider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading signals',
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              signalsProvider.error!,
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                signalsProvider.clearError();
                signalsProvider.fetchSignalsByBotId(widget.bot.id);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (signalsProvider.signals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_cellular_alt_outlined,
              color: notifier.textColor.withValues(alpha: 0.5),
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No signals found',
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This bot hasn\'t generated any signals yet.',
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        controller: _scrollController,
        children: [
          _buildPerformanceCard(signalsProvider),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: signalsProvider.signals.length +
                (signalsProvider.isLoadingMore || signalsProvider.canLoadMore
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (index == signalsProvider.signals.length) {
                // Show loading indicator at the bottom
                return _buildLoadingMoreIndicator(
                    signalsProvider.isLoadingMore);
              }
              final signal = signalsProvider.signals[index];
              return _buildSignalItem(signal);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingMoreIndicator(bool isLoadingMore) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoadingMore) ...[
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: notifier.textColor,
                ),
              ),
              const SizedBox(width: 12),
            ],
            Text(
              isLoadingMore
                  ? 'Loading more signals...'
                  : 'More signals available',
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceCard(SignalsProvider signalsProvider) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Performance Overview',
                style: TextStyle(
                  color: notifier.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${signalsProvider.currentPage}/${signalsProvider.totalPages}',
                style: TextStyle(
                  color: notifier.textColor.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPerformanceMetric(
                  'Total PnL',
                  '\$${signalsProvider.totalPnL.toStringAsFixed(2)}',
                  signalsProvider.totalPnL >= 0 ? Colors.green : Colors.red),
              _buildPerformanceMetric(
                  'Win Rate',
                  '${signalsProvider.winRate.toStringAsFixed(1)}%',
                  const Color(0xff6B39F4)),
              _buildPerformanceMetric(
                  'Avg ROI',
                  '${signalsProvider.averageROI.toStringAsFixed(2)}%',
                  const Color(0xff6B39F4)),
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
                    signal.bot?.name ?? widget.bot.name,
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
            // Trade ID
            Text(
              "#${signal.tradeId}",
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              signal.bot?.name ?? widget.bot.name,
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
                      "Signal time",
                      DateFormat('dd MMM yyyy hh:mm:ss a')
                          .format(signal.signalTime)),
                  _buildDetailRow(
                      "Open time",
                      DateFormat('dd MMM yyyy hh:mm:ss a')
                          .format(signal.entryTime)),
                  _buildDetailRow(
                      "Open Price", signal.entryPrice.toStringAsFixed(2)),
                  _buildDetailRow(
                      "Stop Loss", signal.stoploss.toStringAsFixed(2)),
                  _buildDetailRow(
                      "Target 1R", signal.target1r.toStringAsFixed(2)),
                  _buildDetailRow(
                      "Target 2R", signal.target2r.toStringAsFixed(2)),
                  _buildDetailRow(
                      "Close time",
                      DateFormat('dd MMM yyyy hh:mm:ss a')
                          .format(signal.exitTime)),
                  _buildDetailRow(
                      "Close Price", signal.exitPrice.toStringAsFixed(2)),
                  if (signal.exitReason != null)
                    _buildDetailRow("Exit Reason", signal.exitReason!),
                  _buildDetailRow(
                      "P&L", "\$${signal.profitLoss.toStringAsFixed(2)}"),
                  _buildDetailRow(
                      "P&L R", "${signal.profitLossR.toStringAsFixed(2)}%"),
                  _buildDetailRow("Trail Count", signal.trailCount.toString()),
                  const SizedBox(height: 32),

                  // Close Button
                  SizedBox(
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
