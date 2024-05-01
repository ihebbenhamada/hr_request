class PunishmentChart {
  final int count;
  final int month;
  final int year;

  PunishmentChart({
    required this.count,
    required this.month,
    required this.year,
  });

  factory PunishmentChart.fromJson(Map<String, dynamic> json) {
    return PunishmentChart(
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
