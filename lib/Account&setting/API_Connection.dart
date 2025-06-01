import 'package:flutter/material.dart';
import '../Dark mode.dart';
import 'package:provider/provider.dart';

class API_Connection extends StatefulWidget {
  const API_Connection({super.key});

  @override
  State<API_Connection> createState() => _API_ConnectionState();
}

class _API_ConnectionState extends State<API_Connection> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ColorNotifire notifier = ColorNotifire();

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
                                  color: Colors.white.withOpacity(0.1),
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
                                'Connect to Binance',
                                style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 22,
                                  fontFamily: "Manrope-Bold",
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Enter your Binance API credentials to connect your account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: notifier.textColor.withOpacity(0.7),
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
                                decoration: InputDecoration(
                                  labelText: 'API Key',
                                  labelStyle: TextStyle(color: notifier.textColor),
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
                                decoration: InputDecoration(
                                  labelText: 'API Secret',
                                  labelStyle: TextStyle(color: notifier.textColor),
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
                                    // TODO: Implement Binance API connection
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff6B39F4),
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
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
                      ],
                    ),
                  ),
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
                                  color: Colors.white.withOpacity(0.1),
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
                                  color: notifier.textColor.withOpacity(0.7),
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
                                decoration: InputDecoration(
                                  labelText: 'API Key',
                                  labelStyle: TextStyle(color: notifier.textColor),
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
                                decoration: InputDecoration(
                                  labelText: 'API Secret',
                                  labelStyle: TextStyle(color: notifier.textColor),
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
                                    padding: const EdgeInsets.symmetric(vertical: 16),
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