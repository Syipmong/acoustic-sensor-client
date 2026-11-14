class Alert {
  final int nodeId;
  final double latitude;
  final double longitude;
  final int threatClass;
  final int confidenceScore;

  Alert({
    required this.nodeId,
    required this.latitude,
    required this.longitude,
    required this.threatClass,
    required this.confidenceScore,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      nodeId: json['node_id'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      threatClass: json['threat_class'] as int,
      confidenceScore: json['confidence_score'] as int,
    );
  }
}
