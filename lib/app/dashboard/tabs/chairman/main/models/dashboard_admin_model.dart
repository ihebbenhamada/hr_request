// To parse this JSON data, do
//
//     final dashboardAdminModel = dashboardAdminModelFromJson(jsonString);

import 'dart:convert';

DashboardAdminModel dashboardAdminModelFromJson(String str) =>
    DashboardAdminModel.fromJson(json.decode(str));

String dashboardAdminModelToJson(DashboardAdminModel data) =>
    json.encode(data.toJson());

class DashboardAdminModel {
  List<RatedEvaluation> mostRatedEvaluations;
  List<RatedEvaluation> lowRatedEvaluations;
  List<Statistic> bonuStatistics;
  List<Statistic> punishmentStatistics;
  List<YearVacation> yearVacations;
  int totalAlerts;

  DashboardAdminModel({
    required this.mostRatedEvaluations,
    required this.lowRatedEvaluations,
    required this.bonuStatistics,
    required this.punishmentStatistics,
    required this.yearVacations,
    required this.totalAlerts,
  });

  factory DashboardAdminModel.fromJson(Map<String, dynamic> json) =>
      DashboardAdminModel(
        mostRatedEvaluations: List<RatedEvaluation>.from(
            json["mostRatedEvaluations"]
                .map((x) => RatedEvaluation.fromJson(x))),
        lowRatedEvaluations: List<RatedEvaluation>.from(
            json["lowRatedEvaluations"]
                .map((x) => RatedEvaluation.fromJson(x))),
        bonuStatistics: List<Statistic>.from(
            json["bonuStatistics"].map((x) => Statistic.fromJson(x))),
        punishmentStatistics: List<Statistic>.from(
            json["punishmentStatistics"].map((x) => Statistic.fromJson(x))),
        yearVacations: List<YearVacation>.from(
            json["yearVacations"].map((x) => YearVacation.fromJson(x))),
        totalAlerts: json["totalAlerts"],
      );

  Map<String, dynamic> toJson() => {
        "mostRatedEvaluations":
            List<dynamic>.from(mostRatedEvaluations.map((x) => x.toJson())),
        "lowRatedEvaluations":
            List<dynamic>.from(lowRatedEvaluations.map((x) => x.toJson())),
        "bonuStatistics":
            List<dynamic>.from(bonuStatistics.map((x) => x.toJson())),
        "punishmentStatistics":
            List<dynamic>.from(punishmentStatistics.map((x) => x.toJson())),
        "yearVacations":
            List<dynamic>.from(yearVacations.map((x) => x.toJson())),
        "totalAlerts": totalAlerts,
      };
}

class Statistic {
  String month;
  String year;
  double totalAmount;

  Statistic({
    required this.month,
    required this.year,
    required this.totalAmount,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        month: json["month"],
        year: json["year"],
        totalAmount: json["totalAmount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "year": year,
        "totalAmount": totalAmount,
      };
}

class RatedEvaluation {
  int fKHrEmployeeId;
  String fullNameAr;
  String fullNmaeEn;
  String imgPath;
  int fKHrEmployeeEvaluationId;
  double degreeScale;

  RatedEvaluation({
    required this.fKHrEmployeeId,
    required this.fullNameAr,
    required this.fullNmaeEn,
    required this.imgPath,
    required this.fKHrEmployeeEvaluationId,
    required this.degreeScale,
  });

  factory RatedEvaluation.fromJson(Map<String, dynamic> json) =>
      RatedEvaluation(
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        fullNameAr: json["fullNameAr"],
        fullNmaeEn: json["fullNmaeEn"],
        imgPath: json["imgPath"],
        fKHrEmployeeEvaluationId: json["fK_HrEmployeeEvaluationId"],
        degreeScale: json["degreeScale"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "fK_HrEmployeeId": fKHrEmployeeId,
        "fullNameAr": fullNameAr,
        "fullNmaeEn": fullNmaeEn,
        "imgPath": imgPath,
        "fK_HrEmployeeEvaluationId": fKHrEmployeeEvaluationId,
        "degreeScale": degreeScale,
      };
}

class YearVacation {
  String vacationType;
  double consideredDays;

  YearVacation({
    required this.vacationType,
    required this.consideredDays,
  });

  factory YearVacation.fromJson(Map<String, dynamic> json) => YearVacation(
        vacationType: json["vacationType"],
        consideredDays: json["consideredDays"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "vacationType": vacationType,
        "consideredDays": consideredDays,
      };
}
