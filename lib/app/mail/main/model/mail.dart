class Mail {
  final int? id;
  final int? fKHrEmployeeId;
  final String? senderName;
  final String? subject;
  final String? description;
  final String? reply;
  final String? filePath;
  final int? fKReqStatusId;
  final int? fKCreatorId;
  final int? parentId;
  final String? creationDate;
  final String? lastModifiedDate;
  final bool? isActive;
  final bool? isDeleted;
  bool isSelected;

  Mail({
    required this.id,
    required this.fKHrEmployeeId,
    required this.senderName,
    required this.subject,
    required this.description,
    required this.reply,
    required this.filePath,
    required this.fKReqStatusId,
    this.fKCreatorId,
    this.parentId,
    required this.isSelected,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isDeleted,
    required this.isActive,
  });

  factory Mail.fromJson(Map<String, dynamic> json) {
    return Mail(
      id: json['id'] as int?,
      fKHrEmployeeId: json['fK_HrEmployeeId'] as int?,
      senderName: json['senderName'] as String?,
      subject: json['subject'] as String?,
      description: json['description'] as String?,
      reply: json['reply'] as String?,
      filePath: json['filePath'] as String?,
      fKReqStatusId: json['fK_ReqStatusId'] as int?,
      fKCreatorId: json['fK_CreatorId'] as int?,
      parentId: json['parentId'] as int?,
      creationDate: json['creationDate'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      isSelected: false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fK_HrEmployeeId'] = fKHrEmployeeId;
    data['senderName'] = senderName;
    data['subject'] = subject;
    data['description'] = description;
    data['reply'] = reply;
    data['filePath'] = filePath;
    data['fK_ReqStatusId'] = fKReqStatusId;
    data['fK_CreatorId'] = fKCreatorId;
    data['parentId'] = parentId;
    data['creationDate'] = creationDate;
    data['lastModifiedDate'] = lastModifiedDate;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
