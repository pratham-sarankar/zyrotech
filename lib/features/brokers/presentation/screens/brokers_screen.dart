// Flutter imports:
import 'package:crowwn/features/brokers/presentation/providers/binance_provider.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../../dark_mode.dart';
import '../../../../utils/toast_utils.dart';

class BrokersScreen extends StatefulWidget {
  const BrokersScreen({super.key});

  @override
  State<BrokersScreen> createState() => _BrokersScreenState();
}

class _BrokersScreenState extends State<BrokersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ColorNotifire notifier = ColorNotifire();

  // Controllers for text fields
  final TextEditingController _binanceApiKeyController =
      TextEditingController();
  final TextEditingController _binanceApiSecretController =
      TextEditingController();
  final TextEditingController _deltaApiKeyController = TextEditingController();
  final TextEditingController _deltaApiSecretController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Initialize Binance provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BinanceProvider>().initialize();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _binanceApiKeyController.dispose();
    _binanceApiSecretController.dispose();
    _deltaApiKeyController.dispose();
    _deltaApiSecretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: Colors.white,
          ),
        ),
        title: Text(
          'API Connection',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Manrope-Bold",
          ),
        ),
        backgroundColor: const Color(0xff6B39F4),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
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
                      Icon(Icons.account_balance_wallet_outlined, size: 18),
                      const SizedBox(width: 8),
                      const Text('Binance'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.currency_exchange_outlined, size: 18),
                      const SizedBox(width: 8),
                      const Text('Delta'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Binance Tab
                Consumer<BinanceProvider>(
                  builder: (context, binanceProvider, child) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        if (binanceProvider.isConnected) {
                          await binanceProvider.refreshBalance();
                        }
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header section
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: notifier.tabBar1,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.white.withValues(alpha: 0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        "assets/images/binance.jpeg",
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      binanceProvider.isConnected
                                          ? 'Connected to Binance'
                                          : 'Connect to Binance',
                                      style: TextStyle(
                                        color: notifier.textColor,
                                        fontSize: 22,
                                        fontFamily: "Manrope-Bold",
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      binanceProvider.isConnected
                                          ? 'Your Binance account is connected and ready'
                                          : 'Enter your Binance API credentials to connect your account',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: notifier.textColor
                                            .withValues(alpha: 0.7),
                                        fontSize: 14,
                                        fontFamily: "Manrope-Regular",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Error display
                              if (binanceProvider.error != null)
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color:
                                            Colors.red.withValues(alpha: 0.3)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.error_outline,
                                          color: Colors.red, size: 20),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          binanceProvider.error!,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                            fontFamily: "Manrope-Regular",
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            binanceProvider.clearError(),
                                        icon: Icon(Icons.close,
                                            color: Colors.red, size: 20),
                                      ),
                                    ],
                                  ),
                                ),

                              // Balance display (if connected)
                              if (binanceProvider.isConnected &&
                                  binanceProvider.balance != null)
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: notifier.tabBar1,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Current Balance',
                                            style: TextStyle(
                                              color: notifier.textColor,
                                              fontSize: 18,
                                              fontFamily: "Manrope-Bold",
                                            ),
                                          ),
                                          if (binanceProvider.isLoading)
                                            SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  const Color(0xff6B39F4),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: notifier.background,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Available BTC',
                                                    style: TextStyle(
                                                      color: notifier.textColor
                                                          .withValues(
                                                              alpha: 0.7),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          "Manrope-Regular",
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    '${binanceProvider.balance!.btcBalance.toStringAsFixed(8)} BTC',
                                                    style: TextStyle(
                                                      color: notifier.textColor,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "Manrope-Bold",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: notifier.background,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Locked BTC',
                                                    style: TextStyle(
                                                      color: notifier.textColor
                                                          .withValues(
                                                              alpha: 0.7),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          "Manrope-Regular",
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    '${binanceProvider.balance!.btcLocked.toStringAsFixed(8)} BTC',
                                                    style: TextStyle(
                                                      color: notifier.textColor,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "Manrope-Bold",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              // Connection form (if not connected)
                              if (!binanceProvider.isConnected)
                                Container(
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: notifier.tabBar1,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'API Credentials',
                                        style: TextStyle(
                                          color: notifier.textColor,
                                          fontSize: 18,
                                          fontFamily: "Manrope-Bold",
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      TextField(
                                        controller: _binanceApiKeyController,
                                        decoration: InputDecoration(
                                          labelText: 'API Key',
                                          labelStyle: TextStyle(
                                              color: notifier.textColor),
                                          filled: true,
                                          fillColor: notifier.background,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        style: TextStyle(
                                            color: notifier.textColor),
                                      ),
                                      const SizedBox(height: 12),
                                      TextField(
                                        controller: _binanceApiSecretController,
                                        decoration: InputDecoration(
                                          labelText: 'API Secret',
                                          labelStyle: TextStyle(
                                              color: notifier.textColor),
                                          filled: true,
                                          fillColor: notifier.background,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        obscureText: true,
                                        style: TextStyle(
                                            color: notifier.textColor),
                                      ),
                                      const SizedBox(height: 24),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed:
                                              binanceProvider.isConnecting
                                                  ? null
                                                  : () async {
                                                      if (_binanceApiKeyController
                                                              .text
                                                              .trim()
                                                              .isEmpty ||
                                                          _binanceApiSecretController
                                                              .text
                                                              .trim()
                                                              .isEmpty) {
                                                        ToastUtils.showError(
                                                          context: context,
                                                          message:
                                                              'Please enter both API key and secret',
                                                        );
                                                        return;
                                                      }

                                                      final success =
                                                          await binanceProvider
                                                              .connect(
                                                        apiKey:
                                                            _binanceApiKeyController
                                                                .text,
                                                        apiSecret:
                                                            _binanceApiSecretController
                                                                .text,
                                                      );

                                                      if (success) {
                                                        _binanceApiKeyController
                                                            .clear();
                                                        _binanceApiSecretController
                                                            .clear();
                                                        ToastUtils.showSuccess(
                                                          context: context,
                                                          message:
                                                              'Successfully connected to Binance!',
                                                        );
                                                      }
                                                    },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff6B39F4),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: binanceProvider.isConnecting
                                              ? SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                  ),
                                                )
                                              : const Text(
                                                  'Connect Binance',
                                                  style: TextStyle(
                                                    fontFamily: "Manrope-Bold",
                                                    fontSize: 16,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              // Disconnect button (if connected)
                              if (binanceProvider.isConnected)
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: notifier.tabBar1,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Connection Status',
                                        style: TextStyle(
                                          color: notifier.textColor,
                                          fontSize: 18,
                                          fontFamily: "Manrope-Bold",
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Connected to Binance',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 14,
                                              fontFamily: "Manrope-Medium",
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: binanceProvider.isLoading
                                              ? null
                                              : () async {
                                                  await binanceProvider
                                                      .disconnect();
                                                  ToastUtils.showInfo(
                                                    context: context,
                                                    message:
                                                        'Disconnected from Binance',
                                                  );
                                                },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: binanceProvider.isLoading
                                              ? SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                  ),
                                                )
                                              : const Text(
                                                  'Disconnect',
                                                  style: TextStyle(
                                                    fontFamily: "Manrope-Bold",
                                                    fontSize: 16,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Delta Tab
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: notifier.tabBar1,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/delta.png",
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Connect to Delta Exchange',
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 22,
                                  fontFamily: "Manrope-Bold",
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Enter your Delta Exchange API credentials to connect your account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      notifier.textColor.withValues(alpha: 0.7),
                                  fontSize: 14,
                                  fontFamily: "Manrope-Regular",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: notifier.tabBar1,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'API Credentials',
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 18,
                                  fontFamily: "Manrope-Bold",
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: _deltaApiKeyController,
                                decoration: InputDecoration(
                                  labelText: 'API Key',
                                  labelStyle:
                                      TextStyle(color: notifier.textColor),
                                  filled: true,
                                  fillColor: notifier.background,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(color: notifier.textColor),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: _deltaApiSecretController,
                                decoration: InputDecoration(
                                  labelText: 'API Secret',
                                  labelStyle:
                                      TextStyle(color: notifier.textColor),
                                  filled: true,
                                  fillColor: notifier.background,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                obscureText: true,
                                style: TextStyle(color: notifier.textColor),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // TODO: Implement Delta Exchange API connection
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff6B39F4),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Connect Delta',
                                    style: TextStyle(
                                      fontFamily: "Manrope-Bold",
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
