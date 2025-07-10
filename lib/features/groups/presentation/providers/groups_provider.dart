import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crowwn/features/groups/data/models/group_model.dart';
import 'package:crowwn/services/api_service.dart';

class GroupsProvider extends ChangeNotifier {
  final ApiService _apiService;

  GroupsProvider(this._apiService);

  List<GroupModel> _groups = [];
  bool _isLoading = false;
  String? _error;

  List<GroupModel> get groups => _groups;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchGroups() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.get('/api/groups');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'success') {
          final groupsList = data['data'] as List;
          _groups = groupsList
              .map((groupJson) => GroupModel.fromJson(groupJson))
              .toList();
        } else {
          _error = data['message'] ?? 'Failed to fetch groups';
        }
      } else {
        _error = 'Failed to fetch groups: ${response.statusCode}';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  GroupModel? getGroupById(String id) {
    try {
      return _groups.firstWhere((group) => group.id == id);
    } catch (e) {
      return null;
    }
  }
}
