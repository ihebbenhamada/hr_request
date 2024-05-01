import 'dart:convert';

import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

class CreateLoan {
  int? id;
  int? reqLoanId;
  int? fKHrEmployeeId;
  int? paymentType;
  String? loanDate;
  int? totalAmount;
  String? subject;
  String? description;
  String? creationDate;
  String? lastModifiedDate;
  bool? isActive;
  bool? isDeleted;
  bool? isGeneralManager;
  bool? isFinancialDirector;
  bool? isGeneralDirector;
  int? fKGeneralManagerId;
  int? fKFinancialDirectorId;
  int? fKGeneralDirectorId;
  String? generalManager;
  String? financialDirector;
  String? generalDirector;
  String? employeeName;
  int? fKReqStatusId;
  List<DropDownModel> paymentTypes;
  String? paymentTypeName;
  String? employeeSignature;
  String? departmentManagerSignature;
  String? generalManagerSignature;
  String? employeeCode;
  String? department;
  String? message;

  CreateLoan({
    this.id,
    this.reqLoanId,
    this.fKHrEmployeeId,
    this.paymentType,
    this.loanDate,
    this.totalAmount,
    this.subject,
    this.description,
    this.creationDate,
    this.lastModifiedDate,
    this.isActive,
    this.isDeleted,
    this.isGeneralManager,
    this.isFinancialDirector,
    this.isGeneralDirector,
    this.fKGeneralManagerId,
    this.fKFinancialDirectorId,
    this.fKGeneralDirectorId,
    this.generalManager,
    this.financialDirector,
    this.generalDirector,
    this.employeeName,
    this.fKReqStatusId,
    required this.paymentTypes,
    this.paymentTypeName,
    this.employeeSignature,
    this.departmentManagerSignature,
    this.generalManagerSignature,
    this.employeeCode,
    this.department,
    this.message,
  });

  factory CreateLoan.fromRawJson(String str) =>
      CreateLoan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateLoan.fromJson(Map<String, dynamic> json) => CreateLoan(
        id: json["id"],
        reqLoanId: json["reqLoanId"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        paymentType: json["paymentType"],
        loanDate: json["loanDate"],
        totalAmount: json["totalAmount"],
        subject: json["subject"],
        description: json["description"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        isGeneralManager: json["isGeneralManager"],
        isFinancialDirector: json["isFinancialDirector"],
        isGeneralDirector: json["isGeneralDirector"],
        fKGeneralManagerId: json["fK_GeneralManagerId"],
        fKFinancialDirectorId: json["fK_FinancialDirectorId"],
        fKGeneralDirectorId: json["fK_GeneralDirectorId"],
        generalManager: json["generalManager"],
        financialDirector: json["financialDirector"],
        generalDirector: json["generalDirector"],
        employeeName: json["employeeName"],
        fKReqStatusId: json["fK_ReqStatusId"],
        paymentTypes: List<DropDownModel>.from(
            json["paymentTypes"].map((x) => DropDownModel.fromJson(x))),
        paymentTypeName: json["paymentTypeName"],
        employeeSignature: json["employeeSignature"],
        departmentManagerSignature: json["departmentManagerSignature"],
        generalManagerSignature: json["generalManagerSignature"],
        employeeCode: json["employeeCode"],
        department: json["department"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reqLoanId": reqLoanId,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "paymentType": paymentType,
        "loanDate": loanDate,
        "totalAmount": totalAmount,
        "subject": subject,
        "description": description,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "isGeneralManager": isGeneralManager,
        "isFinancialDirector": isFinancialDirector,
        "isGeneralDirector": isGeneralDirector,
        "fK_GeneralManagerId": fKGeneralManagerId,
        "fK_FinancialDirectorId": fKFinancialDirectorId,
        "fK_GeneralDirectorId": fKGeneralDirectorId,
        "generalManager": generalManager,
        "financialDirector": financialDirector,
        "generalDirector": generalDirector,
        "employeeName": employeeName,
        "fK_ReqStatusId": fKReqStatusId,
        "paymentTypes":
            List<PaymentType>.from(paymentTypes!.map((x) => x.toJson())),
        "paymentTypeName": paymentTypeName,
        "employeeSignature": employeeSignature,
        "departmentManagerSignature": departmentManagerSignature,
        "generalManagerSignature": generalManagerSignature,
        "employeeCode": employeeCode,
        "department": department,
        "message": message,
      };
}

class PaymentType {
  bool disabled;
  dynamic group;
  bool selected;
  String text;
  String value;

  PaymentType({
    required this.disabled,
    required this.group,
    required this.selected,
    required this.text,
    required this.value,
  });

  factory PaymentType.fromRawJson(String str) =>
      PaymentType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        disabled: json["disabled"],
        group: json["group"],
        selected: json["selected"],
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "disabled": disabled,
        "group": group,
        "selected": selected,
        "text": text,
        "value": value,
      };
}
