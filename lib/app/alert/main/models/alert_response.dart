import 'dart:core';

class AlertResponse {
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

  AlertResponse({
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

  factory AlertResponse.fromJson(Map<String, dynamic> json) {
    return AlertResponse(
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
