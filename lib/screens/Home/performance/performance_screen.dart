// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Project imports:
import 'package:crowwn/screens/Home/performance/signals_screen.dart';
import '../../../dark_mode.dart';

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

class _PerformanceScreenState extends State<PerformanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ColorNotifire notifier = ColorNotifire();
  int? selectedSignalIndex;
  bool isLineChart = true;

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
              color: notifier.container.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xff6B39F4).withValues(alpha: 0.1),
                border: Border.all(
                    color: const Color(0xff6B39F4).withValues(alpha: 0.3)),
              ),
              labelColor: const Color(0xff6B39F4),
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPerformanceCard(),
                const SizedBox(height: 20),
                _buildPerformanceSummaryChart(),
                const SizedBox(height: 20),
                _buildDisclaimer(),
              ],
            ),
          ),
          // Signals Tab
          SignalsScreen(),
        ],
      ),
    );
  }

  Widget _buildPerformanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
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
              _buildPerformanceMetric(
                  'Total PnL', widget.price, const Color(0xff6B39F4)),
              _buildPerformanceMetric(
                  'Win Rate', widget.winRate, const Color(0xff6B39F4)),
              _buildPerformanceMetric(
                  'ROI', widget.roi, const Color(0xff6B39F4)),
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
            color: notifier.textColor.withValues(alpha: 0.7),
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

  Widget _buildPerformanceSummaryChart() {
    final candles = _getHeikinAshiCandles();
    final chartData = candles
        .map((candle) => _ChartData(
              candle.epoch.toDouble(),
              candle.close,
            ))
        .toList();

    // Calculate min and max values for proper zooming
    final minY = chartData.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    final maxY = chartData.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final minX = chartData.map((e) => e.x).reduce((a, b) => a < b ? a : b);
    final maxX = chartData.map((e) => e.x).reduce((a, b) => a > b ? a : b);

    // Add padding to the range
    final yPadding = (maxY - minY) * 0.1;
    final xPadding = (maxX - minX) * 0.05;

    // Calculate initial visible range (show only last 20% of data)
    final initialVisibleRange = (maxX - minX) * 0.2;
    final initialMinX = maxX - initialVisibleRange;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Performance Summary',
                style: TextStyle(
                  color: notifier.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isLineChart = true),
                    child: _buildChartTypeButton('Line', isLineChart),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => isLineChart = false),
                    child: _buildChartTypeButton('Candle', !isLineChart),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              margin: const EdgeInsets.all(10),
              primaryXAxis: NumericAxis(
                isVisible: true,
                minimum: initialMinX,
                maximum: maxX,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: notifier.textColor.withValues(alpha: 0.05),
                ),
                minorGridLines: MinorGridLines(
                  width: 0,
                  color: Colors.transparent,
                ),
                labelStyle: TextStyle(
                  color: notifier.textColor.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
                axisLine: AxisLine(
                  width: 1,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                majorTickLines: MajorTickLines(
                  size: 5,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                interval: initialVisibleRange / 8,
                desiredIntervals: 8,
              ),
              primaryYAxis: NumericAxis(
                isVisible: true,
                minimum: minY - yPadding,
                maximum: maxY + yPadding,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: notifier.textColor.withValues(alpha: 0.05),
                ),
                minorGridLines: MinorGridLines(
                  width: 0,
                  color: Colors.transparent,
                ),
                labelStyle: TextStyle(
                  color: notifier.textColor.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
                axisLine: AxisLine(
                  width: 1,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                majorTickLines: MajorTickLines(
                  size: 5,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                numberFormat: NumberFormat.compactCurrency(
                  symbol: '\$',
                  decimalDigits: 0,
                ),
                interval: (maxY - minY) / 6,
                desiredIntervals: 6,
              ),
              backgroundColor: notifier.background,
              palette: const [
                Color(0xff6B39F4),
              ],
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
                enableDoubleTapZooming: true,
                zoomMode: ZoomMode.x,
                maximumZoomLevel: 0.1,
                enableSelectionZooming: true,
                selectionRectBorderColor: const Color(0xff6B39F4),
                selectionRectBorderWidth: 1,
                selectionRectColor:
                    const Color(0xff6B39F4).withValues(alpha: 0.1),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                format: 'point.x : point.y',
                builder: (data, point, series, pointIndex, seriesIndex) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: notifier.container,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: notifier.textColor.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Text(
                      '\$${point.y?.toStringAsFixed(2) ?? '0.00'}',
                      style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
              series: <CartesianSeries>[
                if (isLineChart)
                  FastLineSeries<_ChartData, double>(
                    dataSource: chartData,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    width: 3,
                    markerSettings: MarkerSettings(
                      isVisible: true,
                      height: 6,
                      width: 6,
                      shape: DataMarkerType.circle,
                      borderWidth: 2,
                      borderColor: const Color(0xff6B39F4),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff6B39F4).withValues(alpha: 0.2),
                        const Color(0xff6B39F4).withValues(alpha: 0.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )
                else
                  CandleSeries<Candle, double>(
                    dataSource: candles,
                    xValueMapper: (Candle data, _) => data.epoch.toDouble(),
                    lowValueMapper: (Candle data, _) => data.low,
                    highValueMapper: (Candle data, _) => data.high,
                    openValueMapper: (Candle data, _) => data.open,
                    closeValueMapper: (Candle data, _) => data.close,
                    name: 'Heikin Ashi',
                    bearColor: Colors.red,
                    bullColor: const Color(0xff6B39F4),
                    borderWidth: 1,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  Widget _buildChartTypeButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xff6B39F4).withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? const Color(0xff6B39F4)
              : notifier.textColor.withValues(alpha: 0.1),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected
              ? const Color(0xff6B39F4)
              : notifier.textColor.withValues(alpha: 0.7),
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  List<Candle> _getHeikinAshiCandles() {
    final now = DateTime.now();
    final regularCandles = List.generate(100, (i) {
      final time = now.subtract(Duration(hours: 100 - i));
      final basePrice = 45000.0;
      final random = (i % 3) * 100.0;
      final open = basePrice + random;
      final close = open + (i % 2 == 0 ? 200 : -150);
      final high = [open, close].reduce((a, b) => a > b ? a : b) + 50;
      final low = [open, close].reduce((a, b) => a < b ? a : b) - 50;
      return Candle(
        epoch: time.millisecondsSinceEpoch ~/ 1000,
        open: open,
        close: close,
        high: high,
        low: low,
      );
    });

    // Convert to Heikin Ashi
    final heikinAshiCandles = <Candle>[];
    for (int i = 0; i < regularCandles.length; i++) {
      final current = regularCandles[i];
      double haClose, haOpen, haHigh, haLow;

      if (i == 0) {
        haClose =
            (current.open + current.high + current.low + current.close) / 4;
        haOpen = (current.open + current.close) / 2;
        haHigh = current.high;
        haLow = current.low;
      } else {
        final previous = heikinAshiCandles[i - 1];
        haClose =
            (current.open + current.high + current.low + current.close) / 4;
        haOpen = (previous.open + previous.close) / 2;
        haHigh =
            [current.high, haOpen, haClose].reduce((a, b) => a > b ? a : b);
        haLow = [current.low, haOpen, haClose].reduce((a, b) => a < b ? a : b);
      }

      heikinAshiCandles.add(Candle(
        epoch: current.epoch,
        open: haOpen,
        close: haClose,
        high: haHigh,
        low: haLow,
      ));
    }

    return heikinAshiCandles;
  }

  Widget _buildTimeFrameButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xff6B39F4).withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? const Color(0xff6B39F4)
              : notifier.textColor.withValues(alpha: 0.1),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected
              ? const Color(0xff6B39F4)
              : notifier.textColor.withValues(alpha: 0.7),
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSignalFilters() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: notifier.container.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
            ),
            child: Row(
              children: [
                Icon(Icons.filter_list,
                    size: 16, color: notifier.textColor.withValues(alpha: 0.7)),
                const SizedBox(width: 8),
                Text(
                  'Filter Signals',
                  style: TextStyle(
                    color: notifier.textColor.withValues(alpha: 0.7),
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
            color: notifier.container.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
          ),
          child: Icon(Icons.sort,
              color: notifier.textColor.withValues(alpha: 0.7)),
        ),
      ],
    );
  }

  Widget _buildTradingChart() {
    final candles = _getHeikinAshiCandles();
    final chartData = candles
        .map((candle) => _ChartData(
              candle.epoch.toDouble(),
              candle.close,
            ))
        .toList();

    // Calculate min and max values for proper zooming
    final minY = chartData.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    final maxY = chartData.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final minX = chartData.map((e) => e.x).reduce((a, b) => a < b ? a : b);
    final maxX = chartData.map((e) => e.x).reduce((a, b) => a > b ? a : b);

    // Add padding to the range
    final yPadding = (maxY - minY) * 0.1;
    final xPadding = (maxX - minX) * 0.05;

    // Calculate initial visible range (show only last 20% of data)
    final initialVisibleRange = (maxX - minX) * 0.2;
    final initialMinX = maxX - initialVisibleRange;

    // Sample trade points (you can replace these with actual trade data)
    final tradePoints = [
      TradePoint(
        x: chartData[chartData.length - 15].x, // Place open trade near the end
        y: chartData[chartData.length - 15].y,
        type: TradeType.open,
        price: chartData[chartData.length - 15].y,
      ),
      TradePoint(
        x: chartData[chartData.length - 5].x, // Place close trade near the end
        y: chartData[chartData.length - 5].y,
        type: TradeType.close,
        price: chartData[chartData.length - 5].y,
      ),
    ];

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'BTC/USDT',
                  style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTimeFrameButton('1H', true),
                    const SizedBox(width: 8),
                    _buildTimeFrameButton('4H', false),
                    const SizedBox(width: 8),
                    _buildTimeFrameButton('1D', false),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              margin: const EdgeInsets.all(10),
              primaryXAxis: NumericAxis(
                isVisible: true,
                minimum: initialMinX,
                maximum: maxX,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: notifier.textColor.withValues(alpha: 0.05),
                ),
                minorGridLines: MinorGridLines(
                  width: 0,
                  color: Colors.transparent,
                ),
                labelStyle: TextStyle(
                  color: notifier.textColor.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
                axisLine: AxisLine(
                  width: 1,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                majorTickLines: MajorTickLines(
                  size: 5,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                interval: initialVisibleRange / 8,
                desiredIntervals: 8,
              ),
              primaryYAxis: NumericAxis(
                isVisible: true,
                minimum: minY - yPadding,
                maximum: maxY + yPadding,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  color: notifier.textColor.withValues(alpha: 0.05),
                ),
                minorGridLines: MinorGridLines(
                  width: 0,
                  color: Colors.transparent,
                ),
                labelStyle: TextStyle(
                  color: notifier.textColor.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
                axisLine: AxisLine(
                  width: 1,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                majorTickLines: MajorTickLines(
                  size: 5,
                  color: notifier.textColor.withValues(alpha: 0.1),
                ),
                numberFormat: NumberFormat.compactCurrency(
                  symbol: '\$',
                  decimalDigits: 0,
                ),
                interval: (maxY - minY) / 6,
                desiredIntervals: 6,
              ),
              backgroundColor: notifier.background,
              palette: const [
                Color(0xff6B39F4),
              ],
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
                enableDoubleTapZooming: true,
                zoomMode: ZoomMode.x,
                maximumZoomLevel: 0.1,
                enableSelectionZooming: true,
                selectionRectBorderColor: const Color(0xff6B39F4),
                selectionRectBorderWidth: 1,
                selectionRectColor:
                    const Color(0xff6B39F4).withValues(alpha: 0.1),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                format: 'point.x : point.y',
                builder: (data, point, series, pointIndex, seriesIndex) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: notifier.container,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: notifier.textColor.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Text(
                      '\$${point.y?.toStringAsFixed(2) ?? '0.00'}',
                      style: TextStyle(
                        color: notifier.textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
              annotations: [
                ...tradePoints
                    .map((trade) => CartesianChartAnnotation(
                          x: trade.x,
                          y: trade.y,
                          coordinateUnit: CoordinateUnit.point,
                          widget: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: trade.type == TradeType.open
                                  ? Colors.green
                                  : Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: notifier.background,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: (trade.type == TradeType.open
                                          ? Colors.green
                                          : Colors.red)
                                      .withValues(alpha: 0.3),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ],
              series: <CartesianSeries>[
                FastLineSeries<_ChartData, double>(
                  dataSource: chartData,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  width: 2,
                  markerSettings: MarkerSettings(
                    isVisible: true,
                    height: 4,
                    width: 4,
                    shape: DataMarkerType.circle,
                    borderWidth: 2,
                    borderColor: const Color(0xff6B39F4),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff6B39F4).withValues(alpha: 0.2),
                      const Color(0xff6B39F4).withValues(alpha: 0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ],
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

  Widget _buildTradeMarker(String label, Color color, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: notifier.textColor.withValues(alpha: 0.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              Text(
                'Disclaimer',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Past performance is not indicative of future results. Trading involves significant risk and can result in the loss of your invested capital. You should not invest more than you can afford to lose.',
            style: TextStyle(
              color: notifier.textColor,
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This strategy is for informational purposes only and should not be considered as financial advice. Always do your own research before making any investment decisions.',
            style: TextStyle(
              color: notifier.textColor,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final double x;
  final double y;
}

class Candle {
  final int epoch;
  final double open;
  final double close;
  final double high;
  final double low;

  Candle({
    required this.epoch,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });
}

class TradePoint {
  final double x;
  final double y;
  final TradeType type;
  final double price;

  TradePoint({
    required this.x,
    required this.y,
    required this.type,
    required this.price,
  });
}

enum TradeType {
  open,
  close,
}
