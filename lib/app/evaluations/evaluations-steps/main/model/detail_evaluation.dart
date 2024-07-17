// To parse this JSON data, do
//
//     final detailEvaluation = detailEvaluationFromJson(jsonString);

import 'dart:convert';

List<DetailEvaluation> detailEvaluationFromJson(String str) =>
    List<DetailEvaluation>.from(
        json.decode(str).map((x) => DetailEvaluation.fromJson(x)));

String detailEvaluationToJson(List<DetailEvaluation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailEvaluation {
  int fkHrEvaluationFormItemId;
  int fkHrEvaluationScaleId;
  double degreeScale;
  String? recommendationText;
  int fkCreatorId;
  String creationDate;
  String lastModifiedDate;
  bool isDeleted;

  DetailEvaluation({
    required this.fkHrEvaluationFormItemId,
    required this.fkHrEvaluationScaleId,
    required this.degreeScale,
    required this.recommendationText,
    required this.fkCreatorId,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isDeleted,
  });

  factory DetailEvaluation.fromJson(Map<String, dynamic> json) =>
      DetailEvaluation(
        fkHrEvaluationFormItemId: json["FK_HrEvaluationFormItemId"] as int,
        fkHrEvaluationScaleId: json["FK_HrEvaluationScaleId"] as int,
        degreeScale: json["DegreeScale"] as double,
        recommendationText: json["RecommendationText"] as String?,
        fkCreatorId: json["FK_CreatorId"] as int,
        creationDate: json["CreationDate"] as String,
        lastModifiedDate: json["LastModifiedDate"] as String,
        isDeleted: json["IsDeleted"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "FK_HrEvaluationFormItemId": fkHrEvaluationFormItemId,
        "FK_HrEvaluationScaleId": fkHrEvaluationScaleId,
        "DegreeScale": degreeScale,
        "RecommendationText": recommendationText,
        "FK_CreatorId": fkCreatorId,
        "CreationDate": creationDate,
        "LastModifiedDate": lastModifiedDate,
        "IsDeleted": isDeleted,
      };
}
