class ChairmanBonusChart {
  final int count;
  final int month;
  final String year;
  final String monthName;

  ChairmanBonusChart({
    required this.count,
    required this.month,
    required this.year,
    required this.monthName,
  });

  factory ChairmanBonusChart.fromJson(Map<String, dynamic> json) {
    return ChairmanBonusChart(
      count: json['count'] as int,
      month: json['month'] as int,
      year: json['year'] as String,
      monthName: json['monthName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['month'] = month;
    data['year'] = year;
    data['monthName'] = monthName;
    return data;
  }
}
