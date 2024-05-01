class Evaluation {
  final int? id;
  final int? fKEvaluationFormId;
  final String? evaluationFormName;
  final int? fKEvaluatedById;
  final int? fKEvaluatedEmployeeId;
  final String? evaluationDate;
  final int? fKReqStatusId;
  final String? formName;
  final String? evaluatedByName;
  final String? evaluatedByPosition;
  final String? evaluatedByImagePath;
  final int? fKManagingDirectorId;
  final String? evaluatedEmployee;
  final bool? isManagingDirectorApprove;
  final String? approveDate;
  final String? managingDirectorNotes;
  final String? managingDirectorSigniture;
  final String? managingDirectorName;
  final int? fKCreatorId;
  final String? creationDate;
  final String? lastModifiedDate;
  final bool? isActive;
  final bool? isDeleted;
  final int? fKReqActivityStatusId;
  final bool? isEmployeeApprove;
  final String? employeeApproveDate;
  final String? employeeNotes;
  final String? employeeSigniture;
  final String? employeeName;
  final bool? isDepartmetDirectorApprove;
  final String? departmetApproveDate;
  final String? departmetDirectorNotes;
  final String? departmetDirectorSigniture;
  final String? departmetDirectorName;
  final bool? isGeneralManagerApprove;
  final String? generalManagerApproveDate;
  final String? generalManagerNotes;
  final String? generalManagerSigniture;
  final String? generalManagerName;

  Evaluation(
      {this.id,
      this.fKEvaluationFormId,
      this.evaluationFormName,
      this.fKEvaluatedById,
      this.fKEvaluatedEmployeeId,
      this.evaluationDate,
      this.fKReqStatusId,
      this.formName,
      this.evaluatedByName,
      this.evaluatedByPosition,
      this.evaluatedByImagePath,
      this.fKManagingDirectorId,
      this.evaluatedEmployee,
      this.isManagingDirectorApprove,
      this.approveDate,
      this.managingDirectorNotes,
      this.managingDirectorSigniture,
      this.managingDirectorName,
      this.fKCreatorId,
      this.creationDate,
      this.lastModifiedDate,
      this.isActive,
      this.isDeleted,
      this.fKReqActivityStatusId,
      this.isEmployeeApprove,
      this.employeeApproveDate,
      this.employeeNotes,
      this.employeeSigniture,
      this.employeeName,
      this.isDepartmetDirectorApprove,
      this.departmetApproveDate,
      this.departmetDirectorNotes,
      this.departmetDirectorSigniture,
      this.departmetDirectorName,
      this.isGeneralManagerApprove,
      this.generalManagerApproveDate,
      this.generalManagerNotes,
      this.generalManagerSigniture,
      this.generalManagerName});

  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      id: json['id'] as int?,
      fKEvaluationFormId: json['fK_EvaluationFormId'] as int?,
      evaluationFormName: json['evaluationFormName'] as String?,
      fKEvaluatedById: json['fK_EvaluatedById'] as int?,
      fKEvaluatedEmployeeId: json['fK_EvaluatedEmployeeId'] as int?,
      evaluationDate: json['evaluationDate'] as String?,
      fKReqStatusId: json['fK_ReqStatusId'] as int?,
      formName: json['formName'] as String?,
      evaluatedByName: json['evaluatedByName'] as String?,
      evaluatedByPosition: json['evaluatedByPosition'] as String?,
      evaluatedByImagePath: json['evaluatedByImagePath'] as String?,
      fKManagingDirectorId: json['fK_ManagingDirectorId'] as int?,
      evaluatedEmployee: json['evaluatedEmployee'] as String?,
      isManagingDirectorApprove: json['isManagingDirectorApprove'] as bool?,
      approveDate: json['approveDate'] as String?,
      managingDirectorNotes: json['managingDirectorNotes'] as String?,
      managingDirectorSigniture: json['managingDirectorSigniture'] as String?,
      managingDirectorName: json['managingDirectorName'] as String?,
      fKCreatorId: json['fK_CreatorId'] as int?,
      creationDate: json['creationDate'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      isActive: json['isActive'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      fKReqActivityStatusId: json['fK_ReqActivityStatusId'] as int?,
      isEmployeeApprove: json['isEmployeeApprove'] as bool?,
      employeeApproveDate: json['employeeApproveDate'] as String?,
      employeeNotes: json['employeeNotes'] as String?,
      employeeSigniture: json['employeeSigniture'] as String?,
      employeeName: json['employeeName'] as String?,
      isDepartmetDirectorApprove: json['isDepartmetDirectorApprove'] as bool?,
      departmetApproveDate: json['departmetApproveDate'] as String?,
      departmetDirectorNotes: json['departmetDirectorNotes'] as String?,
      departmetDirectorSigniture: json['departmetDirectorSigniture'] as String?,
      departmetDirectorName: json['departmetDirectorName'] as String?,
      isGeneralManagerApprove: json['isGeneralManagerApprove'] as bool?,
      generalManagerApproveDate: json['generalManagerApproveDate'] as String?,
      generalManagerNotes: json['generalManagerNotes'] as String?,
      generalManagerSigniture: json['generalManagerSigniture'] as String?,
      generalManagerName: json['generalManagerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fK_EvaluationFormId'] = fKEvaluationFormId;
    data['evaluationFormName'] = evaluationFormName;
    data['fK_EvaluatedById'] = fKEvaluatedById;
    data['fK_EvaluatedEmployeeId'] = fKEvaluatedEmployeeId;
    data['evaluationDate'] = evaluationDate;
    data['fK_ReqStatusId'] = fKReqStatusId;
    data['formName'] = formName;
    data['evaluatedByName'] = evaluatedByName;
    data['evaluatedByPosition'] = evaluatedByPosition;
    data['evaluatedByImagePath'] = evaluatedByImagePath;
    data['fK_ManagingDirectorId'] = fKManagingDirectorId;
    data['evaluatedEmployee'] = evaluatedEmployee;
    data['isManagingDirectorApprove'] = isManagingDirectorApprove;
    data['approveDate'] = approveDate;
    data['managingDirectorNotes'] = managingDirectorNotes;
    data['managingDirectorSigniture'] = managingDirectorSigniture;
    data['managingDirectorName'] = managingDirectorName;
    data['fK_CreatorId'] = fKCreatorId;
    data['creationDate'] = creationDate;
    data['lastModifiedDate'] = lastModifiedDate;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    data['fK_ReqActivityStatusId'] = fKReqActivityStatusId;
    data['isEmployeeApprove'] = isEmployeeApprove;
    data['employeeApproveDate'] = employeeApproveDate;
    data['employeeNotes'] = employeeNotes;
    data['employeeSigniture'] = employeeSigniture;
    data['employeeName'] = employeeName;
    data['isDepartmetDirectorApprove'] = isDepartmetDirectorApprove;
    data['departmetApproveDate'] = departmetApproveDate;
    data['departmetDirectorNotes'] = departmetDirectorNotes;
    data['departmetDirectorSigniture'] = departmetDirectorSigniture;
    data['departmetDirectorName'] = departmetDirectorName;
    data['isGeneralManagerApprove'] = isGeneralManagerApprove;
    data['generalManagerApproveDate'] = generalManagerApproveDate;
    data['generalManagerNotes'] = generalManagerNotes;
    data['generalManagerSigniture'] = generalManagerSigniture;
    data['generalManagerName'] = generalManagerName;
    return data;
  }
}
