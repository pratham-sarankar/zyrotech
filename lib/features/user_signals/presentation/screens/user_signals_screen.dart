import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/dark_mode.dart';
import 'package:crowwn/features/user_signals/presentation/providers/user_signals_provider.dart';
import 'package:crowwn/features/user_signals/presentation/widgets/user_signals_tab.dart';

class UserSignalsScreen extends StatefulWidget {
  const UserSignalsScreen({super.key});

  @override
  State<UserSignalsScreen> createState() => _UserSignalsScreenState();
}

class _UserSignalsScreenState extends State<UserSignalsScreen>
    with SingleTickerProviderStateMixin {
  ColorNotifire notifier = ColorNotifire();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Fetch initial data for opened signals
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserSignalsProvider>().fetchUserSignals('opened');
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      final status = _tabController.index == 0 ? 'opened' : 'closed';
      final provider = context.read<UserSignalsProvider>();

      // Only fetch if we don't have data for this tab
      if (provider.getSignals(status).isEmpty && !provider.isLoading(status)) {
        provider.fetchUserSignals(status);
      }

      // Trigger rebuild to update active bots count
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 5,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Signals',
              style: TextStyle(
                color: notifier.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.8,
              ),
            ),
            Consumer<UserSignalsProvider>(
              builder: (context, userSignalsProvider, child) {
                final openedCount =
                    userSignalsProvider.getActiveBotsCount('opened');
                final closedCount =
                    userSignalsProvider.getActiveBotsCount('closed');
                final activeBotsCount =
                    openedCount > 0 ? openedCount : closedCount;
                final isLoading = userSignalsProvider.isLoading('opened') &&
                    userSignalsProvider.isLoading('closed') &&
                    activeBotsCount == 0;
                String displayText;
                if (isLoading) {
                  displayText = 'Loading...';
                } else if (activeBotsCount == 0) {
                  displayText = 'No Active Bots';
                } else {
                  displayText = 'Active Bots: $activeBotsCount';
                }
                return Text(
                  displayText,
                  style: TextStyle(
                    color: notifier.textColorGrey,
                    fontSize: 15,
                    height: 1.2,
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          Consumer<UserSignalsProvider>(
            builder: (context, userSignalsProvider, child) {
              return Row(
                children: [
                  if (userSignalsProvider.hasActiveFilters)
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
      body: Column(
        children: [
          // TabBar styled like bot signals screen
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                  color: const Color(0xff6B39F4).withValues(alpha: 0.3),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.radio_button_checked,
                        size: 18,
                        color: _tabController.index == 0
                            ? const Color(0xff6B39F4)
                            : notifier.textColor.withValues(alpha: 0.7)),
                    const SizedBox(width: 8),
                    const Text('Open'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline,
                        size: 18,
                        color: _tabController.index == 1
                            ? const Color(0xff6B39F4)
                            : notifier.textColor.withValues(alpha: 0.7)),
                    const SizedBox(width: 8),
                    const Text('Closed'),
                  ],
                ),
              ].map((child) => Tab(child: child)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                UserSignalsTab(status: 'opened'),
                UserSignalsTab(status: 'closed'),
              ],
            ),
          ),
        ],
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
        return _FilterBottomSheet();
      },
    );
  }
}

class _FilterBottomSheet extends StatefulWidget {
  const _FilterBottomSheet();

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
    final userSignalsProvider = context.read<UserSignalsProvider>();

    // Initialize direction filter
    _selectedDirection = userSignalsProvider.direction;

    // Initialize date filters
    if (userSignalsProvider.today == 'yes') {
      _selectedDateFilter = 'today';
    } else if (userSignalsProvider.yesterday == 'yes') {
      _selectedDateFilter = 'yesterday';
    } else if (userSignalsProvider.thisWeek == 'yes') {
      _selectedDateFilter = 'thisWeek';
    } else if (userSignalsProvider.thisMonth == 'yes') {
      _selectedDateFilter = 'thisMonth';
    }

    // Initialize custom date range
    if (userSignalsProvider.startDate != null) {
      try {
        _startDate = DateTime.parse(userSignalsProvider.startDate!);
      } catch (e) {
        // Handle parsing error
      }
    }

    if (userSignalsProvider.endDate != null) {
      try {
        _endDate = DateTime.parse(userSignalsProvider.endDate!);
      } catch (e) {
        // Handle parsing error
      }
    }

    // Initialize specific date
    if (userSignalsProvider.date != null) {
      try {
        _selectedDate = DateTime.parse(userSignalsProvider.date!);
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
                    context.read<UserSignalsProvider>().clearFilters();
                    Navigator.pop(context);
                    // Refresh both tabs
                    context
                        .read<UserSignalsProvider>()
                        .fetchUserSignals('opened');
                    context
                        .read<UserSignalsProvider>()
                        .fetchUserSignals('closed');
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
                  _buildSectionTitle('Direction'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildChip('All', null, _selectedDirection),
                      ..._directions.map((direction) =>
                          _buildChip(direction, direction, _selectedDirection)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Quick date filters
                  _buildSectionTitle('Quick Date Filters'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildChip('All Time', null, _selectedDateFilter),
                      ..._dateFilters.map((filter) => _buildChip(
                          filter['label']!,
                          filter['value']!,
                          _selectedDateFilter)),
                    ],
                  ),
                  const SizedBox(height: 24),

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
                        backgroundColor: const Color(0xff6B39F4),
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
          color: isSelected ? const Color(0xff6B39F4) : notifier.container,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xff6B39F4)
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
                  primary: const Color(0xff6B39F4),
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
                  ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
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
    final userSignalsProvider = context.read<UserSignalsProvider>();

    // Convert dates to string format (YYYY-MM-DD)
    String? startDateStr;
    String? endDateStr;
    String? dateStr;

    if (_startDate != null) {
      startDateStr =
          '${_startDate!.year}-${_startDate!.month.toString().padLeft(2, '0')}-${_startDate!.day.toString().padLeft(2, '0')}';
    }
    if (_endDate != null) {
      endDateStr =
          '${_endDate!.year}-${_endDate!.month.toString().padLeft(2, '0')}-${_endDate!.day.toString().padLeft(2, '0')}';
    }
    if (_selectedDate != null) {
      dateStr =
          '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}';
    }

    // Set filters - using 'yes' for boolean values as per API specification
    userSignalsProvider.setDateFilter(
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

    // Refresh both tabs
    userSignalsProvider.fetchUserSignals('opened');
    userSignalsProvider.fetchUserSignals('closed');
  }
}
