class Department {
  final int id;
  final int? fKDefBranchId;
  final String? departmentCode;
  final String? codeAndName;
  final String? departmentNameAr;
  final String? departmentNameEn;
  final int? fKManagerId;

  final String? description;
  final int? fKCreatorId;
  final int? fKModifiedById;
  final String? creationDate;
  final String? lastModifiedDate;
  final bool? isActive;
  final bool? isDeleted;

  Department({
    required this.id,
    this.fKDefBranchId,
    this.departmentCode,
    this.codeAndName,
    this.departmentNameAr,
    this.departmentNameEn,
    this.fKManagerId,
    this.description,
    this.fKCreatorId,
    this.fKModifiedById,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'] as int,
      fKDefBranchId: json['fK_DefBranchId'] as int?,
      departmentCode: json['departmentCode'] as String?,
      codeAndName: json['codeAndName'] as String?,
      departmentNameAr: json['departmentNameAr'] as String?,
      departmentNameEn: json['departmentNameEn'] as String?,
      fKManagerId: json['fK_ManagerId'] as int?,
      description: json['description'] as String?,
      fKCreatorId: json['fK_CreatorId'] as int?,
      fKModifiedById: json['fK_ModifiedById'] as int?,
      creationDate: json['creationDate'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fK_DefBranchId': fKDefBranchId,
      'departmentCode': departmentCode,
      'codeAndName': codeAndName,
      'departmentNameAr': departmentNameAr,
      'departmentNameEn': departmentNameEn,
      'fK_ManagerId': fKManagerId,
      'description': description,
      'fK_CreatorId': fKCreatorId,
      'fK_ModifiedById': fKModifiedById,
      'creationDate': creationDate,
      'lastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}
