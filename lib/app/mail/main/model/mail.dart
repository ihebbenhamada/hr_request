class Mail {
  final int id;
  final int fKHrEmployeeId;
  final String senderName;
  final String subject;
  final String description;
  final String reply;
  final String filePath;
  final int fKReqStatusId;
  final int? fKCreatorId;
  final int? parentId;
  final String creationDate;
  final String lastModifiedDate;
  final bool isActive;
  final bool isDeleted;
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
      id: json['Id'] as int,
      fKHrEmployeeId: json['FK_HrEmployeeId'] as int,
      senderName: json['SenderName'] as String,
      subject: json['Subject'] as String,
      description: json['Description'] as String,
      reply: json['Reply'] as String,
      filePath: json['FilePath'] as String,
      fKReqStatusId: json['FK_ReqStatusId'] as int,
      fKCreatorId: json['FK_CreatorId'] as int?,
      parentId: json['ParentId'] as int?,
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      isActive: json['IsActive'] as bool,
      isDeleted: json['IsDeleted'] as bool,
      isSelected: false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['FK_HrEmployeeId'] = fKHrEmployeeId;
    data['SenderName'] = senderName;
    data['Subject'] = subject;
    data['Description'] = description;
    data['Reply'] = reply;
    data['FilePath'] = filePath;
    data['FK_ReqStatusId'] = fKReqStatusId;
    data['FK_CreatorId'] = fKCreatorId;
    data['ParentId'] = parentId;
    data['CreationDate'] = creationDate;
    data['LastModifiedDate'] = lastModifiedDate;
    data['IsActive'] = isActive;
    data['IsDeleted'] = isDeleted;
    return data;
  }
}
