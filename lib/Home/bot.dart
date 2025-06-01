import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import 'performance_screen.dart';

class Bot {
  final String name;
  final String description;
  final String winRate;
  final String profit;
  final String pair;
  final String strategy;
  final String riskLevel;
  final Color profitColor;

  Bot({
    required this.name,
    required this.description,
    required this.winRate,
    required this.profit,
    required this.pair,
    required this.strategy,
    required this.riskLevel,
    required this.profitColor,
  });
}

class BotScreen extends StatefulWidget {
  const BotScreen({super.key});

  @override
  State<BotScreen> createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> {
  ColorNotifire notifier = ColorNotifire();
  final TextEditingController _searchController = TextEditingController();

  final List<Bot> bots = [
    Bot(
      name: 'BTC Scalper Pro',
      description: 'High-frequency trading bot for BTC/USDT',
      winRate: '85%',
      profit: '+12.5%',
      pair: 'BTC/USDT',
      strategy: 'Scalping',
      riskLevel: 'Medium',
      profitColor: Colors.green,
    ),
    Bot(
      name: 'ETH Momentum',
      description: 'Momentum-based trading for ETH/USDT',
      winRate: '78%',
      profit: '+8.3%',
      pair: 'ETH/USDT',
      strategy: 'Momentum',
      riskLevel: 'Low',
      profitColor: Colors.green,
    ),
    Bot(
      name: 'SOL Trader',
      description: 'Volatility-based trading for SOL/USDT',
      winRate: '82%',
      profit: '+15.2%',
      pair: 'SOL/USDT',
      strategy: 'Volatility',
      riskLevel: 'High',
      profitColor: Colors.green,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
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
              'Trading Bots',
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: notifier.container.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: notifier.textColor.withOpacity(0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: notifier.textColor.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(
                  color: notifier.textColor,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Search bots...',
                  hintStyle: TextStyle(
                    color: notifier.textColor.withOpacity(0.5),
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: notifier.textColor.withOpacity(0.5),
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.clear_rounded,
                            color: notifier.textColor.withOpacity(0.5),
                          ),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {});
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildStatsCard(),
            const SizedBox(height: 16),
            ...bots.map((bot) => _buildBotCard(bot)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: notifier.textColor.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Total Bots', '${bots.length}'),
          _buildStatItem('Active Bots', '${bots.length}'),
          _buildStatItem('Total Profit', '+12.5%'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: notifier.textColor.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildBotCard(Bot bot) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notifier.container.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: notifier.textColor.withOpacity(0.1),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PerformanceScreen(
                  strategyName: bot.name,
                  winRate: bot.winRate,
                  price: bot.profit,
                  pnlColor: bot.profitColor,
                  volume: '24.5K',
                  roi: '12.5%',
                  strategyType: bot.strategy,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            color: bot.profitColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bot.profit,
                          style: TextStyle(
                            color: bot.profitColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBotMetric('Pair', bot.pair),
                    _buildBotMetric('Strategy', bot.strategy),
                    _buildBotMetric('Risk', bot.riskLevel),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBotMetric(String label, String value) {
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