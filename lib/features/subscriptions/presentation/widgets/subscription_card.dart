import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/subscriptions/data/models/subscription_model.dart';
import 'package:crowwn/features/subscriptions/presentation/providers/subscriptions_provider.dart';

class SubscriptionCard extends StatelessWidget {
  final SubscriptionModel subscription;

  const SubscriptionCard({
    super.key,
    required this.subscription,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case 'active':
        return const Color(0xFF4CAF50);
      case 'cancelled':
        return const Color(0xFFF44336);
      default:
        return const Color(0xFF607D8B);
    }
  }

  String getStatusText(String status) {
    switch (status) {
      case 'active':
        return 'Active';
      case 'cancelled':
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorNotifire notifier = Provider.of<ColorNotifire>(context, listen: true);
    final formattedDate =
        DateFormat('MMM d, yyyy').format(subscription.subscribedAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notifier.container,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.getContainerBorder),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
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
                        color: getStatusColor(subscription.status)
                            .withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.smart_toy,
                        color: getStatusColor(subscription.status),
                        size: 28,
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
                                child: Text(
                                  subscription.bot.name,
                                  style: TextStyle(
                                    color: notifier.textColor,
                                    fontSize: 18,
                                    fontFamily: "Manrope-Bold",
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: getStatusColor(subscription.status)
                                      .withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: getStatusColor(subscription.status)
                                        .withValues(alpha: 0.3),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      subscription.status == 'active'
                                          ? Icons.check_circle
                                          : Icons.cancel,
                                      color:
                                          getStatusColor(subscription.status),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      getStatusText(subscription.status),
                                      style: TextStyle(
                                        color:
                                            getStatusColor(subscription.status),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        fontFamily: "Manrope-SemiBold",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            subscription.bot.description,
                            style: TextStyle(
                              color: notifier.textColor.withValues(alpha: 0.7),
                              fontSize: 14,
                              fontFamily: "Manrope-Regular",
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 16,
                                color:
                                    notifier.textColor.withValues(alpha: 0.5),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Subscribed: ',
                                style: TextStyle(
                                  color:
                                      notifier.textColor.withValues(alpha: 0.6),
                                  fontSize: 12,
                                  fontFamily: "Manrope-Regular",
                                ),
                              ),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 12,
                                  fontFamily: "Manrope-SemiBold",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (subscription.status == 'active') ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _showCancelDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withValues(alpha: 0.1),
                        foregroundColor: Colors.red,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              color: Colors.red.withValues(alpha: 0.3)),
                        ),
                      ),
                      child: const Text(
                        'Cancel Subscription',
                        style: TextStyle(
                          fontFamily: "Manrope-SemiBold",
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Subscription'),
          content: Text(
              'Are you sure you want to cancel your subscription to ${subscription.bot.name}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _cancelSubscription(context);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Yes, Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _cancelSubscription(BuildContext context) async {
    final provider = context.read<SubscriptionsProvider>();
    final success = await provider.cancelSubscription(subscription.id);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subscription cancelled successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.error ?? 'Failed to cancel subscription'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
