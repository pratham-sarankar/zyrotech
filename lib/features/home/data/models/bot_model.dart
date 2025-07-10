// Project imports:
import 'package:crowwn/utils/api_error.dart';

class BotModel {
  final String id;
  final String name;
  final String description;
  final String performanceDuration;
  final int recommendedCapital;
  final String script;
  final DateTime createdAt;
  final DateTime updatedAt;
  final GroupInfo group;

  BotModel({
    required this.id,
    required this.name,
    required this.description,
    required this.performanceDuration,
    required this.recommendedCapital,
    required this.script,
    required this.createdAt,
    required this.updatedAt,
    required this.group,
  });

  factory BotModel.fromJson(Map<String, dynamic> json) {
    try {
      return BotModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        performanceDuration: json['performanceDuration'] as String,
        recommendedCapital: json['recommendedCapital'] as int,
        script: json['script'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        group: GroupInfo.fromJson(json['group'] as Map<String, dynamic>),
      );
    } catch (e) {
      throw ApiError.fromString('Failed to parse bot data');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'performanceDuration': performanceDuration,
      'recommendedCapital': recommendedCapital,
      'script': script,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'group': group.toJson(),
    };
  }
}

class GroupInfo {
  final String id;
  final String name;

  GroupInfo({
    required this.id,
    required this.name,
  });

  factory GroupInfo.fromJson(Map<String, dynamic> json) {
    return GroupInfo(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
