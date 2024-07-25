import 'dart:convert';

class EvaluationForm {
  int? id;
  int? evaluationId;
  int? fKEvaluationFormId;
  int? fKEvaluatedById;
  String? evaluatedByName;
  String? evaluatedByNameEn;
  String? submitType;
  String? formName;
  String? formNameEn;
  int? fKManagingDirectorId;
  int? fKEvaluatedEmployeeId;
  String? evaluatedEmployeeName;
  String? evaluatedEmployeeNameEn;
  String? evaluationDate;
  int? fKCreatorId;
  int? fKReqStatusId;
  String? creationDate;
  String? lastModifiedDate;
  bool? isActive;
  bool? isDeleted;
  double? totalDegreeScale;
  bool? isEmployeeApprove;
  String? employeeApproveDate;
  String? employeeNotes;
  String? employeeSigniture;
  String? employeeName;
  bool? hasDepartmetDirector;
  bool? isDepartmetDirectorApprove;
  String? departmetApproveDate;
  String? departmetDirectorNotes;
  String? departmetDirectorSigniture;
  String? departmetDirectorName;
  bool? hasManagingDirector;
  bool? isManagingDirectorApprove;
  String? approveDate;
  String? managingDirectorNotes;
  String? managingDirectorSigniture;
  String? managingDirectorName;
  bool? hasGeneralManager;
  bool? isGeneralManagerApprove;
  String? generalManagerApproveDate;
  String? generalManagerNotes;
  String? generalManagerSigniture;
  String? generalManagerName;
  int? jobType;
  List<dynamic>? employees;
  List<dynamic>? files;
  List<dynamic>? formItems;
  List<Evaluation>? evaluationScale;
  dynamic? details;
  List<Evaluation>? evaluationMainItems;
  List<RecommendationItem>? recommendationItems;
  List<HrEmployeeEvaluationDetails>? hrEmployeeEvaluationDetails;
  dynamic defBranchVm;
  String? resultMessage;
  bool? resultStatus;

  EvaluationForm({
    this.id,
    this.evaluationId,
    this.fKEvaluationFormId,
    this.fKEvaluatedById,
    this.evaluatedByName,
    this.evaluatedByNameEn,
    this.submitType,
    this.formName,
    this.formNameEn,
    this.fKManagingDirectorId,
    this.fKEvaluatedEmployeeId,
    this.evaluatedEmployeeName,
    this.evaluatedEmployeeNameEn,
    this.evaluationDate,
    this.fKCreatorId,
    this.fKReqStatusId,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
    this.totalDegreeScale,
    this.isEmployeeApprove,
    this.employeeApproveDate,
    this.employeeNotes,
    this.employeeSigniture,
    this.employeeName,
    this.hasDepartmetDirector,
    this.isDepartmetDirectorApprove,
    this.departmetApproveDate,
    this.departmetDirectorNotes,
    this.departmetDirectorSigniture,
    this.departmetDirectorName,
    this.hasManagingDirector,
    this.isManagingDirectorApprove,
    this.approveDate,
    this.managingDirectorNotes,
    this.managingDirectorSigniture,
    this.managingDirectorName,
    this.hasGeneralManager,
    this.isGeneralManagerApprove,
    this.generalManagerApproveDate,
    this.generalManagerNotes,
    this.generalManagerSigniture,
    this.generalManagerName,
    this.jobType,
    this.employees,
    this.files,
    this.formItems,
    this.evaluationScale,
    this.details,
    this.evaluationMainItems,
    this.recommendationItems,
    this.hrEmployeeEvaluationDetails,
    this.defBranchVm,
    this.resultMessage,
    this.resultStatus,
  });

  factory EvaluationForm.fromRawJson(String str) =>
      EvaluationForm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EvaluationForm.fromJson(Map<String, dynamic> json) => EvaluationForm(
        id: json["id"],
        evaluationId: json["evaluationId"],
        fKEvaluationFormId: json["fK_EvaluationFormId"],
        fKEvaluatedById: json["fK_EvaluatedById"],
        evaluatedByName: json["evaluatedByName"],
        evaluatedByNameEn: json["evaluatedByNameEn"],
        submitType: json["submitType"],
        formName: json["formName"],
        formNameEn: json["formNameEn"],
        fKManagingDirectorId: json["fK_ManagingDirectorId"],
        fKEvaluatedEmployeeId: json["fK_EvaluatedEmployeeId"],
        evaluatedEmployeeName: json["evaluatedEmployeeName"],
        evaluatedEmployeeNameEn: json["evaluatedEmployeeNameEn"],
        evaluationDate: json["evaluationDate"],
        fKCreatorId: json["fK_CreatorId"],
        fKReqStatusId: json["fK_ReqStatusId"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        totalDegreeScale: json["totalDegreeScale"],
        isEmployeeApprove: json["isEmployeeApprove"],
        employeeApproveDate: json["employeeApproveDate"],
        employeeNotes: json["employeeNotes"],
        employeeSigniture: json["employeeSigniture"],
        employeeName: json["employeeName"],
        hasDepartmetDirector: json["hasDepartmetDirector"],
        isDepartmetDirectorApprove: json["isDepartmetDirectorApprove"],
        departmetApproveDate: json["departmetApproveDate"],
        departmetDirectorNotes: json["departmetDirectorNotes"],
        departmetDirectorSigniture: json["departmetDirectorSigniture"],
        departmetDirectorName: json["departmetDirectorName"],
        hasManagingDirector: json["hasManagingDirector"],
        isManagingDirectorApprove: json["isManagingDirectorApprove"],
        approveDate: json["approveDate"],
        managingDirectorNotes: json["managingDirectorNotes"],
        managingDirectorSigniture: json["managingDirectorSigniture"],
        managingDirectorName: json["managingDirectorName"],
        hasGeneralManager: json["hasGeneralManager"],
        isGeneralManagerApprove: json["isGeneralManagerApprove"],
        generalManagerApproveDate: json["generalManagerApproveDate"],
        generalManagerNotes: json["generalManagerNotes"],
        generalManagerSigniture: json["generalManagerSigniture"],
        generalManagerName: json["generalManagerName"],
        jobType: json["jobType"],
        employees: List<dynamic>.from(json["employees"].map((x) => x)),
        files: List<dynamic>.from(json["files"].map((x) => x)),
        formItems: List<dynamic>.from(json["formItems"].map((x) => x)),
        evaluationScale: List<Evaluation>.from(
            json["evaluationScale"].map((x) => Evaluation.fromJson(x))),
        details: json["details"],
        evaluationMainItems: List<Evaluation>.from(
            json["evaluationMainItems"].map((x) => Evaluation.fromJson(x))),
        recommendationItems: List<RecommendationItem>.from(
            json["recommendationItems"]
                .map((x) => RecommendationItem.fromJson(x))),
        hrEmployeeEvaluationDetails: json["hrEmployeeEvaluationDetails"] != null
            ? List<HrEmployeeEvaluationDetails>.from(
                json["hrEmployeeEvaluationDetails"]
                    .map((x) => HrEmployeeEvaluationDetails.fromJson(x)))
            : null,
        defBranchVm: json["defBranchVM"],
        resultMessage: json["resultMessage"],
        resultStatus: json["resultStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "evaluationId": evaluationId,
        "fK_EvaluationFormId": fKEvaluationFormId,
        "fK_EvaluatedById": fKEvaluatedById,
        "evaluatedByName": evaluatedByName,
        "evaluatedByNameEn": evaluatedByNameEn,
        "submitType": submitType,
        "formName": formName,
        "formNameEn": formNameEn,
        "fK_ManagingDirectorId": fKManagingDirectorId,
        "fK_EvaluatedEmployeeId": fKEvaluatedEmployeeId,
        "evaluatedEmployeeName": evaluatedEmployeeName,
        "evaluatedEmployeeNameEn": evaluatedEmployeeNameEn,
        "evaluationDate": evaluationDate,
        "fK_CreatorId": fKCreatorId,
        "fK_ReqStatusId": fKReqStatusId,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "totalDegreeScale": totalDegreeScale,
        "isEmployeeApprove": isEmployeeApprove,
        "employeeApproveDate": employeeApproveDate,
        "employeeNotes": employeeNotes,
        "employeeSigniture": employeeSigniture,
        "employeeName": employeeName,
        "hasDepartmetDirector": hasDepartmetDirector,
        "isDepartmetDirectorApprove": isDepartmetDirectorApprove,
        "departmetApproveDate": departmetApproveDate,
        "departmetDirectorNotes": departmetDirectorNotes,
        "departmetDirectorSigniture": departmetDirectorSigniture,
        "departmetDirectorName": departmetDirectorName,
        "hasManagingDirector": hasManagingDirector,
        "isManagingDirectorApprove": isManagingDirectorApprove,
        "approveDate": approveDate,
        "managingDirectorNotes": managingDirectorNotes,
        "managingDirectorSigniture": managingDirectorSigniture,
        "managingDirectorName": managingDirectorName,
        "hasGeneralManager": hasGeneralManager,
        "isGeneralManagerApprove": isGeneralManagerApprove,
        "generalManagerApproveDate": generalManagerApproveDate,
        "generalManagerNotes": generalManagerNotes,
        "generalManagerSigniture": generalManagerSigniture,
        "generalManagerName": generalManagerName,
        "jobType": jobType,
        "employees": employees != null
            ? List<dynamic>.from(employees!.map((x) => x))
            : [],
        "files": files != null ? List<dynamic>.from(files!.map((x) => x)) : [],
        "formItems": formItems != null
            ? List<dynamic>.from(formItems!.map((x) => x))
            : [],
        "evaluationScale": evaluationScale != null
            ? List<dynamic>.from(evaluationScale!.map((x) => x.toJson()))
            : [],
        "details": details,
        "evaluationMainItems": evaluationMainItems != null
            ? List<dynamic>.from(evaluationMainItems!.map((x) => x.toJson()))
            : [],
        "recommendationItems": recommendationItems != null
            ? List<dynamic>.from(recommendationItems!.map((x) => x.toJson()))
            : [],
        "hrEmployeeEvaluationDetails": hrEmployeeEvaluationDetails != null
            ? List<dynamic>.from(hrEmployeeEvaluationDetails!.map((x) => x))
            : null,
        "defBranchVM": defBranchVm,
        "resultMessage": resultMessage,
        "resultStatus": resultStatus,
      };
}

class Evaluation {
  int id;
  String nameAr;
  String nameEn;
  int? sort;
  int fKDefBranchId;
  bool isGenerale;
  int fKCreatorId;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  List<EvaluationItem> evaluationItems;
  double? degree;

  Evaluation({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.sort,
    required this.fKDefBranchId,
    required this.isGenerale,
    required this.fKCreatorId,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.evaluationItems,
    this.degree,
  });

  factory Evaluation.fromRawJson(String str) =>
      Evaluation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Evaluation.fromJson(Map<String, dynamic> json) => Evaluation(
        id: json["id"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        sort: json["sort"],
        fKDefBranchId: json["fK_DefBranchId"],
        isGenerale: json["isGenerale"],
        fKCreatorId: json["fK_CreatorId"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        evaluationItems: json["evaluationItems"] == null
            ? []
            : List<EvaluationItem>.from(json["evaluationItems"]!
                .map((x) => EvaluationItem.fromJson(x))),
        degree: json["degree"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "sort": sort,
        "fK_DefBranchId": fKDefBranchId,
        "isGenerale": isGenerale,
        "fK_CreatorId": fKCreatorId,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "evaluationItems": evaluationItems == null
            ? []
            : List<dynamic>.from(evaluationItems!.map((x) => x.toJson())),
        "degree": degree,
      };
}

class EvaluationItem {
  int id;
  String evaluationItemAr;
  String evaluationItemEn;
  int fKHrEvaluationMainItemId;
  int fKHrEvaluationTypeId;
  int fKHrEvaluationFormItemId;
  bool isAnswerCheckBox;
  bool? isAnswerTextArea;
  bool? description;
  int sort;
  bool isGenerale;
  int fKDefBranchId;
  int fKCreatorId;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  bool checked;
  String? recommendationText;
  int? fKHrEvaluationScaleId;

  EvaluationItem({
    required this.id,
    required this.evaluationItemAr,
    required this.evaluationItemEn,
    required this.fKHrEvaluationMainItemId,
    required this.fKHrEvaluationTypeId,
    required this.fKHrEvaluationFormItemId,
    required this.isAnswerCheckBox,
    required this.isAnswerTextArea,
    required this.description,
    required this.sort,
    required this.isGenerale,
    required this.fKDefBranchId,
    required this.fKCreatorId,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.checked,
    required this.fKHrEvaluationScaleId,
    required this.recommendationText,
  });

  factory EvaluationItem.fromRawJson(String str) =>
      EvaluationItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EvaluationItem.fromJson(Map<String, dynamic> json) => EvaluationItem(
        id: json["id"],
        evaluationItemAr: json["evaluationItemAr"],
        evaluationItemEn: json["evaluationItemEn"],
        fKHrEvaluationMainItemId: json["fK_HrEvaluationMainItemId"],
        fKHrEvaluationTypeId: json["fK_HrEvaluationTypeId"],
        fKHrEvaluationFormItemId: json["fK_HrEvaluationFormItemId"],
        isAnswerCheckBox: json["isAnswerCheckBox"],
        isAnswerTextArea: json["isAnswerTextArea"],
        description: json["description"],
        sort: json["sort"],
        isGenerale: json["isGenerale"],
        fKDefBranchId: json["fK_DefBranchId"],
        fKCreatorId: json["fK_CreatorId"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        checked: json["checked"],
        recommendationText: json["recommendationText"],
        fKHrEvaluationScaleId: json["fK_HrEvaluationScaleId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "evaluationItemAr": evaluationItemAr,
        "evaluationItemEn": evaluationItemEn,
        "fK_HrEvaluationMainItemId": fKHrEvaluationMainItemId,
        "fK_HrEvaluationTypeId": fKHrEvaluationTypeId,
        "fK_HrEvaluationFormItemId": fKHrEvaluationFormItemId,
        "isAnswerCheckBox": isAnswerCheckBox,
        "isAnswerTextArea": isAnswerTextArea,
        "description": description,
        "sort": sort,
        "isGenerale": isGenerale,
        "fK_DefBranchId": fKDefBranchId,
        "fK_CreatorId": fKCreatorId,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
      };
}

class RecommendationItem {
  int? id;
  String? evaluationItemAr;
  String? evaluationItemEn;
  int? fKHrEvaluationMainItemId;
  int? fKHrEvaluationTypeId;
  int? fKHrEvaluationFormItemId;
  bool? isAnswerCheckBox;
  bool? isAnswerTextArea;
  String? description;
  int? sort;
  bool? isGenerale;
  int? fKDefBranchId;
  int? fKCreatorId;
  String? creationDate;
  String? lastModifiedDate;
  bool? isActive;
  bool? isDeleted;
  bool? checked;
  String? recommendationText;
  String? fKHrEvaluationScaleId;

  RecommendationItem({
    this.id,
    this.evaluationItemAr,
    this.evaluationItemEn,
    this.fKHrEvaluationMainItemId,
    this.fKHrEvaluationTypeId,
    this.fKHrEvaluationFormItemId,
    this.isAnswerCheckBox,
    this.isAnswerTextArea,
    this.description,
    this.sort,
    this.isGenerale,
    this.fKDefBranchId,
    this.fKCreatorId,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
    this.checked,
    this.recommendationText,
    this.fKHrEvaluationScaleId,
  });

  factory RecommendationItem.fromRawJson(String str) =>
      RecommendationItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendationItem.fromJson(Map<String, dynamic> json) =>
      RecommendationItem(
        id: json["id"],
        evaluationItemAr: json["evaluationItemAr"],
        evaluationItemEn: json["evaluationItemEn"],
        fKHrEvaluationMainItemId: json["fK_HrEvaluationMainItemId"],
        fKHrEvaluationTypeId: json["fK_HrEvaluationTypeId"],
        fKHrEvaluationFormItemId: json["fK_HrEvaluationFormItemId"],
        isAnswerCheckBox: json["isAnswerCheckBox"],
        isAnswerTextArea: json["isAnswerTextArea"],
        description: json["description"],
        sort: json["sort"],
        isGenerale: json["isGenerale"],
        fKDefBranchId: json["fK_DefBranchId"],
        fKCreatorId: json["fK_CreatorId"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        checked: json["checked"],
        recommendationText: json["recommendationText"],
        fKHrEvaluationScaleId: json["fK_HrEvaluationScaleId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "evaluationItemAr": evaluationItemAr,
        "evaluationItemEn": evaluationItemEn,
        "fK_HrEvaluationMainItemId": fKHrEvaluationMainItemId,
        "fK_HrEvaluationTypeId": fKHrEvaluationTypeId,
        "fK_HrEvaluationFormItemId": fKHrEvaluationFormItemId,
        "isAnswerCheckBox": isAnswerCheckBox,
        "isAnswerTextArea": isAnswerTextArea,
        "description": description,
        "sort": sort,
        "isGenerale": isGenerale,
        "fK_DefBranchId": fKDefBranchId,
        "fK_CreatorId": fKCreatorId,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "checked": checked,
        "recommendationText": recommendationText,
        "fK_HrEvaluationScaleId": fKHrEvaluationScaleId,
      };
}

class HrEmployeeEvaluationDetails {
  int? id;
  int? fKHrEmployeeEvaluationId;
  int? fKHrEvaluationFormItemId;
  int? fKHrEvaluationScaleId;
  EvaluationItem? evaluationItem;
  String? scaleName;
  double? degreeScale;
  String? recommendationText;
  int? fKCreatorId;
  String? creationDate;
  String? lastModifiedDate;
  bool? isActive;
  bool? isDeleted;

  HrEmployeeEvaluationDetails({
    this.id,
    this.fKHrEmployeeEvaluationId,
    this.fKHrEvaluationFormItemId,
    this.fKHrEvaluationScaleId,
    this.evaluationItem,
    this.scaleName,
    this.degreeScale,
    this.recommendationText,
    this.fKCreatorId,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
  });

  factory HrEmployeeEvaluationDetails.fromRawJson(String str) =>
      HrEmployeeEvaluationDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HrEmployeeEvaluationDetails.fromJson(Map<String, dynamic> json) =>
      HrEmployeeEvaluationDetails(
        id: json["id"] as int?,
        degreeScale: json["degreeScale"] as double?,
        evaluationItem: json["evaluationItem"] as EvaluationItem?,
        fKHrEmployeeEvaluationId: json["fK_HrEmployeeEvaluationId"] as int?,
        scaleName: json["scaleName"] as String?,
        fKHrEvaluationFormItemId: json["fK_HrEvaluationFormItemId"] as int?,
        fKCreatorId: json["fK_CreatorId"] as int?,
        creationDate: json["creationDate"] as String?,
        lastModifiedDate: json["lastModifiedDate"] as String?,
        isActive: json["isActive"] as bool?,
        isDeleted: json["isDeleted"] as bool?,
        recommendationText: json["recommendationText"] as String?,
        fKHrEvaluationScaleId: json["fK_HrEvaluationScaleId"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "degreeScale": degreeScale,
        "scaleName": scaleName,
        "evaluationItem": evaluationItem,
        "fK_HrEvaluationFormItemId": fKHrEvaluationFormItemId,
        "fK_HrEmployeeEvaluationId": fKHrEmployeeEvaluationId,
        "fK_CreatorId": fKCreatorId,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "recommendationText": recommendationText,
        "fK_HrEvaluationScaleId": fKHrEvaluationScaleId,
      };
}
