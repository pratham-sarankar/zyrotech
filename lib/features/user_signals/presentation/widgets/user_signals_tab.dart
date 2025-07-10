import 'package:crowwn/widgets/signal_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/user_signals/presentation/providers/user_signals_provider.dart';
import 'package:crowwn/features/bot/presentation/widgets/performance_overview_widget.dart';

class UserSignalsTab extends StatefulWidget {
  final String status; // 'opened' or 'closed'

  const UserSignalsTab({
    super.key,
    required this.status,
  });

  @override
  State<UserSignalsTab> createState() => _UserSignalsTabState();
}

class _UserSignalsTabState extends State<UserSignalsTab> {
  ColorNotifire notifier = ColorNotifire();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
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
      final userSignalsProvider = context.read<UserSignalsProvider>();
      if (userSignalsProvider.canLoadMore(widget.status)) {
        userSignalsProvider.loadMoreUserSignals(widget.status);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    return Consumer<UserSignalsProvider>(
      builder: (context, userSignalsProvider, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await userSignalsProvider.refreshUserSignals(widget.status);
          },
          child: _buildSignalList(userSignalsProvider),
        );
      },
    );
  }

  Widget _buildSignalList(UserSignalsProvider userSignalsProvider) {
    if (userSignalsProvider.isLoading(widget.status)) {
      return Center(
        child: CircularProgressIndicator(
          color: notifier.textColor,
        ),
      );
    }

    if (userSignalsProvider.getError(widget.status) != null) {
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
              userSignalsProvider.getError(widget.status)!,
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                userSignalsProvider.clearError(widget.status);
                userSignalsProvider.fetchUserSignals(widget.status);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final signals = userSignalsProvider.getSignals(widget.status);
    if (signals.isEmpty) {
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
              'No ${widget.status} signals found',
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You don\'t have any ${widget.status} signals yet.',
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
          _buildPerformanceCard(userSignalsProvider),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: signals.length +
                (userSignalsProvider.isLoadingMore(widget.status) ||
                        userSignalsProvider.canLoadMore(widget.status)
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (index == signals.length) {
                // Show loading indicator at the bottom
                return _buildLoadingMoreIndicator(
                    userSignalsProvider.isLoadingMore(widget.status));
              }
              final signal = signals[index];
              return SignalCard(signal: signal);
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

  Widget _buildPerformanceCard(UserSignalsProvider userSignalsProvider) {
    // If we have performance overview data from the API, use the new widget
    final performanceOverview =
        userSignalsProvider.getPerformanceOverview(widget.status);
    if (performanceOverview != null) {
      return PerformanceOverviewWidget(
        performanceOverview: performanceOverview,
      );
    }

    // Fallback to basic performance metrics if no overview data
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
              Row(
                children: [
                  Text(
                    'Performance Overview',
                    style: TextStyle(
                      color: notifier.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (userSignalsProvider.hasActiveFilters) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xff2e9844).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Filtered',
                        style: TextStyle(
                          color: const Color(0xff2e9844),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Text(
                '${userSignalsProvider.getCurrentPage(widget.status)}/${userSignalsProvider.getTotalPages(widget.status)}',
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
                  '\$${userSignalsProvider.getTotalPnL(widget.status).toStringAsFixed(2)}',
                  userSignalsProvider.getTotalPnL(widget.status) >= 0
                      ? Colors.green
                      : Colors.red),
              _buildPerformanceMetric(
                  'Win Rate',
                  '${userSignalsProvider.getWinRate(widget.status).toStringAsFixed(1)}%',
                  const Color(0xff2e9844)),
              _buildPerformanceMetric(
                  'Avg ROI',
                  '${userSignalsProvider.getAverageROI(widget.status).toStringAsFixed(2)}%',
                  const Color(0xff2e9844)),
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
}
