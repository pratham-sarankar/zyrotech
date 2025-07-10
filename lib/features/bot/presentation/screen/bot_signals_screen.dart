// Flutter imports:
import 'package:crowwn/features/home/data/models/bot_model.dart';
import 'package:crowwn/widgets/signal_card.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/bot/presentation/providers/signals_provider.dart';
import 'package:crowwn/features/bot/presentation/widgets/performance_overview_widget.dart';

class BotSignalsScreen extends StatefulWidget {
  const BotSignalsScreen({super.key, required this.bot});
  final BotModel bot;
  @override
  State<BotSignalsScreen> createState() => _BotSignalsScreenState();
}

class _BotSignalsScreenState extends State<BotSignalsScreen> {
  ColorNotifire notifier = ColorNotifire();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Fetch signals for this specific bot
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SignalsProvider>().fetchSignalsByBotId(widget.bot.id);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final signalsProvider = context.read<SignalsProvider>();
      if (signalsProvider.canLoadMore) {
        signalsProvider.loadMoreSignals();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leadingWidth: 0,
        leading: Container(),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.bot.name}\'s Signals',
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.8,
              ),
            ),
            Text(
              'Filter and analyze signals',
              style: TextStyle(
                color: notifier.textColorGrey,
                fontSize: 15,
                height: 1.2,
              ),
            ),
          ],
        ),
        actions: [
          Consumer<SignalsProvider>(
            builder: (context, signalsProvider, child) {
              return Row(
                children: [
                  if (signalsProvider.hasActiveFilters)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Filtered',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => _showFilterBottomSheet(),
                    icon: Icon(
                      Icons.filter_list,
                      color: notifier.textColor,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<SignalsProvider>(
        builder: (context, signalsProvider, child) {
          return RefreshIndicator(
            onRefresh: () async {
              await signalsProvider.refreshSignals();
            },
            child: _buildSignalList(signalsProvider),
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: notifier.background,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return _FilterBottomSheet(botId: widget.bot.id);
      },
    );
  }

  Widget _buildSignalList(SignalsProvider signalsProvider) {
    if (signalsProvider.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: notifier.textColor,
        ),
      );
    }

    if (signalsProvider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading signals',
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              signalsProvider.error!,
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                signalsProvider.clearError();
                signalsProvider.fetchSignalsByBotId(widget.bot.id);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (signalsProvider.signals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signal_cellular_alt_outlined,
              color: notifier.textColor.withValues(alpha: 0.5),
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No signals found',
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This bot hasn\'t generated any signals yet.',
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        controller: _scrollController,
        children: [
          _buildPerformanceCard(signalsProvider),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: signalsProvider.signals.length +
                (signalsProvider.isLoadingMore || signalsProvider.canLoadMore
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (index == signalsProvider.signals.length) {
                // Show loading indicator at the bottom
                return _buildLoadingMoreIndicator(
                    signalsProvider.isLoadingMore);
              }
              final signal = signalsProvider.signals[index];
              return SignalCard(signal: signal);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingMoreIndicator(bool isLoadingMore) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoadingMore) ...[
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: notifier.textColor,
                ),
              ),
              const SizedBox(width: 12),
            ],
            Text(
              isLoadingMore
                  ? 'Loading more signals...'
                  : 'More signals available',
              style: TextStyle(
                color: notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceCard(SignalsProvider signalsProvider) {
    // If we have performance overview data from the API, use the new widget
    if (signalsProvider.performanceOverview != null) {
      return PerformanceOverviewWidget(
        performanceOverview: signalsProvider.performanceOverview!,
      );
    }

    // Fallback to basic performance metrics if no overview data
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notifier.container,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: notifier.textColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Performance Overview',
                    style: TextStyle(
                      color: notifier.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (signalsProvider.hasActiveFilters) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xff2e9844).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Filtered',
                        style: TextStyle(
                          color: const Color(0xff2e9844),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Text(
                '${signalsProvider.currentPage}/${signalsProvider.totalPages}',
                style: TextStyle(
                  color: notifier.textColor.withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPerformanceMetric(
                  'Total PnL',
                  '\$${signalsProvider.totalPnL.toStringAsFixed(2)}',
                  signalsProvider.totalPnL >= 0 ? Colors.green : Colors.red),
              _buildPerformanceMetric(
                  'Win Rate',
                  '${signalsProvider.winRate.toStringAsFixed(1)}%',
                  const Color(0xff2e9844)),
              _buildPerformanceMetric(
                  'Avg ROI',
                  '${signalsProvider.averageROI.toStringAsFixed(2)}%',
                  const Color(0xff2e9844)),
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
}

class _FilterBottomSheet extends StatefulWidget {
  final String botId;

  const _FilterBottomSheet({required this.botId});

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  ColorNotifire notifier = ColorNotifire();

  // Filter state
  String? _selectedDirection;
  String? _selectedDateFilter;
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _selectedDate;

  final List<String> _directions = ['LONG', 'SHORT'];
  final List<Map<String, String>> _dateFilters = [
    {'label': 'Today', 'value': 'today'},
    {'label': 'Yesterday', 'value': 'yesterday'},
    {'label': 'This Week', 'value': 'thisWeek'},
    {'label': 'This Month', 'value': 'thisMonth'},
  ];

  @override
  void initState() {
    super.initState();
    _initializeFilters();
  }

  void _initializeFilters() {
    final signalsProvider = context.read<SignalsProvider>();

    // Initialize direction filter
    _selectedDirection = signalsProvider.direction;

    // Initialize date filters
    if (signalsProvider.today == 'yes') {
      _selectedDateFilter = 'today';
    } else if (signalsProvider.yesterday == 'yes') {
      _selectedDateFilter = 'yesterday';
    } else if (signalsProvider.thisWeek == 'yes') {
      _selectedDateFilter = 'thisWeek';
    } else if (signalsProvider.thisMonth == 'yes') {
      _selectedDateFilter = 'thisMonth';
    }

    // Initialize custom date range
    if (signalsProvider.startDate != null) {
      try {
        _startDate = DateFormat('yyyy-MM-dd').parse(signalsProvider.startDate!);
      } catch (e) {
        // Handle parsing error
      }
    }

    if (signalsProvider.endDate != null) {
      try {
        _endDate = DateFormat('yyyy-MM-dd').parse(signalsProvider.endDate!);
      } catch (e) {
        // Handle parsing error
      }
    }

    // Initialize specific date
    if (signalsProvider.date != null) {
      try {
        _selectedDate = DateFormat('yyyy-MM-dd').parse(signalsProvider.date!);
      } catch (e) {
        // Handle parsing error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle bar
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: notifier.textColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Signals',
                  style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<SignalsProvider>().clearFilters();
                    Navigator.pop(context);
                    context
                        .read<SignalsProvider>()
                        .fetchSignalsByBotId(widget.botId);
                  },
                  child: Text(
                    'Clear All',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Filter options
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Direction filter
                  // _buildSectionTitle('Direction'),
                  // const SizedBox(height: 12),
                  // Wrap(
                  //   spacing: 8,
                  //   children: [
                  //     _buildChip('All', null, _selectedDirection),
                  //     ..._directions.map((direction) =>
                  //         _buildChip(direction, direction, _selectedDirection)),
                  //   ],
                  // ),
                  // const SizedBox(height: 24),

                  // Quick date filters
                  // _buildSectionTitle('Quick Date Filters'),
                  // const SizedBox(height: 12),
                  // Wrap(
                  //   spacing: 8,
                  //   runSpacing: 8,
                  //   children: [
                  //     _buildChip('All Time', null, _selectedDateFilter),
                  //     ..._dateFilters.map((filter) => _buildChip(
                  //         filter['label']!,
                  //         filter['value']!,
                  //         _selectedDateFilter)),
                  //   ],
                  // ),
                  // const SizedBox(height: 24),

                  // Custom date range
                  _buildSectionTitle('Custom Date Range'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateButton(
                          'Start Date',
                          _startDate,
                          (date) => setState(() => _startDate = date),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDateButton(
                          'End Date',
                          _endDate,
                          (date) => setState(() => _endDate = date),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Specific date
                  _buildSectionTitle('Specific Date'),
                  const SizedBox(height: 12),
                  _buildDateButton(
                    'Select Date',
                    _selectedDate,
                    (date) => setState(() => _selectedDate = date),
                  ),
                  const SizedBox(height: 32),

                  // Apply button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _applyFilters,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2e9844),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Apply Filters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: notifier.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildChip(String label, String? value, String? selectedValue) {
    final isSelected = value == selectedValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (value == null) {
            // "All" option selected
            if (label == 'All') {
              _selectedDirection = null;
            } else {
              _selectedDateFilter = null;
            }
          } else {
            if (_directions.contains(value)) {
              _selectedDirection = value;
            } else {
              _selectedDateFilter = value;
            }
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff2e9844) : notifier.container,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xff2e9844)
                : notifier.textColor.withValues(alpha: 0.2),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : notifier.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDateButton(String label, DateTime? selectedDate,
      Function(DateTime?) onDateSelected) {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: const Color(0xff2e9844),
                  onPrimary: Colors.white,
                  surface: notifier.background,
                  onSurface: notifier.textColor,
                ),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          onDateSelected(date);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: notifier.container,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: notifier.textColor.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? DateFormat('dd MMM yyyy').format(selectedDate)
                  : label,
              style: TextStyle(
                color: selectedDate != null
                    ? notifier.textColor
                    : notifier.textColor.withValues(alpha: 0.7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.calendar_today,
              color: notifier.textColor.withValues(alpha: 0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _applyFilters() {
    final signalsProvider = context.read<SignalsProvider>();

    // Convert dates to string format (YYYY-MM-DD)
    String? startDateStr;
    String? endDateStr;
    String? dateStr;

    if (_startDate != null) {
      startDateStr = DateFormat('yyyy-MM-dd').format(_startDate!);
    }
    if (_endDate != null) {
      endDateStr = DateFormat('yyyy-MM-dd').format(_endDate!);
    }
    if (_selectedDate != null) {
      dateStr = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    }

    // Set filters - using 'yes' for boolean values as per API specification
    signalsProvider.setDateFilter(
      direction: _selectedDirection,
      today: _selectedDateFilter == 'today' ? 'yes' : null,
      yesterday: _selectedDateFilter == 'yesterday' ? 'yes' : null,
      thisWeek: _selectedDateFilter == 'thisWeek' ? 'yes' : null,
      thisMonth: _selectedDateFilter == 'thisMonth' ? 'yes' : null,
      startDate: startDateStr,
      endDate: endDateStr,
      date: dateStr,
    );

    // Apply filters and close bottom sheet
    Navigator.pop(context);
    signalsProvider.fetchSignalsByBotId(widget.botId);
  }
}
