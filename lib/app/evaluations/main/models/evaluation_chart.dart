import 'package:request_hr/app/evaluations/main/models/evaluation.dart';

class EvaluationChart {
  final List<Evaluation>? listHrEmployeeEvaluations;
  final List<ListEmployeeEvaluationChart>? listEmployeeEvaluationChart;
  String? totalMonthDegreeScale;

  EvaluationChart({
    this.listHrEmployeeEvaluations,
    this.listEmployeeEvaluationChart,
    this.totalMonthDegreeScale,
  });

  factory EvaluationChart.fromJson(Map<String, dynamic> json) {
    return EvaluationChart(
      listHrEmployeeEvaluations:
          (json['listHrEmployeeEvaluations'] as List<dynamic>)
              .map((eval) => Evaluation.fromJson(eval))
              .toList(),
      listEmployeeEvaluationChart: (json['listEmployeeEvaluationChart']
              as List<dynamic>)
          .map((evalChart) => ListEmployeeEvaluationChart.fromJson(evalChart))
          .toList(),
      totalMonthDegreeScale: json['totalMonthDegreeScale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listHrEmployeeEvaluations != null) {
      data['listHrEmployeeEvaluations'] =
          listHrEmployeeEvaluations!.map((v) => v.toJson()).toList();
    }
    if (listEmployeeEvaluationChart != null) {
      data['listEmployeeEvaluationChart'] =
          listEmployeeEvaluationChart!.map((v) => v.toJson()).toList();
    }
    data['totalMonthDegreeScale'] = totalMonthDegreeScale;
    return data;
  }
}

class ListEmployeeEvaluationChart {
  final int? monthDegreeScalePercentage;
  final int? month;
  final int? year;

  ListEmployeeEvaluationChart(
      {this.monthDegreeScalePercentage, this.month, this.year});

  factory ListEmployeeEvaluationChart.fromJson(Map<String, dynamic> json) {
    return ListEmployeeEvaluationChart(
      monthDegreeScalePercentage: json['monthDegreeScalePercentage'] as int?,
      month: json['month'] as int?,
      year: json['year'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['monthDegreeScalePercentage'] = monthDegreeScalePercentage;
    data['month'] = month;
    data['year'] = year;
    return data;
  }
}