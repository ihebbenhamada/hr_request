import 'dart:convert';

class EvaluationForm {
  int id;
  int? evaluationId;
  int fKEvaluationFormId;
  int? fKEvaluatedById;
  String? evaluatedByName;
  String? evaluatedByNameEn;
  String? submitType;
  String? formName;
  String? formNameEn;
  int? fKManagingDirectorId;
  int fKEvaluatedEmployeeId;
  String? evaluatedEmployeeName;
  String? evaluatedEmployeeNameEn;
  String evaluationDate;
  int fKCreatorId;
  int fKReqStatusId;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
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
  int jobType;
  List<dynamic> employees;
  List<dynamic> files;
  List<dynamic> formItems;
  List<Evaluation> evaluationScale;
  dynamic details;
  List<Evaluation> evaluationMainItems;
  List<RecommendationItem> recommendationItems;
  List<dynamic> hrEmployeeEvaluationDetails;
  dynamic defBranchVm;
  String resultMessage;
  bool resultStatus;

  EvaluationForm({
    required this.id,
    required this.evaluationId,
    required this.fKEvaluationFormId,
    required this.fKEvaluatedById,
    required this.evaluatedByName,
    required this.evaluatedByNameEn,
    required this.submitType,
    required this.formName,
    required this.formNameEn,
    required this.fKManagingDirectorId,
    required this.fKEvaluatedEmployeeId,
    required this.evaluatedEmployeeName,
    required this.evaluatedEmployeeNameEn,
    required this.evaluationDate,
    required this.fKCreatorId,
    required this.fKReqStatusId,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.totalDegreeScale,
    required this.isEmployeeApprove,
    required this.employeeApproveDate,
    required this.employeeNotes,
    required this.employeeSigniture,
    required this.employeeName,
    required this.hasDepartmetDirector,
    required this.isDepartmetDirectorApprove,
    required this.departmetApproveDate,
    required this.departmetDirectorNotes,
    required this.departmetDirectorSigniture,
    required this.departmetDirectorName,
    required this.hasManagingDirector,
    required this.isManagingDirectorApprove,
    required this.approveDate,
    required this.managingDirectorNotes,
    required this.managingDirectorSigniture,
    required this.managingDirectorName,
    required this.hasGeneralManager,
    required this.isGeneralManagerApprove,
    required this.generalManagerApproveDate,
    required this.generalManagerNotes,
    required this.generalManagerSigniture,
    required this.generalManagerName,
    required this.jobType,
    required this.employees,
    required this.files,
    required this.formItems,
    required this.evaluationScale,
    required this.details,
    required this.evaluationMainItems,
    required this.recommendationItems,
    required this.hrEmployeeEvaluationDetails,
    required this.defBranchVm,
    required this.resultMessage,
    required this.resultStatus,
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
        hrEmployeeEvaluationDetails: List<dynamic>.from(
            json["hrEmployeeEvaluationDetails"].map((x) => x)),
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
        "employees": List<dynamic>.from(employees.map((x) => x)),
        "files": List<dynamic>.from(files.map((x) => x)),
        "formItems": List<dynamic>.from(formItems.map((x) => x)),
        "evaluationScale":
            List<dynamic>.from(evaluationScale.map((x) => x.toJson())),
        "details": details,
        "evaluationMainItems":
            List<dynamic>.from(evaluationMainItems.map((x) => x.toJson())),
        "recommendationItems":
            List<dynamic>.from(recommendationItems.map((x) => x.toJson())),
        "hrEmployeeEvaluationDetails":
            List<dynamic>.from(hrEmployeeEvaluationDetails.map((x) => x)),
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
  DateTime creationDate;
  DateTime lastModifiedDate;
  bool isActive;
  bool isDeleted;
  List<EvaluationItem>? evaluationItems;
  int? degree;

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
    this.evaluationItems,
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
        creationDate: DateTime.parse(json["creationDate"]),
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
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
        "creationDate": creationDate.toIso8601String(),
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
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
  bool isAnswerTextArea;
  bool description;
  int sort;
  bool isGenerale;
  int fKDefBranchId;
  int fKCreatorId;
  DateTime creationDate;
  DateTime lastModifiedDate;
  bool isActive;
  bool isDeleted;

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
        creationDate: DateTime.parse(json["creationDate"]),
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
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
        "creationDate": creationDate.toIso8601String(),
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "isActive": isActive,
        "isDeleted": isDeleted,
      };
}

class RecommendationItem {
  int id;
  String evaluationItemAr;
  String evaluationItemEn;
  int fKHrEvaluationMainItemId;
  int fKHrEvaluationTypeId;
  int fKHrEvaluationFormItemId;
  bool isAnswerCheckBox;
  bool isAnswerTextArea;
  String description;
  int sort;
  bool isGenerale;
  int fKDefBranchId;
  int fKCreatorId;
  DateTime creationDate;
  DateTime lastModifiedDate;
  bool isActive;
  bool isDeleted;
  bool checked;
  String recommendationText;
  String fKHrEvaluationScaleId;

  RecommendationItem({
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
    required this.recommendationText,
    required this.fKHrEvaluationScaleId,
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
        creationDate: DateTime.parse(json["creationDate"]),
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
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
        "creationDate": creationDate.toIso8601String(),
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "isActive": isActive,
        "isDeleted": isDeleted,
        "checked": checked,
        "recommendationText": recommendationText,
        "fK_HrEvaluationScaleId": fKHrEvaluationScaleId,
      };
}
