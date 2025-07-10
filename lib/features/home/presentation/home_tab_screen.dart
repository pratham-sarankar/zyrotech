// Flutter imports:
import 'package:crowwn/features/brokers/presentation/providers/binance_provider.dart';
import 'package:crowwn/features/brokers/presentation/providers/delta_provider.dart';
import 'package:crowwn/features/brokers/presentation/screens/brokers_screen.dart';
import 'package:crowwn/features/brokers/domain/models/binance_balance.dart';
import 'package:crowwn/features/brokers/domain/models/delta_balance.dart';
import 'package:crowwn/features/home/presentation/widgets/bot_card.dart';
import 'package:crowwn/features/groups/presentation/providers/groups_provider.dart';
import 'package:crowwn/features/groups/data/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/screens/Message%20&%20Notification/Notifications.dart';
import 'package:crowwn/features/home/presentation/providers/bot_provider.dart';
import 'package:crowwn/features/profile/presentation/providers/profile_provider.dart';

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
  GroupModel? selectedGroup;

  @override
  void initState() {
    super.initState();
    // Fetch groups when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GroupsProvider>().fetchGroups();
      // Initialize broker providers
      context.read<BinanceProvider>().initialize();
      context.read<DeltaProvider>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    final size = MediaQuery.sizeOf(context);
    final botProvider = Provider.of<BotProvider>(context, listen: true);
    final groupsProvider = Provider.of<GroupsProvider>(context, listen: true);

    // Get greeting based on current time
    String greeting = _getTimeBasedGreeting();

    // Set default selected group if not set and groups are available
    if (selectedGroup == null && groupsProvider.groups.isNotEmpty) {
      selectedGroup = groupsProvider.groups.first;
      // Fetch bots for the first group
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<BotProvider>().fetchBotsByGroup(selectedGroup!.id);
      });
    }

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

    // Show groups error via Snackbar if there's an error
    if (groupsProvider.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(groupsProvider.error!),
            backgroundColor: Colors.red,
          ),
        );
        groupsProvider.clearError();
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
          child: RefreshIndicator(
            onRefresh: () async {
              setState(() {});
              // Refresh groups and bots
              await context.read<GroupsProvider>().fetchGroups();
              if (selectedGroup != null) {
                await context
                    .read<BotProvider>()
                    .fetchBotsByGroup(selectedGroup!.id);
              }
              // Refresh broker balances
              final binanceProvider = context.read<BinanceProvider>();
              final deltaProvider = context.read<DeltaProvider>();

              if (binanceProvider.isConnected) {
                await binanceProvider.refreshBalance();
              }
              if (deltaProvider.isConnected) {
                await deltaProvider.refreshBalance();
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Modern Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/app-icon.png",
                                width: size.width * 0.12,
                                height: size.width * 0.12,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${greeting} 👋",
                                      style: TextStyle(
                                        color: notifier.textColor
                                            .withValues(alpha: 0.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Consumer<ProfileProvider>(
                                      builder:
                                          (context, profileProvider, child) {
                                        final userName =
                                            profileProvider.profile?.fullName ??
                                                '';
                                        return Text(
                                          userName.isNotEmpty
                                              ? userName
                                              : "Dear User",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: notifier.textColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            height: 1,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            // notification icon disabled for now
                            // _modernIconButton(Icons.notifications_outlined),
                            const SizedBox(width: 10),
                            _modernIconButton(Icons.settings_outlined),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Broker Cards Section
                    _brokerCardsSection(notifier),
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
                        Icon(Icons.trending_up, color: Color(0xff2e9844)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Filter Tabs
                    if (groupsProvider.isLoading)
                      _buildShimmerFilterTabs()
                    else
                      _modernFilterTabs(groupsProvider.groups),
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
                            .map((bot) => BotCard(bot: bot))
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
                            selectedGroup != null
                                ? 'No bots available for ${selectedGroup!.name}'
                                : 'No bots available',
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

  // Broker Cards Section
  Widget _brokerCardsSection(ColorNotifire notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Broker Connections",
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.swipe_left,
                  color: notifier.textColor.withValues(alpha: 0.6),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  "Swipe",
                  style: TextStyle(
                    color: notifier.textColor.withValues(alpha: 0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            children: [
              _buildBrokerCard(
                brokerName: "Binance",
                logoPath: "assets/images/binance.jpeg",
                gradient: const LinearGradient(
                  colors: [Color(0xFFF7931A), Color(0xFFF8D147)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                isConnected: context.watch<BinanceProvider>().isConnected,
                balance: context.watch<BinanceProvider>().balance,
                isLoading: context.watch<BinanceProvider>().isLoading,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BrokersScreen(initialTab: 0),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              _buildBrokerCard(
                brokerName: "Delta",
                logoPath: "assets/images/delta_logo.png",
                gradient: const LinearGradient(
                  colors: [Color(0xFF00D4FF), Color(0xFF0099CC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                isConnected: context.watch<DeltaProvider>().isConnected,
                balance: context.watch<DeltaProvider>().balance,
                isLoading: context.watch<DeltaProvider>().isLoading,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BrokersScreen(initialTab: 1),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Individual Broker Card
  Widget _buildBrokerCard({
    required String brokerName,
    required String logoPath,
    required LinearGradient gradient,
    required bool isConnected,
    dynamic balance,
    required bool isLoading,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width:
            MediaQuery.of(context).size.width - 40, // Full width minus padding
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.first.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16), // Reduced from 20 to 16
              child: Row(
                children: [
                  // Left side - Logo and status
                  Row(
                    children: [
                      Container(
                        width: 40, // Increased from 36 to 48
                        height: 40, // Increased from 36 to 48
                        padding: brokerName == "Delta"
                            ? const EdgeInsets.all(0) // Less padding for Delta
                            : const EdgeInsets.all(
                                8), // Normal padding for others
                        decoration: BoxDecoration(
                          color: Colors.white, // Changed to solid white
                          borderRadius:
                              BorderRadius.circular(12), // Increased radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8), // Adjusted for padding
                          child: Image.asset(
                            logoPath,
                            fit: BoxFit
                                .contain, // Changed to contain for better logo display
                            width: brokerName == "Delta"
                                ? 36
                                : null, // Force width for Delta
                            height: brokerName == "Delta"
                                ? 36
                                : null, // Force height for Delta
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center vertically
                        children: [
                          Text(
                            brokerName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Reduced from 18 to 16
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2), // Reduced from 4 to 2
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color:
                                      isConnected ? Colors.green : Colors.grey,
                                  shape: BoxShape.circle,
                                  boxShadow: isConnected
                                      ? [
                                          BoxShadow(
                                            color: Colors.green
                                                .withValues(alpha: 0.5),
                                            blurRadius: 4,
                                            spreadRadius: 1,
                                          ),
                                        ]
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                isConnected ? "Connected" : "Disconnected",
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontSize: 11, // Reduced from 12 to 11
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Right side - Balance or connection status
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center vertically
                    children: [
                      if (isConnected && balance != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (isLoading)
                              _buildShimmerLoader()
                            else
                              Text(
                                _formatBalance(balance),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18, // Reduced from 20 to 18
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            const SizedBox(height: 2), // Reduced from 4 to 2
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.white.withValues(alpha: 0.8),
                                  size: 12, // Reduced from 14 to 12
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Active",
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 11, // Reduced from 12 to 11
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Connect Now",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14, // Reduced from 16 to 14
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2), // Reduced from 4 to 2
                            Row(
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white.withValues(alpha: 0.8),
                                  size: 12, // Reduced from 14 to 12
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Tap to connect",
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 11, // Reduced from 12 to 11
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Shimmer loading effect for balance
  Widget _buildShimmerLoader() {
    return Container(
      width: 80,
      height: 16,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.1),
                  Colors.white.withValues(alpha: 0.3),
                  Colors.white.withValues(alpha: 0.1),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          Positioned.fill(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: -1.0, end: 1.0),
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 80, 0),
                  child: Container(
                    width: 40,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: 0.4),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Format balance based on broker type
  String _formatBalance(dynamic balance) {
    if (balance is BinanceBalance) {
      final totalBalance = balance.btcBalance + balance.btcLocked;
      if (totalBalance >= 1) {
        return "${totalBalance.toStringAsFixed(2)} BTC";
      } else {
        return "${(totalBalance * 1000).toStringAsFixed(0)} mBTC";
      }
    } else if (balance is DeltaBalance) {
      return "${balance.availableBalance.toStringAsFixed(2)} ${balance.asset}";
    }
    return "0.00";
  }

  // Modern filter tabs
  Widget _modernFilterTabs(List<GroupModel> groups) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: groups.map((group) {
          final isSelected = selectedGroup?.id == group.id;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedGroup = group;
              });
              // Always fetch fresh bots for the selected group
              context.read<BotProvider>().fetchBotsByGroup(group.id);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff2e9844).withValues(alpha: 0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
                border: isSelected
                    ? Border.all(
                        color: const Color(0xff2e9844).withValues(alpha: 0.3))
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getTabIcon(group.name),
                    size: 15,
                    color: isSelected
                        ? const Color(0xff2e9844)
                        : notifier.textColor.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    group.name,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xff2e9844)
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

  Widget _buildShimmerFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: notifier.textColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 60,
                  height: 13,
                  decoration: BoxDecoration(
                    color: notifier.textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          );
        }),
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
    switch (tabName.toLowerCase()) {
      case "commodities":
        return Icons.inventory_2_outlined;
      case "currency":
        return Icons.currency_exchange_outlined;
      case "stocks":
        return Icons.trending_up_outlined;
      case "crypto":
        return Icons.currency_bitcoin_outlined;
      default:
        return Icons.category_outlined;
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
