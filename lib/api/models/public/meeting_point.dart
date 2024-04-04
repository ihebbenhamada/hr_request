class MeetingPoint {
  final String pointText;

  MeetingPoint({
    required this.pointText,
  });

  factory MeetingPoint.fromJson(Map<String, dynamic> json) {
    return MeetingPoint(
      pointText: json['pointText'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pointText': pointText,
    };
  }
}
