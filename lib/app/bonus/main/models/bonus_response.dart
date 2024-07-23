import 'dart:convert';
import 'dart:core';

import 'package:request_hr/app/bonus/main/models/bonus_chart.dart';

BonusResponse bonusResponseFromJson(String str) =>
    BonusResponse.fromJson(json.decode(str));

String bonusResponseToJson(BonusResponse data) => json.encode(data.toJson());

class BonusResponse {
  List<Bonus> bonuses;
  List<BonusChart> chart;
  double total;
  double percent;

  BonusResponse({
    required this.bonuses,
    required this.chart,
    required this.total,
    required this.percent,
  });

  factory BonusResponse.fromJson(Map<String, dynamic> json) => BonusResponse(
        bonuses:
            List<Bonus>.from(json["bonuses"].map((x) => Bonus.fromJson(x))),
        chart: List<BonusChart>.from(
            json["chart"].map((x) => BonusChart.fromJson(x))),
        total: double.parse(json["total"].toString()),
        percent: double.parse(json["percent"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "bonuses": List<Bonus>.from(bonuses.map((x) => x.toJson())),
        "chart": List<BonusChart>.from(chart.map((x) => x.toJson())),
      };
}

class Bonus {
  final int id;
  final int? fKHrAssigneeId;
  final int? fKHrAssigneeById;
  final int? fKReqBonusId;
  final String? assigneeName;
  final String? byAssigneeName;
  final String? imagePath;
  final String? subject;
  final String? description;
  final double? amount;
  final String? creationDate;
  final String? lastModifiedDate;
  final bool? isActive;
  final bool? isDeleted;

  Bonus({
    required this.id,
    this.fKHrAssigneeById,
    this.fKHrAssigneeId,
    this.fKReqBonusId,
    this.assigneeName,
    this.byAssigneeName,
    this.imagePath,
    this.subject,
    this.description,
    this.amount,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
  });

  factory Bonus.fromJson(Map<String, dynamic> json) {
    return Bonus(
      id: json['id'] as int,
      fKHrAssigneeId: json['fK_HrAssigneeId'] as int?,
      fKHrAssigneeById: json['fK_HrAssigneeById'] as int?,
      fKReqBonusId: json['fK_ReqBonusId'] as int?,
      creationDate: json['creationDate'] as String?,
      byAssigneeName: json['byAssigneeName'] as String?,
      subject: json['subject'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as double?,
      imagePath: json['imagePath'] as String?,
      assigneeName: json['assigneeName'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fK_HrAssigneeId': fKHrAssigneeId,
      'fK_HrAssigneeById': fKHrAssigneeById,
      'fK_ReqBonusId': fKReqBonusId,
      'creationDate': creationDate,
      'byAssigneeName': byAssigneeName,
      'subject': subject,
      'description': description,
      'amount': amount,
      'imagePath': imagePath,
      'assigneeName': assigneeName,
      'lastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}
