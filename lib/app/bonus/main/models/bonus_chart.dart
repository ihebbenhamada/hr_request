class BonusChart {
  final int count;
  final int month;
  final int year;

  BonusChart({
    required this.count,
    required this.month,
    required this.year,
  });

  factory BonusChart.fromJson(Map<String, dynamic> json) {
    return BonusChart(
      count: json['count'] as int,
      month: json['month'] as int,
      year: json['year'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['month'] = month;
    data['year'] = year;
    return data;
  }
}
