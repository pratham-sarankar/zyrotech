import 'package:crowwn/features/brokers/domain/models/binance_balance.dart';
import 'package:crowwn/features/brokers/domain/models/binance_credentials.dart';
import 'package:crowwn/services/auth_storage_service.dart';
import 'package:crowwn/services/binance_service.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:

class BinanceProvider extends ChangeNotifier {
  final BinanceService _binanceService;
  final AuthStorageService _authStorage;

  BinanceProvider({
    required BinanceService binanceService,
    required AuthStorageService authStorage,
  })  : _binanceService = binanceService,
        _authStorage = authStorage;

  BinanceCredentials? _credentials;
  BinanceBalance? _balance;
  bool _isLoading = false;
  bool _isConnecting = false;
  String? _error;

  // Getters
  BinanceCredentials? get credentials => _credentials;
  BinanceBalance? get balance => _balance;
  bool get isLoading => _isLoading;
  bool get isConnecting => _isConnecting;
  String? get error => _error;
  bool get isConnected => _credentials != null;

  /// Initialize the provider by loading stored credentials
  Future<void> initialize() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _credentials = await _authStorage.getBinanceCredentials();
      if (_credentials != null) {
        await fetchBalance();
      }
    } catch (e) {
      _error = 'Failed to load stored credentials';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Connect to Binance with new credentials
  Future<bool> connect({
    required String apiKey,
    required String apiSecret,
  }) async {
    _isConnecting = true;
    _error = null;
    notifyListeners();

    try {
      final credentials = BinanceCredentials(
        apiKey: apiKey.trim(),
        apiSecret: apiSecret.trim(),
      );

      // Test the credentials first
      final isValid = await _binanceService.testCredentials(credentials);
      if (!isValid) {
        _error =
            'Invalid API credentials. Please check your API key and secret.';
        return false;
      }

      // Store credentials locally
      await _authStorage.setBinanceCredentials(credentials);
      _credentials = credentials;

      // Fetch initial balance
      await fetchBalance();

      return true;
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to connect to Binance: ${e.toString()}';
      }
      return false;
    } finally {
      _isConnecting = false;
      notifyListeners();
    }
  }

  /// Disconnect from Binance
  Future<void> disconnect() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authStorage.clearBinanceCredentials();
      _credentials = null;
      _balance = null;
      _error = null;
    } catch (e) {
      _error = 'Failed to disconnect: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch current balance
  Future<void> fetchBalance({bool force = false}) async {
    if (_credentials == null) {
      _error = 'No Binance credentials found';
      notifyListeners();
      return;
    }

    if (_balance != null && !force) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _balance = await _binanceService.checkBalance(_credentials!);
    } catch (e) {
      if (e is ApiError) {
        _error = e.message;
      } else {
        _error = 'Failed to fetch balance: ${e.toString()}';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Refresh balance (alias for fetchBalance with force=true)
  Future<void> refreshBalance() async {
    await fetchBalance(force: true);
  }

  /// Clear any error messages
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
