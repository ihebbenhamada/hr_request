class GetCreateFirstStep {
  final int? id;
  final int? fKHrEmployeeId;
  final int? fKReqFinalExitId;
  final String? employeeName;
  final String? employeeNameEn;
  final String? creationDate;
  final String? quitDate;
  final String? lastWorkingDayDate;
  final bool? hasCommitment;
  final String? phone;
  final String? mobile;
  final String? address;
  final String? lastModifiedDate;
  final bool? isActive;
  final bool? isDeleted;

  GetCreateFirstStep({
    this.employeeNameEn,
    this.id,
    this.fKHrEmployeeId,
    this.fKReqFinalExitId,
    this.employeeName,
    this.creationDate,
    this.quitDate,
    this.lastWorkingDayDate,
    this.hasCommitment,
    this.phone,
    this.mobile,
    this.address,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
  });

  factory GetCreateFirstStep.fromJson(Map<String, dynamic> json) {
    return GetCreateFirstStep(
      id: json['id'] as int?,
      fKHrEmployeeId: json['fK_HrEmployeeId'] as int?,
      fKReqFinalExitId: json['fK_ReqFinalExitId'] as int?,
      employeeName: json['employeeName'] as String?,
      employeeNameEn: json['employeeNameEn'] as String?,
      creationDate: json['creationDate'] as String?,
      quitDate: json['quitDate'] as String?,
      lastWorkingDayDate: json['lastWorkingDayDate'] as String?,
      hasCommitment: json['hasCommitment'] as bool?,
      phone: json['phone'] as String?,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fK_HrEmployeeId': fKHrEmployeeId,
      'fK_ReqFinalExitId': fKReqFinalExitId,
      'employeeName': employeeName,
      'employeeNameEn': employeeNameEn,
      'creationDate': creationDate,
      'quitDate': quitDate,
      'lastWorkingDayDate': lastWorkingDayDate,
      'hasCommitment': hasCommitment,
      'phone': phone,
      'mobile': mobile,
      'address': address,
      'lastModifiedDate': lastModifiedDate,
      'isActive': isActive,
      'isDeleted': isDeleted,
    };
  }
}
