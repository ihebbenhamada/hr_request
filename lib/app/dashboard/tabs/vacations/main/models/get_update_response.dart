// To parse this JSON data, do
//
//     final getUpdateVacationResponse = getUpdateVacationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

GetUpdateVacationResponse getUpdateVacationResponseFromJson(String str) =>
    GetUpdateVacationResponse.fromJson(json.decode(str));

String getUpdateVacationResponseToJson(GetUpdateVacationResponse data) =>
    json.encode(data.toJson());

class GetUpdateVacationResponse {
  int vacationId;
  int fKHrEmployeeId;
  String employeeNameAr;
  String employeeNameEn;
  int fKAlternativeEmployee;
  String alternativeEmployeeNameAr;
  String alternativeEmployeeNameEn;
  int fKAlternativeToPayingAnyDue;
  String alternativeToPayingEmployeeNameAr;
  String alternativeToPayingEmployeeNameEn;
  int fKHrVacationTypeId;
  String dateFrom;
  String dateTo;
  double consideredDays;
  int year;
  String description;
  String creationDate;
  String lastModifiedDate;
  bool isActive;
  bool isDeleted;
  bool canEdit;
  String dueDate;
  int fKReqStatusId;
  int vacationTypeId;
  String vacationTypeCode;
  String vacationTypeNameAr;
  String vacationTypeNameEn;
  String? vacationTypeDescription;
  List<DropDownModel> vacationTypes;
  List<DropDownModel> employees;
  dynamic message;

  GetUpdateVacationResponse({
    required this.vacationId,
    required this.fKHrEmployeeId,
    required this.employeeNameAr,
    required this.employeeNameEn,
    required this.fKAlternativeEmployee,
    required this.alternativeEmployeeNameAr,
    required this.alternativeEmployeeNameEn,
    required this.fKAlternativeToPayingAnyDue,
    required this.alternativeToPayingEmployeeNameAr,
    required this.alternativeToPayingEmployeeNameEn,
    required this.fKHrVacationTypeId,
    required this.dateFrom,
    required this.dateTo,
    required this.consideredDays,
    required this.year,
    required this.description,
    required this.creationDate,
    required this.lastModifiedDate,
    required this.isActive,
    required this.isDeleted,
    required this.canEdit,
    required this.dueDate,
    required this.fKReqStatusId,
    required this.vacationTypeId,
    required this.vacationTypeCode,
    required this.vacationTypeNameAr,
    required this.vacationTypeNameEn,
    required this.vacationTypeDescription,
    required this.vacationTypes,
    required this.employees,
    required this.message,
  });

  factory GetUpdateVacationResponse.fromJson(Map<String, dynamic> json) =>
      GetUpdateVacationResponse(
        vacationId: json["vacationId"],
        fKHrEmployeeId: json["fK_HrEmployeeId"],
        employeeNameAr: json["employeeNameAr"],
        employeeNameEn: json["employeeNameEn"],
        fKAlternativeEmployee: json["fK_AlternativeEmployee"],
        alternativeEmployeeNameAr: json["alternativeEmployeeNameAr"],
        alternativeEmployeeNameEn: json["alternativeEmployeeNameEn"],
        fKAlternativeToPayingAnyDue: json["fK_AlternativeToPayingAnyDue"],
        alternativeToPayingEmployeeNameAr:
            json["alternativeToPayingEmployeeNameAr"],
        alternativeToPayingEmployeeNameEn:
            json["alternativeToPayingEmployeeNameEn"],
        fKHrVacationTypeId: json["fK_HrVacationTypeId"],
        dateFrom: json["dateFrom"],
        dateTo: json["dateTo"],
        consideredDays: json["consideredDays"],
        year: json["year"],
        description: json["description"],
        creationDate: json["creationDate"],
        lastModifiedDate: json["lastModifiedDate"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        canEdit: json["canEdit"],
        dueDate: json["dueDate"],
        fKReqStatusId: json["fK_ReqStatusId"],
        vacationTypeId: json["vacationTypeId"],
        vacationTypeCode: json["vacationTypeCode"],
        vacationTypeNameAr: json["vacationTypeNameAr"],
        vacationTypeNameEn: json["vacationTypeNameEn"],
        vacationTypeDescription: json["vacationTypeDescription"],
        vacationTypes: List<DropDownModel>.from(
            json["vacationTypes"].map((x) => DropDownModel.fromJson(x))),
        employees: List<DropDownModel>.from(
            json["employees"].map((x) => DropDownModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "vacationId": vacationId,
        "fK_HrEmployeeId": fKHrEmployeeId,
        "employeeNameAr": employeeNameAr,
        "employeeNameEn": employeeNameEn,
        "fK_AlternativeEmployee": fKAlternativeEmployee,
        "alternativeEmployeeNameAr": alternativeEmployeeNameAr,
        "alternativeEmployeeNameEn": alternativeEmployeeNameEn,
        "fK_AlternativeToPayingAnyDue": fKAlternativeToPayingAnyDue,
        "alternativeToPayingEmployeeNameAr": alternativeToPayingEmployeeNameAr,
        "alternativeToPayingEmployeeNameEn": alternativeToPayingEmployeeNameEn,
        "fK_HrVacationTypeId": fKHrVacationTypeId,
        "dateFrom": dateFrom,
        "dateTo": dateTo,
        "consideredDays": consideredDays,
        "year": year,
        "description": description,
        "creationDate": creationDate,
        "lastModifiedDate": lastModifiedDate,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "canEdit": canEdit,
        "dueDate": dueDate,
        "fK_ReqStatusId": fKReqStatusId,
        "vacationTypeId": vacationTypeId,
        "vacationTypeCode": vacationTypeCode,
        "vacationTypeNameAr": vacationTypeNameAr,
        "vacationTypeNameEn": vacationTypeNameEn,
        "vacationTypeDescription": vacationTypeDescription,
        "vacationTypes":
            List<dynamic>.from(vacationTypes.map((x) => x.toJson())),
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
        "message": message,
      };
}
