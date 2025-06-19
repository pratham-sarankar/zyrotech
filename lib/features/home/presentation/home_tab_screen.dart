// Flutter imports:
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Message%20&%20Notification/Notifications.dart';
import '../../../screens/Home/performance/performance_screen.dart';
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
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  ColorNotifire notifier = ColorNotifire();
  String selectedTimeFilter = "Today";
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
                  // Top section with avatar and icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: notifier.textColor.withValues(alpha: 0.1),
                              width: 2),
                        ),
                        child: Image.asset("assets/images/144.png",
                            height: 44, width: 44),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // _buildIconButton(Icons.card_giftcard),
                          // const SizedBox(width: 16),
                          _buildIconButton(Icons.notifications_outlined),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Package name and Exchange section
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "ZyroBot",
                  //       style: TextStyle(
                  //         color: const Color(0xff6B39F4),
                  //         fontSize: 24,
                  //         fontWeight: FontWeight.w600,
                  //         letterSpacing: 0.5,
                  //         height: 1.2,
                  //       ),
                  //     ),
                  //     const SizedBox(height: 8),
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  //       decoration: BoxDecoration(
                  //         color: notifier.container.withValues(alpha:0.5),
                  //         borderRadius: BorderRadius.circular(12),
                  //         border: Border.all(color: notifier.textColor.withValues(alpha:0.1)),
                  //       ),
                  //       child: GestureDetector(
                  //         onTap: _showExchangeBottomSheet,
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Icon(
                  //               Icons.account_balance,
                  //               size: 16,
                  //               color: notifier.textColor.withValues(alpha:0.7),
                  //             ),
                  //             const SizedBox(width: 8),
                  //             Text(
                  //               "Exchange: $selectedExchange",
                  //               style: TextStyle(
                  //                 color: notifier.textColor.withValues(alpha:0.7),
                  //                 fontSize: 13,
                  //                 fontWeight: FontWeight.w500,
                  //                 height: 1.2,
                  //               ),
                  //             ),
                  //             const SizedBox(width: 4),
                  //             Icon(
                  //               Icons.keyboard_arrow_down,
                  //               size: 16,
                  //               color: notifier.textColor.withValues(alpha:0.7),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 16),

                  // PnL section
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Flexible(
                  //       child: Text(
                  //         "\$2,525.52",
                  //         style: TextStyle(
                  //           color: Colors.greenAccent,
                  //           fontSize: 36,
                  //           fontWeight: FontWeight.bold,
                  //           letterSpacing: 0.5,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     Padding(
                  //       padding: const EdgeInsets.only(bottom: 6),
                  //       child: Text(
                  //         "Today's PnL",
                  //         style: TextStyle(
                  //           color: notifier.textColor.withValues(alpha:0.7),
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 24),

                  // Broker connection status
                  // Container(
                  //   padding: const EdgeInsets.all(16),
                  //   decoration: BoxDecoration(
                  //     color: notifier.container.withValues(alpha:0.5),
                  //     borderRadius: BorderRadius.circular(16),
                  //     border: Border.all(
                  //         color: notifier.textColor.withValues(alpha:0.1)),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         padding: const EdgeInsets.all(8),
                  //         decoration: BoxDecoration(
                  //           color: notifier.textColor.withValues(alpha:0.1),
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //         child: Icon(Icons.account_balance,
                  //             color: notifier.textColor),
                  //       ),
                  //       const SizedBox(width: 16),
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               selectedExchange,
                  //               style: TextStyle(
                  //                 color: notifier.textColor,
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //               overflow: TextOverflow.ellipsis,
                  //             ),
                  //             const SizedBox(height: 4),
                  //             Text(
                  //               "Connected Broker",
                  //               style: TextStyle(
                  //                 color: notifier.textColor.withValues(alpha:0.7),
                  //                 fontSize: 12,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 12, vertical: 6),
                  //         decoration: BoxDecoration(
                  //           color: Colors.green.withValues(alpha:0.1),
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Container(
                  //               width: 8,
                  //               height: 8,
                  //               decoration: const BoxDecoration(
                  //                 color: Colors.green,
                  //                 shape: BoxShape.circle,
                  //               ),
                  //             ),
                  //             const SizedBox(width: 6),
                  //             Text(
                  //               "Connected",
                  //               style: TextStyle(
                  //                 color: Colors.green,
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 32),

                  // Strategies section
                  // Text(
                  //   "Strategies",
                  //   style: TextStyle(
                  //     color: notifier.textColor,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //     letterSpacing: 0.5,
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // SizedBox(
                  //   height: 200,
                  //   child: ListView(
                  //     clipBehavior: Clip.none,
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       _buildStrategyCard("Bitcoin", "BTC", "\$30,780",
                  //           "▲ 11.75%", Colors.purple),
                  //       const SizedBox(width: 12),
                  //       _buildStrategyCard("Binance", "BNB", "\$270.10",
                  //           "▲ 21.59%", Colors.green),
                  //       const SizedBox(width: 12),
                  //       _buildStrategyCard("Ethereum", "ETH", "\$1,478.10",
                  //           "▲ 4.7%", Colors.blue),
                  //       const SizedBox(width: 12),
                  //       _buildStrategyCard("Solana", "SOL", "\$98.45", "▼ 2.3%",
                  //           Colors.orange),
                  //       const SizedBox(width: 12),
                  //       _buildStrategyCard("Cardano", "ADA", "\$0.45", "▲ 5.2%",
                  //           Colors.indigo),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 32),

                  // Strategies Results section
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff6B39F4)
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(Icons.analytics_outlined,
                                      color: const Color(0xff6B39F4), size: 20),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "Strategies",
                                  style: TextStyle(
                                    color: notifier.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                            color: notifier.container.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color:
                                    notifier.textColor.withValues(alpha: 0.1)),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildResultTab("Trending",
                                    selectedTimeFilter == "Trending"),
                                _buildResultTab("BTC/USDT",
                                    selectedTimeFilter == "BTC/USDT"),
                                _buildResultTab(
                                    "XAU/USD", selectedTimeFilter == "XAU/USD"),
                                _buildResultTab(
                                    "Solana", selectedTimeFilter == "Solana"),
                                _buildResultTab("ETH/USDT",
                                    selectedTimeFilter == "ETH/USDT"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Display bots from API
                  if (botProvider.isLoading)
                    // Show shimmer loading for multiple bots
                    Column(
                      children:
                          List.generate(3, (index) => _buildShimmerBotCard()),
                    )
                  else if (botProvider.bots.isNotEmpty)
                    // Show all bots in a list
                    Column(
                      children: botProvider.bots
                          .map((bot) => _buildStrategyResultItem(
                                bot, // Use real bot name from API
                                "Win Rate: 78%",
                                "\$1,878.80",
                                Colors.green,
                                "BTC/USDT",
                                "ROI: +12.5%",
                                "High Frequency",
                              ))
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
                  // _buildStrategyResultItem(
                  //   "ETH/USDT Swing",
                  //   "Win Rate: 65%",
                  //   "\$1,245.60",
                  //   Colors.red,
                  //   "Volume: \$1.8M",
                  //   "ROI: -3.2%",
                  //   "Medium Term",
                  // ),
                  // _buildStrategyResultItem(
                  //   "BNB/USDT Grid",
                  //   "Win Rate: 82%",
                  //   "\$2,156.40",
                  //   Colors.green,
                  //   "Volume: \$3.2M",
                  //   "ROI: +15.8%",
                  //   "Automated",
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.notifications_outlined) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Notifications(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: notifier.container.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: notifier.textColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Icon(icon, color: notifier.textColor, size: 22),
      ),
    );
  }

  Widget _buildResultTab(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeFilter = text;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xff6B39F4).withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(
                  color: const Color(0xff6B39F4).withValues(alpha: 0.3))
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getTabIcon(text),
              size: 14,
              color: isSelected
                  ? const Color(0xff6B39F4)
                  : notifier.textColor.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xff6B39F4)
                    : notifier.textColor.withValues(alpha: 0.7),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
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

  // Widget _buildStrategyCard(
  //     String name, String ticker, String price, String change, Color color) {
  //   return Container(
  //     width: 160,
  //     decoration: BoxDecoration(
  //       color: notifier.container,
  //       borderRadius: BorderRadius.circular(16),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withValues(alpha: 0.05),
  //           blurRadius: 10,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(16),
  //         onTap: () {},
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               // Logo and Name Section
  //               Row(
  //                 children: [
  //                   Container(
  //                     padding: const EdgeInsets.all(8),
  //                     decoration: BoxDecoration(
  //                       color: color.withValues(alpha: 0.1),
  //                       borderRadius: BorderRadius.circular(12),
  //                     ),
  //                     child:
  //                         Icon(Icons.currency_bitcoin, size: 24, color: color),
  //                   ),
  //                   const SizedBox(width: 8),
  //                   Expanded(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           name,
  //                           style: TextStyle(
  //                             color: notifier.textColor,
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                           overflow: TextOverflow.ellipsis,
  //                         ),
  //                         Text(
  //                           ticker,
  //                           style: TextStyle(
  //                             color: notifier.textColor.withValues(alpha: 0.7),
  //                             fontSize: 13,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 16),

  //               // Line Chart Section
  //               Container(
  //                 height: 60,
  //                 decoration: BoxDecoration(
  //                   color: color.withValues(alpha: 0.05),
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //                 child: CustomPaint(
  //                   painter: LineChartPainter(
  //                     color: color,
  //                     isPositive: change.startsWith('▲'),
  //                   ),
  //                   size: const Size(double.infinity, 60),
  //                 ),
  //               ),
  //               const SizedBox(height: 16),

  //               // Price and Rate Section
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     flex: 3,
  //                     child: Text(
  //                       price,
  //                       style: TextStyle(
  //                         color: notifier.textColor,
  //                         fontSize: 14,
  //                         fontWeight: FontWeight.bold,
  //                         letterSpacing: 0.5,
  //                       ),
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ),
  //                   const SizedBox(width: 4),
  //                   Expanded(
  //                     flex: 3,
  //                     child: Container(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 4, vertical: 3),
  //                       decoration: BoxDecoration(
  //                         color: (change.startsWith('▲')
  //                                 ? Colors.green
  //                                 : Colors.red)
  //                             .withValues(alpha: 0.1),
  //                         borderRadius: BorderRadius.circular(6),
  //                       ),
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           Icon(
  //                             change.startsWith('▲')
  //                                 ? Icons.trending_up
  //                                 : Icons.trending_down,
  //                             size: 12,
  //                             color: change.startsWith('▲')
  //                                 ? Colors.green
  //                                 : Colors.red,
  //                           ),
  //                           const SizedBox(width: 2),
  //                           Flexible(
  //                             child: Text(
  //                               change,
  //                               style: TextStyle(
  //                                 color: change.startsWith('▲')
  //                                     ? Colors.green
  //                                     : Colors.red,
  //                                 fontSize: 10,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                               overflow: TextOverflow.ellipsis,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildStrategyResultItem(
    BotModel bot,
    String winRate,
    String price,
    Color pnlColor,
    String volume,
    String roi,
    String strategyType,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PerformanceScreen(
              bot: bot,
            ),
          ),
        );
      },
      child: Container(
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
                              child: Text(
                                bot.name,
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    notifier.textColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                strategyType,
                                style: TextStyle(
                                  color:
                                      notifier.textColor.withValues(alpha: 0.7),
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          winRate,
                          style: TextStyle(
                            color: notifier.textColor.withValues(alpha: 0.7),
                            fontSize: 12,
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
                      color: pnlColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      price,
                      style: TextStyle(
                        color: pnlColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
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
                  _buildMetricChip(volume, Icons.currency_exchange),
                  _buildMetricChip(roi, Icons.trending_up),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: pnlColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          pnlColor == Colors.green
                              ? Icons.trending_up
                              : Icons.trending_down,
                          size: 14,
                          color: pnlColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          pnlColor == Colors.green ? "Profit" : "Loss",
                          style: TextStyle(
                            color: pnlColor,
                            fontSize: 11,
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
      ),
    );
  }

  // Widget _buildActionButton(String text, IconData icon) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //     decoration: BoxDecoration(
  //       color: notifier.textColor.withValues(alpha: 0.05),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(icon,
  //             size: 14, color: notifier.textColor.withValues(alpha: 0.7)),
  //         const SizedBox(width: 4),
  //         Text(
  //           text,
  //           style: TextStyle(
  //             color: notifier.textColor.withValues(alpha: 0.7),
  //             fontSize: 11,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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

  // void _showExchangeBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: notifier.background,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (context) {
  //       return Container(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Broker API",
  //               style: TextStyle(
  //                 color: notifier.textColor,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             _buildExchangeOption("Binance", Icons.account_balance),
  //             const SizedBox(height: 12),
  //             _buildExchangeOption("Delta Exchange", Icons.account_balance),
  //             const SizedBox(height: 20),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildExchangeOption(String name, IconData icon) {
  //   final isSelected = selectedExchange == name;
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         selectedExchange = name;
  //       });
  //       Navigator.pop(context);
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //       decoration: BoxDecoration(
  //         color: isSelected
  //             ? const Color(0xff6B39F4).withValues(alpha: 0.1)
  //             : notifier.container.withValues(alpha: 0.5),
  //         borderRadius: BorderRadius.circular(12),
  //         border: Border.all(
  //           color: isSelected
  //               ? const Color(0xff6B39F4).withValues(alpha: 0.3)
  //               : notifier.textColor.withValues(alpha: 0.1),
  //         ),
  //       ),
  //       child: Row(
  //         children: [
  //           Icon(
  //             icon,
  //             size: 20,
  //             color: isSelected
  //                 ? const Color(0xff6B39F4)
  //                 : notifier.textColor.withValues(alpha: 0.7),
  //           ),
  //           const SizedBox(width: 12),
  //           Text(
  //             name,
  //             style: TextStyle(
  //               color:
  //                   isSelected ? const Color(0xff6B39F4) : notifier.textColor,
  //               fontSize: 16,
  //               fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
  //             ),
  //           ),
  //           const Spacer(),
  //           if (isSelected)
  //             Icon(
  //               Icons.check_circle,
  //               color: const Color(0xff6B39F4),
  //               size: 20,
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
}
