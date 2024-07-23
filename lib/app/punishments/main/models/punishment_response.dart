import 'dart:convert';
import 'dart:core';

import 'package:request_hr/app/punishments/main/models/punishment_chart.dart';

PunishmentResponse punishmentResponseFromJson(String str) =>
    PunishmentResponse.fromJson(json.decode(str));

String punishmentResponseToJson(PunishmentResponse data) =>
    json.encode(data.toJson());

class PunishmentResponse {
  List<Punishment> punishments;
  List<PunishmentChart> chart;
  double total;
  double percent;

  PunishmentResponse({
    required this.punishments,
    required this.chart,
    required this.total,
    required this.percent,
  });

  factory PunishmentResponse.fromJson(Map<String, dynamic> json) =>
      PunishmentResponse(
        punishments: List<Punishment>.from(
            json["punishments"].map((x) => Punishment.fromJson(x))),
        chart: List<PunishmentChart>.from(
            json["chart"].map((x) => PunishmentChart.fromJson(x))),
        total: double.parse(json["total"].toString()),
        percent: double.parse(json["percent"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "punishments":
            List<Punishment>.from(punishments.map((x) => x.toJson())),
        "chart": List<PunishmentChart>.from(chart.map((x) => x.toJson())),
      };
}

class Punishment {
  final int id;
  final int? fKAssigneeId;
  final int? fKAssigneeById;
  final int? fKReqPunishmentId;
  final String? assigneeName;
  final String? byAssigneeName;
  final String? byAssigneeNameEn;
  final String? jobName;
  final String? jobNameEn;
  final String? imagePath;
  final String? subject;
  final String? description;
  final double? amount;
  final String? creationDate;
  final String? lastModifiedDate;
  final bool? isActive;
  final bool? isDeleted;

  Punishment({
    required this.id,
    this.fKAssigneeId,
    this.fKAssigneeById,
    this.fKReqPunishmentId,
    this.assigneeName,
    this.byAssigneeName,
    this.byAssigneeNameEn,
    this.jobName,
    this.jobNameEn,
    this.imagePath,
    this.subject,
    this.description,
    this.amount,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
  });

  factory Punishment.fromJson(Map<String, dynamic> json) {
    return Punishment(
      id: json['id'] as int,
      fKAssigneeId: json['fK_AssigneeId'] as int?,
      fKAssigneeById: json['fK_AssigneeById'] as int?,
      fKReqPunishmentId: json['fK_ReqPunishmentId'] as int?,
      assigneeName: json['assigneeName'] as String?,
      byAssigneeName: json['byAssigneeName'] as String?,
      byAssigneeNameEn: json['byAssigneeNameEn'] as String?,
      jobName: json['jobName'] as String?,
      jobNameEn: json['jobNameEn'] as String?,
      imagePath: json['imagePath'] as String?,
      subject: json['subject'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as double?,
      creationDate: json['creationDate'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fK_AssigneeId': fKAssigneeId,
      'fK_AssigneeById': fKAssigneeById,
      'fK_ReqPunishmentId': fKReqPunishmentId,
      'creationDate': creationDate,
      'byAssigneeName': byAssigneeName,
      'byAssigneeNameEn': byAssigneeNameEn,
      'jobName': jobName,
      'jobNameEn': jobNameEn,
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
