import 'package:flutter/material.dart';
import '../../data/models/profile_model.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _repository;
  ProfileModel? _profile;
  bool _isLoading = false;
  String? _error;
  DateTime? _lastFetchTime;
  static const Duration _cacheDuration = Duration(minutes: 5);

  ProfileProvider(this._repository);

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get error => _error;

  bool get _shouldFetchProfile {
    if (_profile == null) return true;
    if (_lastFetchTime == null) return true;
    return DateTime.now().difference(_lastFetchTime!) > _cacheDuration;
  }

  Future<void> fetchProfile({bool forceRefresh = false}) async {
    // Don't fetch if we have cached data and it's not expired
    if (!forceRefresh && !_shouldFetchProfile) {
      return;
    }

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _profile = await _repository.getProfile();
      _lastFetchTime = DateTime.now();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Method to force refresh profile data
  Future<void> refreshProfile() async {
    await fetchProfile(forceRefresh: true);
  }

  // Method to clear cached data
  void clearCache() {
    _profile = null;
    _lastFetchTime = null;
    notifyListeners();
  }
} 