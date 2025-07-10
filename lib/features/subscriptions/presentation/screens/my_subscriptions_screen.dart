import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/subscriptions/presentation/providers/subscriptions_provider.dart';
import 'package:crowwn/features/subscriptions/presentation/widgets/subscription_card.dart';

class MySubscriptionsScreen extends StatefulWidget {
  const MySubscriptionsScreen({super.key});

  @override
  State<MySubscriptionsScreen> createState() => _MySubscriptionsScreenState();
}

class _MySubscriptionsScreenState extends State<MySubscriptionsScreen> {
  String selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    // Fetch subscriptions when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SubscriptionsProvider>()
          .fetchSubscriptions(status: selectedFilter);
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorNotifire notifier = Provider.of<ColorNotifire>(context, listen: true);
    final subscriptionsProvider =
        Provider.of<SubscriptionsProvider>(context, listen: true);

    // Show error via Snackbar if there's an error
    if (subscriptionsProvider.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(subscriptionsProvider.error!),
            backgroundColor: Colors.red,
          ),
        );
        subscriptionsProvider.clearError();
      });
    }

    return Scaffold(
      backgroundColor: notifier.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25, bottom: 10),
              child: Text(
                "My Subscriptions",
                style: TextStyle(
                  color: notifier.textColor,
                  fontFamily: "Manrope-Bold",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            // Filter Bar
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: notifier.tabBar1,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: notifier.getContainerBorder),
              ),
              child: Row(
                children: [
                  _buildFilterChip('all', 'All', notifier),
                  _buildFilterChip('active', 'Active', notifier),
                  _buildFilterChip('cancelled', 'Cancelled', notifier),
                ],
              ),
            ),
            // Subscriptions List
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await subscriptionsProvider.fetchSubscriptions(
                      status: selectedFilter);
                },
                child: subscriptionsProvider.isLoading
                    ? _buildShimmerList()
                    : subscriptionsProvider.subscriptions.isEmpty
                        ? _buildEmptyState(notifier)
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount:
                                subscriptionsProvider.subscriptions.length,
                            itemBuilder: (context, index) {
                              final subscription =
                                  subscriptionsProvider.subscriptions[index];
                              return SubscriptionCard(
                                  subscription: subscription);
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String filter, String label, ColorNotifire notifier) {
    final isSelected = selectedFilter == filter;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = filter;
          });
          // Fetch subscriptions for the selected filter
          context.read<SubscriptionsProvider>().fetchSubscriptions(
                status: filter == 'all' ? null : filter,
              );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xff2e9844).withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? const Color(0xff2e9844).withValues(alpha: 0.3)
                  : Colors.transparent,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xff2e9844)
                  : notifier.textColor.withValues(alpha: 0.7),
              fontSize: 14,
              fontFamily: isSelected ? "Manrope-Bold" : "Manrope-Regular",
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(ColorNotifire notifier) {
    String message;
    String subMessage;

    switch (selectedFilter) {
      case 'all':
        message = 'No subscriptions yet!';
        subMessage = 'Explore our bots and start your investment journey.';
        break;
      case 'active':
        message = 'No active subscriptions';
        subMessage = 'You don\'t have any active subscriptions at the moment.';
        break;
      case 'cancelled':
        message = 'No cancelled subscriptions';
        subMessage = 'You don\'t have any cancelled subscriptions.';
        break;
      default:
        message = 'No subscriptions found';
        subMessage = 'Try changing the filter or subscribe to a new bot.';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: 64,
            color: notifier.textColor.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              color: notifier.textColor,
              fontSize: 20,
              fontFamily: "Manrope-Bold",
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subMessage,
            style: TextStyle(
              color: notifier.textColor.withValues(alpha: 0.7),
              fontSize: 14,
              fontFamily: "Manrope-Regular",
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildShimmerCard();
      },
    );
  }

  Widget _buildShimmerCard() {
    ColorNotifire notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notifier.container,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.getContainerBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 18,
                              decoration: BoxDecoration(
                                color:
                                    notifier.textColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 80,
                            height: 24,
                            decoration: BoxDecoration(
                              color: notifier.textColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 14,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 14,
                        width: 120,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: notifier.textColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
