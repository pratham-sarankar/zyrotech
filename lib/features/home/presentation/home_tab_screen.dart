// Flutter imports:
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Message%20&%20Notification/Notifications.dart';
import '../../bot/presentation/screen/bot_detail_screen.dart';
import 'package:crowwn/features/home/presentation/providers/bot_provider.dart';

import '../../../dark_mode.dart'; // Assuming Dark mode.dart is needed for theme colors

// Custom painter for the line chart
class LineChartPainter extends CustomPainter {
  final Color color;
  final bool isPositive;

  LineChartPainter({required this.color, required this.isPositive});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = color.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final path = Path();
    final width = size.width;
    final height = size.height;

    // Generate points for a more realistic trading pattern
    final points = <Offset>[];

    if (isPositive) {
      // Upward trend pattern with realistic fluctuations
      points.add(Offset(0, height * 0.7)); // Start
      points.add(Offset(width * 0.1, height * 0.65)); // Small dip
      points.add(Offset(width * 0.2, height * 0.75)); // Rise
      points.add(Offset(width * 0.3, height * 0.7)); // Correction
      points.add(Offset(width * 0.4, height * 0.6)); // Strong rise
      points.add(Offset(width * 0.5, height * 0.55)); // Small dip
      points.add(Offset(width * 0.6, height * 0.45)); // Rise
      points.add(Offset(width * 0.7, height * 0.5)); // Correction
      points.add(Offset(width * 0.8, height * 0.35)); // Rise
      points.add(Offset(width * 0.9, height * 0.3)); // Small dip
      points.add(Offset(width, height * 0.25)); // End higher
    } else {
      // Downward trend pattern with realistic fluctuations
      points.add(Offset(0, height * 0.3)); // Start
      points.add(Offset(width * 0.1, height * 0.35)); // Small rise
      points.add(Offset(width * 0.2, height * 0.25)); // Drop
      points.add(Offset(width * 0.3, height * 0.3)); // Correction
      points.add(Offset(width * 0.4, height * 0.4)); // Drop
      points.add(Offset(width * 0.5, height * 0.45)); // Small rise
      points.add(Offset(width * 0.6, height * 0.55)); // Drop
      points.add(Offset(width * 0.7, height * 0.5)); // Correction
      points.add(Offset(width * 0.8, height * 0.65)); // Drop
      points.add(Offset(width * 0.9, height * 0.7)); // Small rise
      points.add(Offset(width, height * 0.75)); // End lower
    }

    // Draw the path with smooth curves
    path.moveTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      final xc = (points[i].dx + points[i + 1].dx) / 2;
      final yc = (points[i].dy + points[i + 1].dy) / 2;
      path.quadraticBezierTo(points[i].dx, points[i].dy, xc, yc);
    }

    path.lineTo(points.last.dx, points.last.dy);

    // Draw the area below the line
    final fillPath = Path.from(path);
    fillPath.lineTo(width, height);
    fillPath.lineTo(0, height);
    fillPath.close();
    canvas.drawPath(fillPath, fillPaint);

    // Draw the main line
    canvas.drawPath(path, paint);

    // Draw entry and exit points
    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Entry point
    canvas.drawCircle(
      points[0],
      3,
      dotPaint,
    );
    canvas.drawCircle(
      points[0],
      3,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    // Exit point
    canvas.drawCircle(
      points.last,
      3,
      dotPaint,
    );
    canvas.drawCircle(
      points.last,
      3,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    // Draw arrows
    _drawArrow(canvas, points[0], isPositive ? -1 : 1, color);
    _drawArrow(canvas, points.last, isPositive ? -1 : 1, color);
  }

  void _drawArrow(Canvas canvas, Offset point, int direction, Color color) {
    final arrowPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final arrowPath = Path();
    final arrowSize = 8.0;
    final arrowHeight = 6.0;

    if (direction == 1) {
      arrowPath.moveTo(point.dx, point.dy - arrowSize);
      arrowPath.lineTo(
          point.dx - arrowHeight, point.dy - arrowSize + arrowHeight);
      arrowPath.lineTo(
          point.dx + arrowHeight, point.dy - arrowSize + arrowHeight);
    } else {
      arrowPath.moveTo(point.dx, point.dy + arrowSize);
      arrowPath.lineTo(
          point.dx - arrowHeight, point.dy + arrowSize - arrowHeight);
      arrowPath.lineTo(
          point.dx + arrowHeight, point.dy + arrowSize - arrowHeight);
    }
    arrowPath.close();
    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key, this.onSettingsTap}) : super(key: key);
  final VoidCallback? onSettingsTap;

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  ColorNotifire notifier = ColorNotifire();
  String selectedTimeFilter = "Trending";
  String selectedExchange = "Binance";

  @override
  void initState() {
    super.initState();
    // Fetch bots when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BotProvider>().fetchBots();
    });
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    final botProvider = Provider.of<BotProvider>(context, listen: true);

    // Get greeting based on current time
    String greeting = _getTimeBasedGreeting();

    // Show error via Snackbar if there's an error
    if (botProvider.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(botProvider.error!),
            backgroundColor: Colors.red,
          ),
        );
        botProvider.clearError();
      });
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            notifier.isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            notifier.isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: notifier.background,
        systemNavigationBarIconBrightness:
            notifier.isDark ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: notifier.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Modern Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundImage:
                                  AssetImage("assets/images/144.png"),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${greeting} 👋",
                                style: TextStyle(
                                  color:
                                      notifier.textColor.withValues(alpha: 0.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Pratham", // TODO: Replace with dynamic user name
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _modernIconButton(Icons.notifications_outlined),
                          const SizedBox(width: 10),
                          _modernIconButton(Icons.settings_outlined),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Balance & PnL Card
                  _balancePnlCard(notifier),
                  const SizedBox(height: 28),

                  // Broker Connection Status
                  _brokerStatusCard(notifier),
                  const SizedBox(height: 28),

                  // Strategies Section (Horizontal Scroll)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Strategies",
                        style: TextStyle(
                          color: notifier.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.trending_up, color: Color(0xff6B39F4)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _strategyCard(
                          name: "Bitcoin Alpha",
                          ticker: "BTC/USDT",
                          roi: "+12.5%",
                          color: Colors.purple,
                          isPositive: true,
                        ),
                        const SizedBox(width: 14),
                        _strategyCard(
                          name: "Ethereum Swing",
                          ticker: "ETH/USDT",
                          roi: "+7.2%",
                          color: Colors.blue,
                          isPositive: true,
                        ),
                        const SizedBox(width: 14),
                        _strategyCard(
                          name: "Solana Grid",
                          ticker: "SOL/USDT",
                          roi: "-2.3%",
                          color: Colors.orange,
                          isPositive: false,
                        ),
                        const SizedBox(width: 14),
                        _strategyCard(
                          name: "Cardano Boost",
                          ticker: "ADA/USDT",
                          roi: "+5.2%",
                          color: Colors.indigo,
                          isPositive: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Filter Tabs
                  _modernFilterTabs(),
                  const SizedBox(height: 20),

                  // Modern Bot List
                  if (botProvider.isLoading)
                    Column(
                      children:
                          List.generate(3, (index) => _buildShimmerBotCard()),
                    )
                  else if (botProvider.bots.isNotEmpty)
                    Column(
                      children: botProvider.bots
                          .map((bot) => _modernBotCard(bot, notifier))
                          .toList(),
                    )
                  else
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: notifier.container,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: notifier.textColor.withValues(alpha: 0.1)),
                      ),
                      child: Center(
                        child: Text(
                          'No bots available',
                          style: TextStyle(
                            color: notifier.textColor.withValues(alpha: 0.7),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Modern header icon button
  Widget _modernIconButton(IconData icon) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.notifications_outlined) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Notifications(),
            ),
          );
        } else if (icon == Icons.settings_outlined) {
          if (widget.onSettingsTap != null) {
            widget.onSettingsTap!();
          } else {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: notifier.container.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: notifier.textColor, size: 22),
      ),
    );
  }

  // Balance & PnL Card
  Widget _balancePnlCard(ColorNotifire notifier) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [Color(0xff6B39F4), Color(0xffA084E8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Balance",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$2,525.52", // TODO: Replace with dynamic balance
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.trending_up,
                          color: Colors.greenAccent, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "+4.2%",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 36,
            child: CustomPaint(
              painter: LineChartPainter(color: Colors.white, isPositive: true),
              size: const Size(double.infinity, 36),
            ),
          ),
        ],
      ),
    );
  }

  // Broker Connection Status Card
  Widget _brokerStatusCard(ColorNotifire notifier) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: notifier.container.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: notifier.textColor.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.account_balance_wallet,
                color: Color(0xff6B39F4), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Binance",
                  style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Connected Broker",
                  style: TextStyle(
                    color: notifier.textColor.withValues(alpha: 0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "Connected",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Modern horizontal strategy card
  Widget _strategyCard({
    required String name,
    required String ticker,
    required String roi,
    required Color color,
    required bool isPositive,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.85),
            color.withValues(alpha: 0.65)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.show_chart, color: Colors.white, size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  ticker,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? Colors.greenAccent : Colors.redAccent,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                roi,
                style: TextStyle(
                  color: isPositive ? Colors.greenAccent : Colors.redAccent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Modern filter tabs
  Widget _modernFilterTabs() {
    final tabs = ["Trending", "BTC/USDT", "XAU/USD", "Solana", "ETH/USDT"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) {
          final isSelected = selectedTimeFilter == tab;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTimeFilter = tab;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff6B39F4).withValues(alpha: 0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
                border: isSelected
                    ? Border.all(
                        color: const Color(0xff6B39F4).withValues(alpha: 0.3))
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getTabIcon(tab),
                    size: 15,
                    color: isSelected
                        ? const Color(0xff6B39F4)
                        : notifier.textColor.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    tab,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xff6B39F4)
                          : notifier.textColor.withValues(alpha: 0.7),
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Modern bot card
  Widget _modernBotCard(BotModel bot, ColorNotifire notifier) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BotDetailsScreen(
              bot: bot,
            ),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: notifier.textColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Icon(Icons.show_chart, color: Color(0xff6B39F4), size: 22),
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
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xff6B39F4).withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "High Frequency", // TODO: Replace with dynamic type
                            style: TextStyle(
                              color: Color(0xff6B39F4),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.trending_up, color: Colors.green, size: 15),
                        const SizedBox(width: 4),
                        Text(
                          "Win Rate: 78%", // TODO: Replace with dynamic win rate
                          style: TextStyle(
                            color: notifier.textColor.withValues(alpha: 0.7),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.attach_money, color: Colors.amber, size: 15),
                        const SizedBox(width: 2),
                        Text(
                          "\$1,878.80", // TODO: Replace with dynamic price
                          style: TextStyle(
                            color: notifier.textColor.withValues(alpha: 0.7),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _buildMetricChip("BTC/USDT", Icons.currency_exchange),
                        const SizedBox(width: 8),
                        _buildMetricChip("ROI: +12.5%", Icons.trending_up),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.trending_up,
                                  size: 14, color: Colors.green),
                              const SizedBox(width: 4),
                              Text(
                                "Profit",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: notifier.textColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: 14, color: notifier.textColor.withValues(alpha: 0.7)),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: notifier.textColor.withValues(alpha: 0.7),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerBotCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.show_chart,
                      color: notifier.textColor, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 16,
                              decoration: BoxDecoration(
                                color:
                                    notifier.textColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: notifier.textColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                              height: 9,
                              width: 40,
                              decoration: BoxDecoration(
                                color:
                                    notifier.textColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 12,
                        width: 80,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    height: 13,
                    width: 60,
                    decoration: BoxDecoration(
                      color: notifier.textColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 11,
                        width: 40,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 11,
                        width: 35,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          color: notifier.textColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 11,
                        width: 30,
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
          ],
        ),
      ),
    );
  }

  IconData _getTabIcon(String tabName) {
    switch (tabName) {
      case "Today":
        return Icons.today_outlined;
      case "This Week":
        return Icons.calendar_view_week;
      case "This Month":
        return Icons.calendar_month;
      case "This Year":
        return Icons.calendar_today;
      case "All Time":
        return Icons.history;
      default:
        return Icons.calendar_today;
    }
  }

  String _getTimeBasedGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
