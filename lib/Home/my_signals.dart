import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';

class Signal {
  final String pair;
  final String type;
  final String entryPrice;
  final String targetPrice;
  final String stopLoss;
  final String timeAgo;
  final String riskLevel;
  final Color typeColor;
  final bool isClosed;

  Signal({
    required this.pair,
    required this.type,
    required this.entryPrice,
    required this.targetPrice,
    required this.stopLoss,
    required this.timeAgo,
    required this.riskLevel,
    required this.typeColor,
    required this.isClosed,
  });
}

class Bot {
  final String name;
  final String description;
  final String winRate;
  final String profit;
  final List<Signal> signals;

  Bot({
    required this.name,
    required this.description,
    required this.winRate,
    required this.profit,
    required this.signals,
  });
}

class MySignals extends StatefulWidget {
  const MySignals({super.key});

  @override
  State<MySignals> createState() => _MySignalsState();
}

class _MySignalsState extends State<MySignals> with SingleTickerProviderStateMixin {
  ColorNotifire notifier = ColorNotifire();
  late TabController _tabController;

  final List<Bot> bots = [
    Bot(
      name: 'BTC Scalper Pro',
      description: 'High-frequency trading bot for BTC/USDT',
      winRate: '85%',
      profit: '+12.5%',
      signals: [
        Signal(
          pair: 'BTC/USDT',
          type: 'BUY',
          entryPrice: '\$45,250',
          targetPrice: '\$46,500',
          stopLoss: '\$44,800',
          timeAgo: '2 hours ago',
          riskLevel: 'Medium',
          typeColor: Colors.green,
          isClosed: false,
        ),
        Signal(
          pair: 'BTC/USDT',
          type: 'SELL',
          entryPrice: '\$48,250',
          targetPrice: '\$47,500',
          stopLoss: '\$49,000',
          timeAgo: '2 days ago',
          riskLevel: 'Medium',
          typeColor: Colors.red,
          isClosed: true,
        ),
      ],
    ),
    Bot(
      name: 'ETH Momentum',
      description: 'Momentum-based trading for ETH/USDT',
      winRate: '78%',
      profit: '+8.3%',
      signals: [
        Signal(
          pair: 'ETH/USDT',
          type: 'SELL',
          entryPrice: '\$2,850',
          targetPrice: '\$2,750',
          stopLoss: '\$2,950',
          timeAgo: '4 hours ago',
          riskLevel: 'Low',
          typeColor: Colors.red,
          isClosed: false,
        ),
        Signal(
          pair: 'ETH/USDT',
          type: 'BUY',
          entryPrice: '\$2,650',
          targetPrice: '\$2,850',
          stopLoss: '\$2,550',
          timeAgo: '3 days ago',
          riskLevel: 'Low',
          typeColor: Colors.green,
          isClosed: true,
        ),
      ],
    ),
    Bot(
      name: 'SOL Trader',
      description: 'Volatility-based trading for SOL/USDT',
      winRate: '82%',
      profit: '+15.2%',
      signals: [
        Signal(
          pair: 'SOL/USDT',
          type: 'BUY',
          entryPrice: '\$98.50',
          targetPrice: '\$102.00',
          stopLoss: '\$96.00',
          timeAgo: '1 hour ago',
          riskLevel: 'High',
          typeColor: Colors.green,
          isClosed: false,
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                notifier.container.withOpacity(0.8),
                notifier.background,
              ],
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              'My Signals',
              style: TextStyle(
                color: notifier.textColor,
                fontFamily: 'Manrope_bold',
                fontSize: 24,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${bots.length} Active Bots',
              style: TextStyle(
                color: notifier.textColor.withOpacity(0.7),
                fontSize: 14,
                fontFamily: 'Manrope',
              ),
            ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              color: notifier.container.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: notifier.textColor.withOpacity(0.1)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff6B39F4).withOpacity(0.1),
                border: Border.all(color: const Color(0xff6B39F4).withOpacity(0.3)),
              ),
              labelColor: const Color(0xff6B39F4),
              unselectedLabelColor: notifier.textColor.withOpacity(0.7),
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
                      Icon(Icons.radio_button_checked, size: 18),
                      const SizedBox(width: 8),
                      const Text('Open'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, size: 18),
                      const SizedBox(width: 8),
                      const Text('Closed'),
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
          // Open Signals Tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: bots.map((bot) => _buildBotCard(bot, false)).toList(),
            ),
          ),
          // Closed Signals Tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: bots.map((bot) => _buildBotCard(bot, true)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBotCard(Bot bot, bool showClosed) {
    final filteredSignals = bot.signals.where((signal) => signal.isClosed == showClosed).toList();
    if (filteredSignals.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notifier.container.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: notifier.textColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: const EdgeInsets.all(16),
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bot.name,
                    style: TextStyle(
                      color: notifier.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bot.description,
                    style: TextStyle(
                      color: notifier.textColor.withOpacity(0.7),
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
                  bot.winRate,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bot.profit,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          const Divider(),
          const SizedBox(height: 8),
          ...filteredSignals.map((signal) => _buildSignalItem(signal)).toList(),
        ],
      ),
    );
  }

  Widget _buildSignalItem(Signal signal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: notifier.textColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                signal.pair,
                style: TextStyle(
                  color: notifier.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: signal.typeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  signal.type,
                  style: TextStyle(
                    color: signal.typeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSignalMetric('Entry', signal.entryPrice),
              _buildSignalMetric('Target', signal.targetPrice),
              _buildSignalMetric('Stop Loss', signal.stopLoss),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                signal.timeAgo,
                style: TextStyle(
                  color: notifier.textColor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
              Text(
                'Risk: ${signal.riskLevel}',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignalMetric(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: notifier.textColor.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
} 