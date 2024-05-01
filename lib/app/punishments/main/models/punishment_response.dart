import 'dart:core';

class PunishmentResponse {
  final int id;
  final int? fKAssigneeId;
  final int? fKAssigneeById;
  final int? fKReqPunishmentId;
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

  PunishmentResponse({
    required this.id,
    this.fKAssigneeId,
    this.fKAssigneeById,
    this.fKReqPunishmentId,
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

  factory PunishmentResponse.fromJson(Map<String, dynamic> json) {
    return PunishmentResponse(
      id: json['Id'] as int,
      fKAssigneeId: json['FK_AssigneeId'] as int?,
      fKReqPunishmentId: json['FK_ReqPunishmentId'] as int?,
      fKAssigneeById: json['FK_AssigneeById'] as int?,
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
      'FK_AssigneeId': fKAssigneeId,
      'FK_AssigneeById': fKAssigneeById,
      'FK_ReqPunishmentId': fKReqPunishmentId,
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
