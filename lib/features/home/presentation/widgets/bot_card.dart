import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/bot/presentation/screen/bot_detail_screen.dart';
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:crowwn/screens/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotCard extends StatelessWidget {
  const BotCard({super.key, required this.bot});
  final BotModel bot;
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ColorNotifire>(context, listen: true);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BotDetailsScreen(bot: bot),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: notifier.container,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: notifier.textColor.withValues(alpha: 0.08)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifier.textColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.show_chart,
                        color: Color(0xff2e9844), size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                bot.name,
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xff2e9844)
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xff2e9844)
                                      .withValues(alpha: 0.3),
                                ),
                              ),
                              child: Text(
                                bot.group.name,
                                style: const TextStyle(
                                  color: Color(0xff2e9844),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppConstants.Height(4),
                        Text(
                          bot.description,
                          style: TextStyle(
                            color: notifier.textColor.withValues(alpha: 0.7),
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppConstants.Height(12),
              Row(
                children: [
                  _buildInfoChip(
                    icon: Icons.attach_money,
                    label: 'Minimum Capital',
                    value: '\$${bot.recommendedCapital}',
                    notifier: notifier,
                  ),
                  const SizedBox(width: 8),
                  _buildInfoChip(
                    icon: Icons.currency_exchange,
                    label: 'Script',
                    value: bot.script,
                    notifier: notifier,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required String value,
    required ColorNotifire notifier,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: notifier.textColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 15,
              color: notifier.textColor.withValues(alpha: 0.6),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: notifier.textColor.withValues(alpha: 0.5),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppConstants.Height(2),
                  Text(
                    value,
                    style: TextStyle(
                      color: notifier.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
