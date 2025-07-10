class SubscriptionBotModel {
  final String id;
  final String name;
  final String description;
  final String performanceDuration;
  final int recommendedCapital;
  final String script;

  SubscriptionBotModel({
    required this.id,
    required this.name,
    required this.description,
    required this.performanceDuration,
    required this.recommendedCapital,
    required this.script,
  });

  factory SubscriptionBotModel.fromJson(Map<String, dynamic> json) {
    try {
      return SubscriptionBotModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        performanceDuration: json['performanceDuration'] as String,
        recommendedCapital: json['recommendedCapital'] as int,
        script: json['script'] as String,
      );
    } catch (e) {
      throw Exception('Failed to parse subscription bot data: $e');
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
    };
  }
}
