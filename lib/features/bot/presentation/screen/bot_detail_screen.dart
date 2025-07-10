// Flutter imports:
import 'package:crowwn/features/bot/presentation/screen/bot_details_tab.dart';
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/features/bot/presentation/screen/bot_signals_screen.dart';
import 'package:crowwn/features/bot/presentation/providers/bot_details_provider.dart';
import '../../../../dark_mode.dart';

class BotDetailsScreen extends StatefulWidget {
  final BotModel bot;

  const BotDetailsScreen({
    Key? key,
    required this.bot,
  }) : super(key: key);

  @override
  _BotDetailsScreenState createState() => _BotDetailsScreenState();
}

class _BotDetailsScreenState extends State<BotDetailsScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;
  ColorNotifire notifier = ColorNotifire();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Refresh subscription status when app becomes active
    if (state == AppLifecycleState.resumed) {
      context.read<BotDetailsProvider>().loadSubscriptionStatus(widget.bot.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    // Refresh subscription status when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context
            .read<BotDetailsProvider>()
            .loadSubscriptionStatus(widget.bot.id);
      }
    });

    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: notifier.textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.bot.name,
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: notifier.container.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff2e9844).withValues(alpha: 0.1),
                border: Border.all(
                    color: const Color(0xff2e9844).withValues(alpha: 0.3)),
              ),
              labelColor: const Color(0xff2e9844),
              unselectedLabelColor: notifier.textColor.withValues(alpha: 0.7),
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
                      Icon(Icons.analytics_outlined, size: 18),
                      const SizedBox(width: 8),
                      const Text('Details'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_active_outlined, size: 18),
                      const SizedBox(width: 8),
                      const Text('Signals'),
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
          // Details Tab
          BotDetailsTab(
            bot: widget.bot,
          ),
          // Signals Tab
          BotSignalsScreen(
            bot: widget.bot,
          ),
        ],
      ),
    );
  }
}
