import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crowwn/features/profile/data/models/profile_model.dart';
import 'package:crowwn/utils/api_error.dart';
import 'package:crowwn/features/profile/domain/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _repository;
  ProfileModel? _profile;
  bool _isLoading = false;
  String? _error;

  ProfileProvider(this._repository);

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProfile() async {
    if (_profile != null) return; // Return cached profile if available

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 3));
      _profile = await _repository.getProfile();
    } on ApiError catch (e) {
      _error = e.message;
    } catch (e) {
      _error = 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _profile = await _repository.updateProfile(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
      );
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      return false;
    } catch (e) {
      _error = 'An unexpected error occurred';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearProfile() {
    _profile = null;
    _error = null;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
