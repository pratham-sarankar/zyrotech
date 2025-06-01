import 'package:flutter/material.dart';
import '../Dark mode.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceScreen extends StatefulWidget {
  final String strategyName;
  final String winRate;
  final String price;
  final Color pnlColor;
  final String volume;
  final String roi;
  final String strategyType;

  const PerformanceScreen({
    Key? key,
    required this.strategyName,
    required this.winRate,
    required this.price,
    required this.pnlColor,
    required this.volume,
    required this.roi,
    required this.strategyType,
  }) : super(key: key);

  @override
  _PerformanceScreenState createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ColorNotifire notifier = ColorNotifire();
  int? selectedSignalIndex;

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: notifier.textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.strategyName,
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPerformanceCard(),
                const SizedBox(height: 20),
                _buildMetricsSection(),
                const SizedBox(height: 20),
                _buildTradingHistory(),
              ],
            ),
          ),
          // Signals Tab
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSignalFilters(),
                const SizedBox(height: 16),
                _buildSignalList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Overview',
            style: TextStyle(
              color: notifier.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPerformanceMetric('Total PnL', widget.price, const Color(0xff6B39F4)),
              _buildPerformanceMetric('Win Rate', widget.winRate, const Color(0xff6B39F4)),
              _buildPerformanceMetric('ROI', widget.roi, const Color(0xff6B39F4)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetric(String label, String value, Color valueColor) {
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
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Metrics',
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildMetricCard('Volume', widget.volume, Icons.currency_exchange),
            _buildMetricCard('Strategy Type', widget.strategyType, Icons.analytics),
            _buildMetricCard('Total Trades', '156', Icons.swap_horiz),
            _buildMetricCard('Avg. Duration', '2.5h', Icons.timer),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xff6B39F4), size: 20),
          const SizedBox(height: 8),
          Text(
            title,
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTradingHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Trades',
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildTradeItem();
          },
        ),
      ],
    );
  }

  Widget _buildTradeItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: notifier.container.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: notifier.textColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.trending_up, color: Colors.green, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BTC/USDT',
                      style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Long',
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
                    '+\$1,245.60',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2 hours ago',
                    style: TextStyle(
                      color: notifier.textColor.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTradeDetail('Open Time', '2024-03-20 10:30'),
              _buildTradeDetail('Close Time', '2024-03-20 12:30'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTradeDetail('Open Price', '\$45,250'),
              _buildTradeDetail('Close Price', '\$46,500'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTradeDetail('Take Profit', '\$46,800'),
              _buildTradeDetail('Stop Loss', '\$44,800'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTradeDetail(String label, String value) {
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
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSignalFilters() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: notifier.container.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: notifier.textColor.withOpacity(0.1)),
            ),
            child: Row(
              children: [
                Icon(Icons.filter_list, size: 16, color: notifier.textColor.withOpacity(0.7)),
                const SizedBox(width: 8),
                Text(
                  'Filter Signals',
                  style: TextStyle(
                    color: notifier.textColor.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: notifier.container.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: notifier.textColor.withOpacity(0.1)),
          ),
          child: Icon(Icons.sort, color: notifier.textColor.withOpacity(0.7)),
        ),
      ],
    );
  }

  Widget _buildSignalList() {
    return Column(
      children: [
        if (selectedSignalIndex != null) ...[
          _buildTradingChart(),
          const SizedBox(height: 20),
        ],
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return _buildSignalItem(index);
          },
        ),
      ],
    );
  }

  Widget _buildTradingChart() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BTC/USDT',
                style: TextStyle(
                  color: notifier.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  _buildTimeFrameButton('1H', true),
                  const SizedBox(width: 8),
                  _buildTimeFrameButton('4H', false),
                  const SizedBox(width: 8),
                  _buildTimeFrameButton('1D', false),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: notifier.textColor.withOpacity(0.1),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: notifier.textColor.withOpacity(0.1),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        );
                        Widget text;
                        switch (value.toInt()) {
                          case 0:
                            text = const Text('00:00', style: style);
                            break;
                          case 4:
                            text = const Text('04:00', style: style);
                            break;
                          case 8:
                            text = const Text('08:00', style: style);
                            break;
                          case 12:
                            text = const Text('12:00', style: style);
                            break;
                          case 16:
                            text = const Text('16:00', style: style);
                            break;
                          case 20:
                            text = const Text('20:00', style: style);
                            break;
                          case 24:
                            text = const Text('24:00', style: style);
                            break;
                          default:
                            text = const Text('');
                            break;
                        }
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: text,
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        );
                        return Text(
                          '\$${value.toInt()}K',
                          style: style,
                        );
                      },
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                maxX: 24,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 3),
                      const FlSpot(2.6, 2),
                      const FlSpot(4.9, 5),
                      const FlSpot(6.8, 3.1),
                      const FlSpot(8, 4),
                      const FlSpot(9.5, 3),
                      const FlSpot(11, 4),
                      const FlSpot(12, 3),
                      const FlSpot(13, 4),
                      const FlSpot(14, 3),
                      const FlSpot(15, 4),
                      const FlSpot(16, 3),
                      const FlSpot(17, 4),
                      const FlSpot(18, 3),
                      const FlSpot(19, 4),
                      const FlSpot(20, 3),
                      const FlSpot(21, 4),
                      const FlSpot(22, 3),
                      const FlSpot(23, 4),
                      const FlSpot(24, 3),
                    ],
                    isCurved: true,
                    color: const Color(0xff6B39F4),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        // Show dots only at open and close positions
                        if (index == 4 || index == 16) {
                          return FlDotCirclePainter(
                            radius: 6,
                            color: index == 4 ? Colors.green : Colors.red,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          );
                        }
                        return FlDotCirclePainter(
                          radius: 0,
                          color: Colors.transparent,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xff6B39F4).withOpacity(0.1),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: notifier.container,
                    tooltipRoundedRadius: 8,
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        return LineTooltipItem(
                          '\$${(barSpot.y * 1000).toStringAsFixed(2)}',
                          TextStyle(
                            color: notifier.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                extraLinesData: ExtraLinesData(
                  extraLinesOnTop: true,
                  horizontalLines: [
                    HorizontalLine(
                      y: 4.5,
                      color: Colors.green.withOpacity(0.5),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    ),
                    HorizontalLine(
                      y: 2.5,
                      color: Colors.red.withOpacity(0.5),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTradeMarker('Open', Colors.green, Icons.arrow_upward),
              const SizedBox(width: 24),
              _buildTradeMarker('Close', Colors.red, Icons.arrow_downward),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeFrameButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff6B39F4).withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? const Color(0xff6B39F4) : notifier.textColor.withOpacity(0.1),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? const Color(0xff6B39F4) : notifier.textColor.withOpacity(0.7),
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTradeMarker(String label, Color color, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(width: 8),
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

  Widget _buildSignalItem(int index) {
    final isSelected = selectedSignalIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSignalIndex = isSelected ? null : index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: notifier.container.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xff6B39F4) : notifier.textColor.withOpacity(0.1),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BTC/USDT',
                  style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'BUY',
                    style: TextStyle(
                      color: Colors.green,
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
                _buildSignalMetric('Entry', '\$45,250'),
                _buildSignalMetric('Target', '\$46,500'),
                _buildSignalMetric('Stop Loss', '\$44,800'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2 hours ago',
                  style: TextStyle(
                    color: notifier.textColor.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Risk: Medium',
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