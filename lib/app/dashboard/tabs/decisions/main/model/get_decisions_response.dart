import 'dart:core';

class DecisionsResponse {
  final int id;
  final int fkAssigneeId;
  final int fkAssigneeById;
  final int fkReqDecisionId;
  final String? assigneeName;
  final String byAssigneeName;
  final String subject;
  final String imagePath;
  final String creationDate;
  final String lastModifiedDate;
  final bool isActive;
  final bool isDeleted;

  DecisionsResponse({
    required this.id,
    required this.fkAssigneeId,
    required this.fkAssigneeById,
    required this.fkReqDecisionId,
    required this.assigneeName,
    required this.byAssigneeName,
    required this.subject,
    required this.imagePath,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
  });

  factory DecisionsResponse.fromJson(Map<String, dynamic> json) {
    return DecisionsResponse(
      id: json['id'] as int,
      fkAssigneeId: json['fK_AssigneeId'] as int,
      fkAssigneeById: json['fK_AssigneeById'] as int,
      fkReqDecisionId: json['fK_ReqDecisionId'] as int,
      assigneeName: json['assigneeName'] as String?,
      byAssigneeName: json['byAssigneeName'] as String,
      subject: json['subject'] as String,
      imagePath: json['imagePath'] as String,
      creationDate: json['creationDate'] as String,
      lastModifiedDate: json['lastModifiedDate'] as String,
      isActive: json['isActive'] as bool,
      isDeleted: json['isDeleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fK_AssigneeId': fkAssigneeId,
      'fK_AssigneeById': fkAssigneeById,
      'fK_ReqDecisionId': fkReqDecisionId,
      'assigneeName': assigneeName,
      'byAssigneeName': byAssigneeName,
      'subject': subject,
      'imagePath': imagePath,
      'creationDate': creationDate,
      'lastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}
