import 'package:request_hr/app/evaluations/main/models/evaluation.dart';

class EvaluationResponse {
  final List<Evaluation>? listHrEmployeeEvaluations;
  final List<ListEmployeeEvaluationChart>? listEmployeeEvaluationChart;
  String? totalMonthDegreeScale;

  EvaluationResponse({
    this.listHrEmployeeEvaluations,
    this.listEmployeeEvaluationChart,
    this.totalMonthDegreeScale,
  });

  factory EvaluationResponse.fromJson(Map<String, dynamic> json) {
    return EvaluationResponse(
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
  final double monthDegreeScalePercentage;
  final int month;
  final int year;

  ListEmployeeEvaluationChart(
      {required this.monthDegreeScalePercentage,
      required this.month,
      required this.year});

  factory ListEmployeeEvaluationChart.fromJson(Map<String, dynamic> json) {
    return ListEmployeeEvaluationChart(
      monthDegreeScalePercentage:
          double.parse(json['monthDegreeScalePercentage'].toString()),
      month: json['month'] as int,
      year: json['year'] as int,
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
