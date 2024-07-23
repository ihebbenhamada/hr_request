class RatedEmployeeChart {
  final int count;
  final String name;
  final String image;

  RatedEmployeeChart({
    required this.count,
    required this.name,
    required this.image,
  });

  factory RatedEmployeeChart.fromJson(Map<String, dynamic> json) {
    return RatedEmployeeChart(
      count: json['count'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
