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
      id: json['Id'] as int,
      fKHrAssigneeId: json['FK_HrAssigneeId'] as int?,
      fKHrAssigneeById: json['FK_HrAssigneeById'] as int?,
      fKReqAlertId: json['FK_ReqAlertId'] as int?,
      creationDate: json['CreationDate'] as String?,
      byAssigneeName: json['ByAssigneeName'] as String?,
      subject: json['Subject'] as String?,
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
      'FK_ReqAlertId': fKReqAlertId,
      'CreationDate': creationDate,
      'ByAssigneeName': byAssigneeName,
      'Subject': subject,
      'ImagePath': imagePath,
      'AssigneeName': assigneeName,
      'LastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}
