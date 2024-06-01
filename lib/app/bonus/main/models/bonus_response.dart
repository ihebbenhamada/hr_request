import 'dart:convert';
import 'dart:core';

import 'package:request_hr/app/bonus/main/models/bonus_chart.dart';

BonusResponse bonusResponseFromJson(String str) =>
    BonusResponse.fromJson(json.decode(str));

String bonusResponseToJson(BonusResponse data) => json.encode(data.toJson());

class BonusResponse {
  List<Bonus> bonuses;
  List<BonusChart> chart;

  BonusResponse({
    required this.bonuses,
    required this.chart,
  });

  factory BonusResponse.fromJson(Map<String, dynamic> json) => BonusResponse(
        bonuses:
            List<Bonus>.from(json["bonuses"].map((x) => Bonus.fromJson(x))),
        chart: List<BonusChart>.from(
            json["chart"].map((x) => BonusChart.fromJson(x))),
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
      id: json['Id'] as int,
      fKHrAssigneeId: json['FK_HrAssigneeId'] as int?,
      fKHrAssigneeById: json['FK_HrAssigneeById'] as int?,
      creationDate: json['CreationDate'] as String?,
      byAssigneeName: json['ByAssigneeName'] as String?,
      subject: json['Subject'] as String?,
      description: json['Description'] as String?,
      amount: json['Amount'] as double?,
      imagePath: json['ImagePath'] as String?,
      assigneeName: json['AssigneeName'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      isActive: json['IsActive'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'FK_HrAssigneeId': fKHrAssigneeId,
      'FK_HrAssigneeById': fKHrAssigneeById,
      'CreationDate': creationDate,
      'ByAssigneeName': byAssigneeName,
      'Subject': subject,
      'Description': description,
      'Amount': amount,
      'ImagePath': imagePath,
      'AssigneeName': assigneeName,
      'LastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}
