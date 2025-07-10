import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bot_details_provider.dart';
import '../../../../utils/toast_utils.dart';

class BotDetailsTab extends StatefulWidget {
  const BotDetailsTab({super.key, required this.bot});
  final BotModel bot;
  @override
  State<BotDetailsTab> createState() => _BotDetailsTabState();
}

class _BotDetailsTabState extends State<BotDetailsTab>
    with WidgetsBindingObserver {
  ColorNotifire notifier = ColorNotifire();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Always refresh bot details when tab initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BotDetailsProvider>().loadBotDetails(widget.bot.id);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Refresh bot details when app becomes active
    if (state == AppLifecycleState.resumed) {
      context.read<BotDetailsProvider>().loadBotDetails(widget.bot.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Consumer<BotDetailsProvider>(
      builder: (context, botDetailsProvider, child) {
        return Scaffold(
          backgroundColor: notifier.background,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bot Info Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: notifier.tabBar1,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xff2e9844)
                                  .withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.smart_toy,
                              color: const Color(0xff2e9844),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.bot.name,
                                  style: TextStyle(
                                    color: notifier.textColor,
                                    fontSize: 20,
                                    fontFamily: "Manrope-Bold",
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Trading Bot',
                                  style: TextStyle(
                                    color: notifier.textColor
                                        .withValues(alpha: 0.7),
                                    fontSize: 14,
                                    fontFamily: "Manrope-Regular",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Subscription Status
                      if (botDetailsProvider.subscriptionStatus != null)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: notifier.background,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subscription Status',
                                    style: TextStyle(
                                      color: notifier.textColor,
                                      fontSize: 16,
                                      fontFamily: "Manrope-Bold",
                                    ),
                                  ),
                                  if (botDetailsProvider.isLoading)
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          const Color(0xff2e9844),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    botDetailsProvider.isSubscribed
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    color: botDetailsProvider.isSubscribed
                                        ? Colors.green
                                        : Colors.red,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    botDetailsProvider.isSubscribed
                                        ? 'Active Subscription'
                                        : 'Not Subscribed',
                                    style: TextStyle(
                                      color: botDetailsProvider.isSubscribed
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 14,
                                      fontFamily: "Manrope-Medium",
                                    ),
                                  ),
                                ],
                              ),
                              if (botDetailsProvider
                                      .subscriptionStatus!.subscription !=
                                  null) ...[
                                const SizedBox(height: 8),
                                Text(
                                  'Subscribed: ${_formatDate(botDetailsProvider.subscriptionStatus!.subscription!.subscribedAt)}',
                                  style: TextStyle(
                                    color: notifier.textColor
                                        .withValues(alpha: 0.7),
                                    fontSize: 12,
                                    fontFamily: "Manrope-Regular",
                                  ),
                                ),
                                if (botDetailsProvider.subscriptionStatus!
                                        .subscription!.cancelledAt !=
                                    null)
                                  Text(
                                    'Cancelled: ${_formatDate(botDetailsProvider.subscriptionStatus!.subscription!.cancelledAt!)}',
                                    style: TextStyle(
                                      color: notifier.textColor
                                          .withValues(alpha: 0.7),
                                      fontSize: 12,
                                      fontFamily: "Manrope-Regular",
                                    ),
                                  ),
                              ],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Bot Description
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: notifier.tabBar1,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About This Bot',
                        style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 18,
                          fontFamily: "Manrope-Bold",
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.bot.description,
                        style: TextStyle(
                          color: notifier.textColor.withValues(alpha: 0.8),
                          fontSize: 14,
                          fontFamily: "Manrope-Regular",
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Performance Overview
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: notifier.tabBar1,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Performance Overview',
                        style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 18,
                          fontFamily: "Manrope-Bold",
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Performance Metrics
                      if (botDetailsProvider.isLoadingPerformance)
                        _buildPerformanceShimmer()
                      else if (botDetailsProvider.performanceOverview !=
                          null) ...[
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Total Trades',
                                value: botDetailsProvider
                                    .performanceOverview!.totalTrades
                                    .toString(),
                                color: Colors.orange,
                                icon: Icons.swap_horiz,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Total Return',
                                value: botDetailsProvider
                                    .performanceOverview!.formattedTotalReturn,
                                color: botDetailsProvider
                                    .performanceOverview!.totalReturnColor,
                                icon: botDetailsProvider
                                    .performanceOverview!.totalReturnIcon,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Win Rate',
                                value: botDetailsProvider
                                    .performanceOverview!.formattedWinRate,
                                color: botDetailsProvider
                                    .performanceOverview!.winRateColor,
                                icon: botDetailsProvider
                                    .performanceOverview!.winRateIcon,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildMetricCard(
                                title: 'Profit Factor',
                                value: botDetailsProvider
                                    .performanceOverview!.formattedProfitFactor,
                                color: botDetailsProvider
                                    .performanceOverview!.profitFactorColor,
                                icon: botDetailsProvider
                                    .performanceOverview!.profitFactorIcon,
                              ),
                            ),
                          ],
                        ),
                      ] else if (botDetailsProvider.performanceError != null)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.red.withValues(alpha: 0.3)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.error_outline,
                                  color: Colors.red, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Failed to load performance data',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontFamily: "Manrope-Regular",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: notifier.textColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline,
                                  color:
                                      notifier.textColor.withValues(alpha: 0.7),
                                  size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'No performance data available',
                                  style: TextStyle(
                                    color: notifier.textColor
                                        .withValues(alpha: 0.7),
                                    fontSize: 14,
                                    fontFamily: "Manrope-Regular",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                // Add bottom padding for floating action button
                const SizedBox(height: 80),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: botDetailsProvider.isToggling
                ? null
                : () async {
                    final success = await botDetailsProvider
                        .toggleSubscription(widget.bot.id);
                    if (success) {
                      if (botDetailsProvider.isSubscribed) {
                        ToastUtils.showSuccess(
                          context: context,
                          message:
                              'Successfully subscribed to ${widget.bot.name}!',
                        );
                      } else {
                        ToastUtils.showInfo(
                          context: context,
                          message:
                              'Subscription cancelled for ${widget.bot.name}',
                        );
                      }
                    } else {
                      ToastUtils.showError(
                        context: context,
                        message: botDetailsProvider.error ??
                            'Failed to toggle subscription',
                      );
                    }
                  },
            backgroundColor: botDetailsProvider.isSubscribed
                ? Colors.red
                : const Color(0xff2e9844),
            icon: botDetailsProvider.isToggling
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Icon(
                    botDetailsProvider.isSubscribed
                        ? Icons.link_off
                        : Icons.link,
                    color: Colors.white,
                  ),
            label: Text(
              botDetailsProvider.isToggling
                  ? 'Processing...'
                  : botDetailsProvider.isSubscribed
                      ? 'Disconnect'
                      : 'Connect',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Manrope-Bold",
                fontSize: 16,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: notifier.textColor.withValues(alpha: 0.7),
                  fontSize: 12,
                  fontFamily: "Manrope-Regular",
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontFamily: "Manrope-Bold",
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Widget _buildPerformanceShimmer() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildShimmerMetricCard(),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildShimmerMetricCard(),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildShimmerMetricCard(),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildShimmerMetricCard(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShimmerMetricCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: notifier.textColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 60,
                height: 12,
                decoration: BoxDecoration(
                  color: notifier.textColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: 80,
            height: 18,
            decoration: BoxDecoration(
              color: notifier.textColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
