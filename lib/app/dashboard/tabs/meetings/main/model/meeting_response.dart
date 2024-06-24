import 'dart:core';

import 'package:request_hr/api/models/public/meeting_point.dart';

class MeetingResponse {
  final int id;
  final String? assigneeByName;
  final String? assigneeName;
  final String? creationDate;
  final String? subject;
  final String? meetingDate;
  final String? lastModifiedDate;
  final String? meetingTitle;
  final int? fkReqStatusId;
  final int? fKCreatorId;
  final int? fKAssigneeById;
  final int? submitType;
  final bool? isActive;
  final bool? isDeleted;
  List<int?>? hdnAttachmentIds = [];
  final int? fKHrDepartmentId;
  List<int?>? assignees = [];
  List<int?>? departmentsIds = [];
  final List<MeetingPoint>? meetingPoints;

  MeetingResponse({
    required this.id,
    this.assigneeByName,
    this.creationDate,
    this.subject,
    this.meetingDate,
    this.meetingTitle,
    this.fkReqStatusId,
    this.assigneeName,
    this.lastModifiedDate,
    this.fKCreatorId,
    this.fKAssigneeById,
    this.submitType,
    this.isActive,
    this.isDeleted,
    this.hdnAttachmentIds,
    this.fKHrDepartmentId,
    this.assignees,
    this.departmentsIds,
    this.meetingPoints,
  });

  factory MeetingResponse.fromJson(Map<String, dynamic> json) {
    return MeetingResponse(
      id: json['id'] as int,
      assigneeByName: json['assigneeByName'] as String?,
      creationDate: json['creationDate'] as String?,
      subject: json['subject'] as String?,
      meetingDate: json['meetingDate'] as String?,
      meetingTitle: json['meetingTitle'] as String?,
      fkReqStatusId: json['fK_ReqStatusId'] as int?,
      assigneeName: json['assigneeName'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      fKCreatorId: json['fK_CreatorId'] as int?,
      fKAssigneeById: json['fK_AssigneeById'] as int?,
      submitType: json['submitType'] as int?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      hdnAttachmentIds: json['hdnAttachmentIds'] as List<int>?,
      fKHrDepartmentId: json['fK_HrDepartmentId'] as int?,
      assignees: json['assignees'] as List<int>?,
      departmentsIds: json['departmentsIds'] as List<int>?,
      meetingPoints: json['meetingPoints'] as List<MeetingPoint>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'assigneeByName': assigneeByName,
      'creationDate': creationDate,
      'meetingDate': meetingDate,
      'meetingTitle': meetingTitle,
      'subject': subject,
      'fK_ReqStatusId': fkReqStatusId,
      'assigneeName': assigneeName,
      'lastModifiedDate': lastModifiedDate,
      'fK_CreatorId': fKCreatorId,
      'fK_AssigneeById': fKAssigneeById,
      'submitType': submitType,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'hdnAttachmentIds': hdnAttachmentIds,
      'fK_HrDepartmentId': fKHrDepartmentId,
      'assignees': assignees,
      'departmentsIds': departmentsIds,
      'meetingPoints': meetingPoints,
    };
  }
}
