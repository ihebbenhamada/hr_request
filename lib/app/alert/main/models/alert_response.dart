import 'dart:convert';
import 'dart:core';

import 'package:request_hr/app/alert/main/models/alert_chart.dart';

AlertResponse alertResponseFromJson(String str) =>
    AlertResponse.fromJson(json.decode(str));

String alertResponseToJson(AlertResponse data) => json.encode(data.toJson());

class AlertResponse {
  List<Alert> alerts;
  List<AlertChart> chart;

  AlertResponse({
    required this.alerts,
    required this.chart,
  });

  factory AlertResponse.fromJson(Map<String, dynamic> json) => AlertResponse(
        alerts: List<Alert>.from(json["alerts"].map((x) => Alert.fromJson(x))),
        chart: List<AlertChart>.from(
            json["chart"].map((x) => AlertChart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "alerts": List<Alert>.from(alerts.map((x) => x.toJson())),
        "chart": List<AlertChart>.from(chart.map((x) => x.toJson())),
      };
}

class Alert {
  final int id;
  final int? fKHrAssigneeId;
  final int? fKHrAssigneeById;
  final int? fKReqAlertId;
  final String? assigneeName;
  final String? byAssigneeName;
  final String? imagePath;
  final String? subject;
  final String? creationDate;
  final String? lastModifiedDate;
  final bool? isActive;
  final bool? isDeleted;

  Alert({
    required this.id,
    this.fKHrAssigneeById,
    this.fKHrAssigneeId,
    this.fKReqAlertId,
    this.assigneeName,
    this.byAssigneeName,
    this.imagePath,
    this.subject,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'] as int,
      fKHrAssigneeId: json['fK_HrAssigneeId'] as int?,
      fKHrAssigneeById: json['fK_HrAssigneeById'] as int?,
      fKReqAlertId: json['fK_ReqAlertId'] as int?,
      creationDate: json['creationDate'] as String?,
      byAssigneeName: json['byAssigneeName'] as String?,
      subject: json['subject'] as String?,
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
      'fK_ReqAlertId': fKReqAlertId,
      'creationDate': creationDate,
      'byAssigneeName': byAssigneeName,
      'subject': subject,
      'imagePath': imagePath,
      'assigneeName': assigneeName,
      'lastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}
