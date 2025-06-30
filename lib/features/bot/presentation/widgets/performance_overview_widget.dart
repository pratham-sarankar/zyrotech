import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/models/signal.dart';

class PerformanceOverviewWidget extends StatefulWidget {
  final PerformanceOverview performanceOverview;

  const PerformanceOverviewWidget({
    super.key,
    required this.performanceOverview,
  });

  @override
  State<PerformanceOverviewWidget> createState() =>
      _PerformanceOverviewWidgetState();
}

class _PerformanceOverviewWidgetState extends State<PerformanceOverviewWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ColorNotifire>(context, listen: true);
    final overview = widget.performanceOverview;

    return Container(
      width: double.infinity,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header - Always visible
          InkWell(
            onTap: _toggleExpanded,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Performance icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: overview.isProfitable
                          ? Colors.green.withValues(alpha: 0.1)
                          : Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      overview.isProfitable
                          ? Icons.trending_up
                          : Icons.trending_down,
                      color: overview.isProfitable ? Colors.green : Colors.red,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Main performance info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Performance Overview',
                          style: TextStyle(
                            color: notifier.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Simplified layout without Flexible to avoid ListView conflicts
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Total P&L: ',
                                  style: TextStyle(
                                    color: notifier.textColorGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '\$${overview.totalPnL.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: overview.isProfitable
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Win Rate: ',
                                  style: TextStyle(
                                    color: notifier.textColorGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${overview.winRate.toStringAsFixed(1)}%',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Expand/collapse icon
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: notifier.textColorGrey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expandable content
          SizeTransition(
            sizeFactor: _animation,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Divider
                  Container(
                    height: 1,
                    color: notifier.textColor.withValues(alpha: 0.1),
                  ),
                  const SizedBox(height: 20),
                  // Performance metrics grid
                  _buildMetricsGrid(notifier, overview),
                  const SizedBox(height: 20),
                  // Additional details
                  _buildAdditionalDetails(notifier, overview),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid(
      ColorNotifire notifier, PerformanceOverview overview) {
    return Column(
      children: [
        // First row
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                notifier,
                'Total Signals',
                overview.totalSignals.toString(),
                Icons.analytics,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricCard(
                notifier,
                'Long Signals',
                overview.totalLongSignals.toString(),
                Icons.trending_up,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Second row
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                notifier,
                'Short Signals',
                overview.totalShortSignals.toString(),
                Icons.trending_down,
                Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricCard(
                notifier,
                'Loss Rate',
                '${overview.lossRate.toStringAsFixed(1)}%',
                Icons.warning,
                Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard(
    ColorNotifire notifier,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 14,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: notifier.textColorGrey,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: notifier.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalDetails(
      ColorNotifire notifier, PerformanceOverview overview) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDetailRow(
          notifier,
          'Highest Profit',
          '\$${overview.highestProfit.toStringAsFixed(2)}',
          Colors.green,
        ),
        const SizedBox(height: 12),
        _buildDetailRow(
          notifier,
          'Highest Loss',
          '\$${overview.highestLoss.toStringAsFixed(2)}',
          Colors.red,
        ),
        const SizedBox(height: 12),
        _buildDetailRow(
          notifier,
          'Consecutive Wins',
          overview.consecutiveWins.toString(),
          Colors.green,
        ),
        const SizedBox(height: 12),
        _buildDetailRow(
          notifier,
          'Consecutive Losses',
          overview.consecutiveLosses.toString(),
          Colors.red,
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    ColorNotifire notifier,
    String label,
    String value,
    Color valueColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              color: notifier.textColorGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
